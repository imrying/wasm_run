import 'dart:typed_data';

import 'package:compression_rs/compression_rs_in_mem_worker.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

enum CRsMethod {
  brotli,
  deflate,
  gzip,
  zlib;

  AsyncCompressor compressor(CompressionRsWorld compressionRs) {
    return switch (this) {
      brotli => compressionRs.brotli.compressor,
      deflate => compressionRs.deflate.compressor,
      gzip => compressionRs.gzip.compressor,
      zlib => compressionRs.zlib.compressor,
    };
  }
}

class CompressionRsState extends ChangeNotifier {
  CompressionRsState(this.compressionRs);

  final CompressionRsWorld compressionRs;

  String error = '';

  void setError(String error) {
    this.error = error;
    notifyListeners();
  }

  Future<Uint8List?> compress(Uint8List bytes, CRsMethod method) async {
    final result = await method
        .compressor(compressionRs)
        .compress(input: Input.bytes(bytes));
    return result.mapErr(setError).ok;
  }

  Future<Uint8List?> decompress(Uint8List bytes, CRsMethod method) async {
    final result = await method
        .compressor(compressionRs)
        .decompress(input: Input.bytes(bytes));
    return result.mapErr(setError).ok;
  }
}

extension CompressorAsync on CompressionRsWorld {
  AsyncCompressor compressor(CRsMethod method) => method.compressor(this);
}
