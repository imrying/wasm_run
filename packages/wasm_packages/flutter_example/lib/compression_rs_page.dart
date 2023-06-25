import 'dart:typed_data';

import 'package:compression_rs/compression_rs.dart';
import 'package:file_system_access/file_system_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/compression_rs_state.dart';
import 'package:flutter_example/flutter_utils.dart';
import 'package:flutter_example/state.dart';
import 'package:wasm_wit_component/wasm_wit_component.dart';

class CompressionRsPage extends StatelessWidget {
  const CompressionRsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final compressionRsLoader =
        Inherited.get<GlobalState>(context).compressionRs;
    final state = compressionRsLoader.value;
    if (state == null) {
      return const CircularProgressIndicator();
    }

    void loadFiles() async {
      final files = await FileSystem.instance.showOpenFilePickerWebSafe(
        const FsOpenOptions(
          multiple: true,
          startIn: FsStartsInOptions.path(WellKnownDirectory.downloads),
        ),
      );
      for (final file in files) {
        final bytes = await file.file.readAsBytes();
        state.loadFile(file.file.name, bytes);
      }
    }

    const colWidth = 130.0;
    Widget compressFileView(InputFileState e) {
      return Row(
        children: [
          Column(
            children: [
              Text(e.name).subtitle(),
              DownloadFileButton(name: e.name, bytes: e.bytes),
              TextButton(
                onPressed: () => CompressorKind.values
                    .where((kind) => kind != CompressorKind.zstd)
                    .forEach((kind) => state.compress(e, kind)),
                child: const Text('Compress All'),
              ),
              const SizedBox(height: 12),
            ],
          ).container(width: 250),
          ...CompressorKind.values.map(
            (k) {
              final compressed = e.compressed[k];
              final decompressed = e.decompressed[k];

              return Column(
                children: [
                  if (compressed != null)
                    DownloadFileButton(
                      name: '${e.name}.${k.extensions.first}',
                      bytes: compressed,
                    )
                  else
                    TextButton(
                      onPressed: () => state.compress(e, k),
                      child: const Text('Compress'),
                    ),
                  if (decompressed != null)
                    DownloadFileButton(
                      name: removeExtension(
                        e.name,
                        k.extensions,
                      ),
                      bytes: decompressed,
                    )
                  else
                    TextButton(
                      onPressed: () => state.decompress(e, k),
                      child: const Text('Decompress'),
                    ),
                ],
              ).container(width: colWidth);
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => state.removeFile(e),
                icon: const Icon(Icons.delete),
              ),
              TextButton.icon(
                onPressed: () => state.extractArchive(e),
                label: const Text('Extract'),
                icon: const Icon(Icons.unarchive),
              ),
              const SizedBox(height: 10),
            ],
          ).container(width: 120),
        ],
      );
    }

    return LayoutBuilder(builder: (context, box) {
      Widget zipFileView(InputFileState e) {
        return Row(
          key: ValueKey((e, 'zip')),
          children: [
            Column(
              children: [
                Text(e.name).subtitle(),
                DownloadFileButton(name: e.name, bytes: e.bytes),
                const SizedBox(height: 12),
              ],
            ).container(width: 250),
            Expanded(
              child: Wrap(
                children: [
                  ...[
                    DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'Method'),
                      value: e.zipOptions.value.compressionMethod,
                      items: [
                        for (final v in ZipCompressionMethod.values)
                          DropdownMenuItem(
                            value: v,
                            child: Text(v.name),
                          ),
                      ],
                      onChanged: (v) => e.zipOptions.value =
                          e.zipOptions.value.copyWith(compressionMethod: v),
                    ),
                    IntInput(
                      label: 'Permissions',
                      initialValue: e.zipOptions.value.permissions,
                      onChanged: (v) => e.zipOptions.value =
                          e.zipOptions.value.copyWith(permissions: Some(v)),
                    ),
                    IntInput(
                      label: 'Modified Time',
                      initialValue:
                          e.zipOptions.value.lastModifiedTime?.toInt(),
                      onChanged: (v) => e.zipOptions.value = e.zipOptions.value
                          .copyWith(lastModifiedTime: Some(BigInt.from(v))),
                    ),
                    IntInput(
                      label: 'Compression Level',
                      initialValue:
                          e.zipOptions.value.compressionLevel?.toInt(),
                      onChanged: (v) => e.zipOptions.value = e.zipOptions.value
                          .copyWith(compressionLevel: Some(v)),
                    ),
                    TextFormField(
                      initialValue:
                          (e.zipOptions.value.comment as BytesOrUnicodeString?)
                              ?.value,
                      decoration: const InputDecoration(labelText: 'Comment'),
                      onChanged: (v) => e.zipOptions.value = e.zipOptions.value
                          .copyWith(comment: Some(BytesOrUnicodeString(v))),
                    ),
                  ].map((e) => e.container(width: colWidth + 40)),
                ],
              ),
            ),
          ],
        ).container(
          constraints: const BoxConstraints(maxWidth: 1100),
          margin: const EdgeInsets.only(right: 30),
        );
      }

      Widget tarFileView(InputFileState e) {
        return Row(
          key: ValueKey((e, 'tar')),
          children: [
            Column(
              children: [
                Text(e.name).subtitle(),
                DownloadFileButton(name: e.name, bytes: e.bytes),
                const SizedBox(height: 12),
              ],
            ).container(width: 250),
            Expanded(
              child: Wrap(
                children: [
                  ...[
                    IntInput(
                      label: 'Mode',
                      initialValue: e.tarHeader.value.mode,
                      onChanged: (v) => e.tarHeader.value =
                          e.tarHeader.value.copyWith(mode: Some(v)),
                    ),
                    IntInput(
                      label: 'Modified Time',
                      initialValue: e.tarHeader.value.mtime?.toInt(),
                      onChanged: (v) => e.tarHeader.value = e.tarHeader.value
                          .copyWith(mtime: Some(BigInt.from(v))),
                    ),
                    IntInput(
                      label: 'UID',
                      initialValue: e.tarHeader.value.uid?.toInt(),
                      onChanged: (v) => e.tarHeader.value =
                          e.tarHeader.value.copyWith(uid: Some(BigInt.from(v))),
                    ),
                    TextFormField(
                      initialValue: e.tarHeader.value.username,
                      decoration: const InputDecoration(labelText: 'UserName'),
                      onChanged: (v) => e.tarHeader.value =
                          e.tarHeader.value.copyWith(username: Some(v)),
                    ),
                    IntInput(
                      label: 'GID',
                      initialValue: e.tarHeader.value.gid?.toInt(),
                      onChanged: (v) => e.tarHeader.value =
                          e.tarHeader.value.copyWith(gid: Some(BigInt.from(v))),
                    ),
                    TextFormField(
                      initialValue: e.tarHeader.value.groupname,
                      decoration: const InputDecoration(labelText: 'GroupName'),
                      onChanged: (v) => e.tarHeader.value =
                          e.tarHeader.value.copyWith(groupname: Some(v)),
                    ),
                    IntInput(
                      label: 'Device Major',
                      initialValue: e.tarHeader.value.deviceMajor,
                      onChanged: (v) => e.tarHeader.value =
                          e.tarHeader.value.copyWith(deviceMajor: Some(v)),
                    ),
                    IntInput(
                      label: 'Device Minor',
                      initialValue: e.tarHeader.value.deviceMinor,
                      onChanged: (v) => e.tarHeader.value =
                          e.tarHeader.value.copyWith(deviceMinor: Some(v)),
                    ),
                  ].map((e) => e.container(width: colWidth)),
                ],
              ),
            ),
          ],
        ).container(
          constraints: const BoxConstraints(maxWidth: 1100),
          margin: const EdgeInsets.only(right: 30),
        );
      }

      return AnimatedBuilder(
        animation: state,
        builder: (context, _) {
          final leftWidth = CompressorKind.values.length * colWidth - 70;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (state.view == CompressorView.compress)
                          ElevatedButton(
                            onPressed: loadFiles,
                            child: const Text('Load Files'),
                          )
                        else
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (state.view == CompressorView.zip) {
                                    state.zipFiles();
                                  } else if (state.view == CompressorView.tar) {
                                    state.tarFiles();
                                  }
                                },
                                child: const Text('Archive Files'),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (state.view == CompressorView.zip) {
                                    state.zipFiles(download: true);
                                  } else if (state.view == CompressorView.tar) {
                                    state.tarFiles(download: true);
                                  }
                                },
                                child: const Text('Download Archive'),
                              )
                            ],
                          ),
                      ],
                    ).container(
                      alignment: Alignment.bottomLeft,
                      width: leftWidth,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Tab: ').subtitle(),
                        ToggleButtons(
                          constraints: const BoxConstraints(minHeight: 35),
                          isSelected: CompressorView.values
                              .map((e) => e == state.view)
                              .toList(),
                          onPressed: (index) {
                            state.viewSet(CompressorView.values[index]);
                          },
                          children: [
                            ...CompressorView.values.map(
                              (e) => Text(e.name).container(
                                  alignment: Alignment.center, width: 80),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                if (state.view == CompressorView.compress)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('File \\ Compressor')
                          .title()
                          .container(alignment: Alignment.center, width: 250),
                      ...CompressorKind.values.map(
                        (k) => Text(k.name).subtitle().container(
                            alignment: Alignment.center, width: colWidth),
                      ),
                      const SizedBox(width: 120),
                    ],
                  )
                else
                  const SizedBox(height: 12),
                if (state.files.isEmpty)
                  Column(
                    children: [
                      const SizedBox(height: 34),
                      const Text('No files loaded').title(),
                      const Text(
                        'You can perform compression or decompression in multiple formats\n'
                        'and create zip and tar archives from the loaded files',
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: loadFiles,
                        child: const Text('Load Files'),
                      )
                    ],
                  ).container(
                    alignment: Alignment.centerLeft,
                    width: leftWidth - 100,
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...(switch (state.view) {
                          CompressorView.compress =>
                            state.files.map(compressFileView),
                          CompressorView.zip => state.files.map(zipFileView),
                          CompressorView.tar => state.files.map(tarFileView),
                        }),
                        ErrorMessage(state: state)
                            .container(width: box.maxWidth - 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}

class DownloadFileButton extends StatelessWidget {
  const DownloadFileButton(
      {super.key, required this.name, required this.bytes});
  final String name;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => downloadFile(name, bytes),
      icon: const Icon(Icons.download),
      label: Text(bytes.sizeHuman),
    );
  }
}
