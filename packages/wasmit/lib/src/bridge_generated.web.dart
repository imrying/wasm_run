// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.72.2.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.dart';
export 'bridge_generated.dart';

class WasmitDartPlatform extends FlutterRustBridgeBase<WasmitDartWire>
    with FlutterRustBridgeSetupMixin {
  WasmitDartPlatform(FutureOr<WasmModule> dylib)
      : super(WasmitDartWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

  @protected
  Object api2wire_ArcStdSyncMutexModule(ArcStdSyncMutexModule raw) {
    return raw.shareOrMove();
  }

  @protected
  Object api2wire_Global(Global raw) {
    return raw.shareOrMove();
  }

  @protected
  Object api2wire_Memory(Memory raw) {
    return raw.shareOrMove();
  }

  @protected
  Object api2wire_RwLockSharedMemory(RwLockSharedMemory raw) {
    return raw.shareOrMove();
  }

  @protected
  String api2wire_String(String raw) {
    return raw;
  }

  @protected
  List<String> api2wire_StringList(List<String> raw) {
    return raw;
  }

  @protected
  Object api2wire_Table(Table raw) {
    return raw.shareOrMove();
  }

  @protected
  Object api2wire_WFunc(WFunc raw) {
    return raw.shareOrMove();
  }

  @protected
  List<dynamic> api2wire_atomics(Atomics raw) {
    return [api2wire_usize(raw.field0)];
  }

  @protected
  Object api2wire_box_autoadd_WFunc(WFunc raw) {
    return api2wire_WFunc(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_atomics(Atomics raw) {
    return api2wire_atomics(raw);
  }

  @protected
  bool api2wire_box_autoadd_bool(bool raw) {
    return api2wire_bool(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_compiled_module(CompiledModule raw) {
    return api2wire_compiled_module(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_memory_ty(MemoryTy raw) {
    return api2wire_memory_ty(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_module_config(ModuleConfig raw) {
    return api2wire_module_config(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_module_config_wasmi(
      ModuleConfigWasmi raw) {
    return api2wire_module_config_wasmi(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_module_config_wasmtime(
      ModuleConfigWasmtime raw) {
    return api2wire_module_config_wasmtime(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_table_args(TableArgs raw) {
    return api2wire_table_args(raw);
  }

  @protected
  int api2wire_box_autoadd_u32(int raw) {
    return api2wire_u32(raw);
  }

  @protected
  Object api2wire_box_autoadd_u64(int raw) {
    return api2wire_u64(raw);
  }

  @protected
  int api2wire_box_autoadd_usize(int raw) {
    return api2wire_usize(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasi_config_native(WasiConfigNative raw) {
    return api2wire_wasi_config_native(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasi_stack_limits(WasiStackLimits raw) {
    return api2wire_wasi_stack_limits(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasm_val(WasmVal raw) {
    return api2wire_wasm_val(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasmit_instance_id(WasmitInstanceId raw) {
    return api2wire_wasmit_instance_id(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasmit_module_id(WasmitModuleId raw) {
    return api2wire_wasmit_module_id(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasmit_shared_memory(
      WasmitSharedMemory raw) {
    return api2wire_wasmit_shared_memory(raw);
  }

  @protected
  List<dynamic> api2wire_compiled_module(CompiledModule raw) {
    return [api2wire_ArcStdSyncMutexModule(raw.field0)];
  }

  @protected
  List<dynamic> api2wire_env_variable(EnvVariable raw) {
    return [api2wire_String(raw.name), api2wire_String(raw.value)];
  }

  @protected
  List<dynamic> api2wire_external_value(ExternalValue raw) {
    if (raw is ExternalValue_Func) {
      return [0, api2wire_WFunc(raw.field0)];
    }
    if (raw is ExternalValue_Global) {
      return [1, api2wire_Global(raw.field0)];
    }
    if (raw is ExternalValue_Table) {
      return [2, api2wire_Table(raw.field0)];
    }
    if (raw is ExternalValue_Memory) {
      return [3, api2wire_Memory(raw.field0)];
    }
    if (raw is ExternalValue_SharedMemory) {
      return [4, api2wire_box_autoadd_wasmit_shared_memory(raw.field0)];
    }

    throw Exception('unreachable');
  }

  @protected
  Object api2wire_i64(int raw) {
    return castNativeBigInt(raw);
  }

  @protected
  List<dynamic> api2wire_list_env_variable(List<EnvVariable> raw) {
    return raw.map(api2wire_env_variable).toList();
  }

  @protected
  List<dynamic> api2wire_list_module_import(List<ModuleImport> raw) {
    return raw.map(api2wire_module_import).toList();
  }

  @protected
  List<dynamic> api2wire_list_preopened_dir(List<PreopenedDir> raw) {
    return raw.map(api2wire_preopened_dir).toList();
  }

  @protected
  List<dynamic> api2wire_list_value_ty(List<ValueTy> raw) {
    return raw.map(api2wire_value_ty).toList();
  }

  @protected
  List<dynamic> api2wire_list_wasm_val(List<WasmVal> raw) {
    return raw.map(api2wire_wasm_val).toList();
  }

  @protected
  List<dynamic> api2wire_memory_ty(MemoryTy raw) {
    return [
      api2wire_bool(raw.shared),
      api2wire_u32(raw.minimum),
      api2wire_opt_box_autoadd_u32(raw.maximum)
    ];
  }

  @protected
  List<dynamic> api2wire_module_config(ModuleConfig raw) {
    return [
      api2wire_opt_box_autoadd_bool(raw.multiValue),
      api2wire_opt_box_autoadd_bool(raw.bulkMemory),
      api2wire_opt_box_autoadd_bool(raw.referenceTypes),
      api2wire_opt_box_autoadd_bool(raw.consumeFuel),
      api2wire_opt_box_autoadd_module_config_wasmi(raw.wasmi),
      api2wire_opt_box_autoadd_module_config_wasmtime(raw.wasmtime)
    ];
  }

  @protected
  List<dynamic> api2wire_module_config_wasmi(ModuleConfigWasmi raw) {
    return [
      api2wire_opt_box_autoadd_wasi_stack_limits(raw.stackLimits),
      api2wire_opt_box_autoadd_usize(raw.cachedStacks),
      api2wire_opt_box_autoadd_bool(raw.mutableGlobal),
      api2wire_opt_box_autoadd_bool(raw.signExtension),
      api2wire_opt_box_autoadd_bool(raw.saturatingFloatToInt),
      api2wire_opt_box_autoadd_bool(raw.tailCall),
      api2wire_opt_box_autoadd_bool(raw.extendedConst),
      api2wire_opt_box_autoadd_bool(raw.floats)
    ];
  }

  @protected
  List<dynamic> api2wire_module_config_wasmtime(ModuleConfigWasmtime raw) {
    return [
      api2wire_opt_box_autoadd_bool(raw.debugInfo),
      api2wire_opt_box_autoadd_bool(raw.wasmBacktrace),
      api2wire_opt_box_autoadd_bool(raw.nativeUnwindInfo),
      api2wire_opt_box_autoadd_usize(raw.maxWasmStack),
      api2wire_opt_box_autoadd_bool(raw.wasmThreads),
      api2wire_opt_box_autoadd_bool(raw.wasmSimd),
      api2wire_opt_box_autoadd_bool(raw.wasmRelaxedSimd),
      api2wire_opt_box_autoadd_bool(raw.relaxedSimdDeterministic),
      api2wire_opt_box_autoadd_bool(raw.wasmMultiMemory),
      api2wire_opt_box_autoadd_bool(raw.wasmMemory64),
      api2wire_opt_box_autoadd_u64(raw.staticMemoryMaximumSize),
      api2wire_opt_box_autoadd_bool(raw.staticMemoryForced),
      api2wire_opt_box_autoadd_u64(raw.staticMemoryGuardSize),
      api2wire_opt_box_autoadd_bool(raw.parallelCompilation),
      api2wire_opt_box_autoadd_bool(raw.generateAddressMap)
    ];
  }

  @protected
  List<dynamic> api2wire_module_import(ModuleImport raw) {
    return [
      api2wire_String(raw.module),
      api2wire_String(raw.name),
      api2wire_external_value(raw.value)
    ];
  }

  @protected
  Object? api2wire_opt_box_autoadd_WFunc(WFunc? raw) {
    return raw == null ? null : api2wire_box_autoadd_WFunc(raw);
  }

  @protected
  bool? api2wire_opt_box_autoadd_bool(bool? raw) {
    return raw == null ? null : api2wire_box_autoadd_bool(raw);
  }

  @protected
  List<dynamic>? api2wire_opt_box_autoadd_module_config_wasmi(
      ModuleConfigWasmi? raw) {
    return raw == null ? null : api2wire_box_autoadd_module_config_wasmi(raw);
  }

  @protected
  List<dynamic>? api2wire_opt_box_autoadd_module_config_wasmtime(
      ModuleConfigWasmtime? raw) {
    return raw == null
        ? null
        : api2wire_box_autoadd_module_config_wasmtime(raw);
  }

  @protected
  int? api2wire_opt_box_autoadd_u32(int? raw) {
    return raw == null ? null : api2wire_box_autoadd_u32(raw);
  }

  @protected
  Object? api2wire_opt_box_autoadd_u64(int? raw) {
    return raw == null ? null : api2wire_box_autoadd_u64(raw);
  }

  @protected
  int? api2wire_opt_box_autoadd_usize(int? raw) {
    return raw == null ? null : api2wire_box_autoadd_usize(raw);
  }

  @protected
  List<dynamic>? api2wire_opt_box_autoadd_wasi_config_native(
      WasiConfigNative? raw) {
    return raw == null ? null : api2wire_box_autoadd_wasi_config_native(raw);
  }

  @protected
  List<dynamic>? api2wire_opt_box_autoadd_wasi_stack_limits(
      WasiStackLimits? raw) {
    return raw == null ? null : api2wire_box_autoadd_wasi_stack_limits(raw);
  }

  @protected
  List<dynamic> api2wire_preopened_dir(PreopenedDir raw) {
    return [api2wire_String(raw.wasmGuestPath), api2wire_String(raw.hostPath)];
  }

  @protected
  List<dynamic> api2wire_table_args(TableArgs raw) {
    return [
      api2wire_u32(raw.minimum),
      api2wire_opt_box_autoadd_u32(raw.maximum)
    ];
  }

  @protected
  Object api2wire_u64(int raw) {
    return castNativeBigInt(raw);
  }

  @protected
  Uint8List api2wire_u8_array_16(U8Array16 raw) {
    return Uint8List.fromList(raw);
  }

  @protected
  Uint8List api2wire_uint_8_list(Uint8List raw) {
    return raw;
  }

  @protected
  List<dynamic> api2wire_wasi_config_native(WasiConfigNative raw) {
    return [
      api2wire_bool(raw.captureStdout),
      api2wire_bool(raw.captureStderr),
      api2wire_bool(raw.inheritStdin),
      api2wire_bool(raw.inheritEnv),
      api2wire_bool(raw.inheritArgs),
      api2wire_StringList(raw.args),
      api2wire_list_env_variable(raw.env),
      api2wire_StringList(raw.preopenedFiles),
      api2wire_list_preopened_dir(raw.preopenedDirs)
    ];
  }

  @protected
  List<dynamic> api2wire_wasi_stack_limits(WasiStackLimits raw) {
    return [
      api2wire_usize(raw.initialValueStackHeight),
      api2wire_usize(raw.maximumValueStackHeight),
      api2wire_usize(raw.maximumRecursionDepth)
    ];
  }

  @protected
  List<dynamic> api2wire_wasm_val(WasmVal raw) {
    if (raw is WasmVal_i32) {
      return [0, api2wire_i32(raw.field0)];
    }
    if (raw is WasmVal_i64) {
      return [1, api2wire_i64(raw.field0)];
    }
    if (raw is WasmVal_f32) {
      return [2, api2wire_f32(raw.field0)];
    }
    if (raw is WasmVal_f64) {
      return [3, api2wire_f64(raw.field0)];
    }
    if (raw is WasmVal_v128) {
      return [4, api2wire_u8_array_16(raw.field0)];
    }
    if (raw is WasmVal_funcRef) {
      return [5, api2wire_opt_box_autoadd_WFunc(raw.field0)];
    }
    if (raw is WasmVal_externRef) {
      return [6, api2wire_opt_box_autoadd_u32(raw.field0)];
    }

    throw Exception('unreachable');
  }

  @protected
  List<dynamic> api2wire_wasmit_instance_id(WasmitInstanceId raw) {
    return [api2wire_u32(raw.field0)];
  }

  @protected
  List<dynamic> api2wire_wasmit_module_id(WasmitModuleId raw) {
    return [api2wire_u32(raw.field0)];
  }

  @protected
  List<dynamic> api2wire_wasmit_shared_memory(WasmitSharedMemory raw) {
    return [api2wire_RwLockSharedMemory(raw.field0)];
  }
// Section: finalizer

  late final Finalizer<PlatformPointer> _ArcStdSyncMutexModuleFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_ArcStdSyncMutexModule);
  Finalizer<PlatformPointer> get ArcStdSyncMutexModuleFinalizer =>
      _ArcStdSyncMutexModuleFinalizer;
  late final Finalizer<PlatformPointer> _GlobalFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_Global);
  Finalizer<PlatformPointer> get GlobalFinalizer => _GlobalFinalizer;
  late final Finalizer<PlatformPointer> _MemoryFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_Memory);
  Finalizer<PlatformPointer> get MemoryFinalizer => _MemoryFinalizer;
  late final Finalizer<PlatformPointer> _RwLockSharedMemoryFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_RwLockSharedMemory);
  Finalizer<PlatformPointer> get RwLockSharedMemoryFinalizer =>
      _RwLockSharedMemoryFinalizer;
  late final Finalizer<PlatformPointer> _TableFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_Table);
  Finalizer<PlatformPointer> get TableFinalizer => _TableFinalizer;
  late final Finalizer<PlatformPointer> _WFuncFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_WFunc);
  Finalizer<PlatformPointer> get WFuncFinalizer => _WFuncFinalizer;
}

// Section: WASM wire module

@JS('wasm_bindgen')
external WasmitDartWasmModule get wasmModule;

@JS()
@anonymous
class WasmitDartWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external WasmitDartWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* List<dynamic> */ wire_module_builder(
      List<dynamic> module, int? num_threads, List<dynamic>? wasi_config);

  external dynamic /* void */ wire_parse_wat_format(
      NativePortType port_, String wat);

  external dynamic /* void */ wire_compile_wasm(
      NativePortType port_, Uint8List module_wasm, List<dynamic> config);

  external dynamic /* List<dynamic> */ wire_compile_wasm_sync(
      Uint8List module_wasm, List<dynamic> config);

  external dynamic /* List<dynamic> */ wire_wasm_features_for_config(
      List<dynamic> config);

  external dynamic /* List<dynamic> */ wire_wasm_runtime_features();

  external dynamic /* List<dynamic> */ wire_exports__method__WasmitInstanceId(
      List<dynamic> that);

  external dynamic /* List<dynamic> */
      wire_instantiate_sync__method__WasmitModuleId(List<dynamic> that);

  external dynamic /* void */ wire_instantiate__method__WasmitModuleId(
      NativePortType port_, List<dynamic> that);

  external dynamic /* void */ wire_link_imports__method__WasmitModuleId(
      List<dynamic> that, List<dynamic> imports);

  external dynamic /* void */ wire_stdio_stream__method__WasmitModuleId(
      NativePortType port_, List<dynamic> that, int kind);

  external dynamic /* void */ wire_dispose__method__WasmitModuleId(
      NativePortType port_, List<dynamic> that);

  external dynamic /* List<dynamic> */
      wire_call_function_handle_sync__method__WasmitModuleId(
          List<dynamic> that, Object func, List<dynamic> args);

  external dynamic /* void */ wire_call_function_handle__method__WasmitModuleId(
      NativePortType port_,
      List<dynamic> that,
      Object func,
      List<dynamic> args);

  external dynamic /* void */
      wire_call_function_handle_parallel__method__WasmitModuleId(
          NativePortType port_,
          List<dynamic> that,
          String func_name,
          List<dynamic> args);

  external dynamic /* List<dynamic> */
      wire_get_function_type__method__WasmitModuleId(
          List<dynamic> that, Object func);

  external dynamic /* Object */ wire_create_function__method__WasmitModuleId(
      List<dynamic> that,
      int function_pointer,
      int function_id,
      List<dynamic> param_types,
      List<dynamic> result_types);

  external dynamic /* Object */ wire_create_memory__method__WasmitModuleId(
      List<dynamic> that, List<dynamic> memory_type);

  external dynamic /* Object */ wire_create_global__method__WasmitModuleId(
      List<dynamic> that, List<dynamic> value, bool mutable);

  external dynamic /* Object */ wire_create_table__method__WasmitModuleId(
      List<dynamic> that, List<dynamic> value, List<dynamic> table_type);

  external dynamic /* List<dynamic> */
      wire_get_global_type__method__WasmitModuleId(
          List<dynamic> that, Object global);

  external dynamic /* List<dynamic> */
      wire_get_global_value__method__WasmitModuleId(
          List<dynamic> that, Object global);

  external dynamic /* void */ wire_set_global_value__method__WasmitModuleId(
      List<dynamic> that, Object global, List<dynamic> value);

  external dynamic /* List<dynamic> */
      wire_get_memory_type__method__WasmitModuleId(
          List<dynamic> that, Object memory);

  external dynamic /* Uint8List */ wire_get_memory_data__method__WasmitModuleId(
      List<dynamic> that, Object memory);

  external dynamic /* int */
      wire_get_memory_data_pointer__method__WasmitModuleId(
          List<dynamic> that, Object memory);

  external dynamic /* Uint8List */ wire_read_memory__method__WasmitModuleId(
      List<dynamic> that, Object memory, int offset, int bytes);

  external dynamic /* int */ wire_get_memory_pages__method__WasmitModuleId(
      List<dynamic> that, Object memory);

  external dynamic /* void */ wire_write_memory__method__WasmitModuleId(
      List<dynamic> that, Object memory, int offset, Uint8List buffer);

  external dynamic /* int */ wire_grow_memory__method__WasmitModuleId(
      List<dynamic> that, Object memory, int pages);

  external dynamic /* int */ wire_get_table_size__method__WasmitModuleId(
      List<dynamic> that, Object table);

  external dynamic /* List<dynamic> */
      wire_get_table_type__method__WasmitModuleId(
          List<dynamic> that, Object table);

  external dynamic /* int */ wire_grow_table__method__WasmitModuleId(
      List<dynamic> that, Object table, int delta, List<dynamic> value);

  external dynamic /* List<dynamic>? */ wire_get_table__method__WasmitModuleId(
      List<dynamic> that, Object table, int index);

  external dynamic /* void */ wire_set_table__method__WasmitModuleId(
      List<dynamic> that, Object table, int index, List<dynamic> value);

  external dynamic /* void */ wire_fill_table__method__WasmitModuleId(
      List<dynamic> that,
      Object table,
      int index,
      List<dynamic> value,
      int len);

  external dynamic /* void */ wire_add_fuel__method__WasmitModuleId(
      List<dynamic> that, Object delta);

  external dynamic /* Object? */ wire_fuel_consumed__method__WasmitModuleId(
      List<dynamic> that);

  external dynamic /* Object */ wire_consume_fuel__method__WasmitModuleId(
      List<dynamic> that, Object delta);

  external dynamic /* List<dynamic> */
      wire_create_shared_memory__method__CompiledModule(
          List<dynamic> that, List<dynamic> memory_type);

  external dynamic /* List<dynamic> */
      wire_get_module_imports__method__CompiledModule(List<dynamic> that);

  external dynamic /* List<dynamic> */
      wire_get_module_exports__method__CompiledModule(List<dynamic> that);

  external dynamic /* List<dynamic> */ wire_ty__method__WasmitSharedMemory(
      List<dynamic> that);

  external dynamic /* Object */ wire_size__method__WasmitSharedMemory(
      List<dynamic> that);

  external dynamic /* int */ wire_data_size__method__WasmitSharedMemory(
      List<dynamic> that);

  external dynamic /* int */ wire_data_pointer__method__WasmitSharedMemory(
      List<dynamic> that);

  external dynamic /* Object */ wire_grow__method__WasmitSharedMemory(
      List<dynamic> that, Object delta);

  external dynamic /* void */ wire_atomics__method__WasmitSharedMemory(
      NativePortType port_, List<dynamic> that);

  external dynamic /* int */ wire_atomic_notify__method__WasmitSharedMemory(
      List<dynamic> that, Object addr, int count);

  external dynamic /* int */ wire_atomic_wait32__method__WasmitSharedMemory(
      List<dynamic> that, Object addr, int expected);

  external dynamic /* int */ wire_atomic_wait64__method__WasmitSharedMemory(
      List<dynamic> that, Object addr, Object expected);

  external dynamic /* void */ wire_add__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, Object val, int order);

  external dynamic /* void */ wire_load__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, int order);

  external dynamic /* void */ wire_store__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, Object val, int order);

  external dynamic /* void */ wire_swap__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, Object val, int order);

  external dynamic /* void */ wire_compare_exchange__method__Atomics(
      NativePortType port_,
      List<dynamic> that,
      int offset,
      int kind,
      Object current,
      Object new_value,
      int success,
      int failure);

  external dynamic /* void */ wire_sub__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, Object val, int order);

  external dynamic /* void */ wire_and__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, Object val, int order);

  external dynamic /* void */ wire_or__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, Object val, int order);

  external dynamic /* void */ wire_xor__method__Atomics(NativePortType port_,
      List<dynamic> that, int offset, int kind, Object val, int order);

  external dynamic /*  */ drop_opaque_ArcStdSyncMutexModule(ptr);

  external int /* *const c_void */ share_opaque_ArcStdSyncMutexModule(ptr);

  external dynamic /*  */ drop_opaque_Global(ptr);

  external int /* *const c_void */ share_opaque_Global(ptr);

  external dynamic /*  */ drop_opaque_Memory(ptr);

  external int /* *const c_void */ share_opaque_Memory(ptr);

  external dynamic /*  */ drop_opaque_RwLockSharedMemory(ptr);

  external int /* *const c_void */ share_opaque_RwLockSharedMemory(ptr);

  external dynamic /*  */ drop_opaque_Table(ptr);

  external int /* *const c_void */ share_opaque_Table(ptr);

  external dynamic /*  */ drop_opaque_WFunc(ptr);

  external int /* *const c_void */ share_opaque_WFunc(ptr);
}

// Section: WASM wire connector

class WasmitDartWire
    extends FlutterRustBridgeWasmWireBase<WasmitDartWasmModule> {
  WasmitDartWire(FutureOr<WasmModule> module)
      : super(WasmModule.cast<WasmitDartWasmModule>(module));

  dynamic /* List<dynamic> */ wire_module_builder(
          List<dynamic> module, int? num_threads, List<dynamic>? wasi_config) =>
      wasmModule.wire_module_builder(module, num_threads, wasi_config);

  void wire_parse_wat_format(NativePortType port_, String wat) =>
      wasmModule.wire_parse_wat_format(port_, wat);

  void wire_compile_wasm(
          NativePortType port_, Uint8List module_wasm, List<dynamic> config) =>
      wasmModule.wire_compile_wasm(port_, module_wasm, config);

  dynamic /* List<dynamic> */ wire_compile_wasm_sync(
          Uint8List module_wasm, List<dynamic> config) =>
      wasmModule.wire_compile_wasm_sync(module_wasm, config);

  dynamic /* List<dynamic> */ wire_wasm_features_for_config(
          List<dynamic> config) =>
      wasmModule.wire_wasm_features_for_config(config);

  dynamic /* List<dynamic> */ wire_wasm_runtime_features() =>
      wasmModule.wire_wasm_runtime_features();

  dynamic /* List<dynamic> */ wire_exports__method__WasmitInstanceId(
          List<dynamic> that) =>
      wasmModule.wire_exports__method__WasmitInstanceId(that);

  dynamic /* List<dynamic> */ wire_instantiate_sync__method__WasmitModuleId(
          List<dynamic> that) =>
      wasmModule.wire_instantiate_sync__method__WasmitModuleId(that);

  void wire_instantiate__method__WasmitModuleId(
          NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_instantiate__method__WasmitModuleId(port_, that);

  dynamic /* void */ wire_link_imports__method__WasmitModuleId(
          List<dynamic> that, List<dynamic> imports) =>
      wasmModule.wire_link_imports__method__WasmitModuleId(that, imports);

  void wire_stdio_stream__method__WasmitModuleId(
          NativePortType port_, List<dynamic> that, int kind) =>
      wasmModule.wire_stdio_stream__method__WasmitModuleId(port_, that, kind);

  void wire_dispose__method__WasmitModuleId(
          NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_dispose__method__WasmitModuleId(port_, that);

  dynamic /* List<dynamic> */
      wire_call_function_handle_sync__method__WasmitModuleId(
              List<dynamic> that, Object func, List<dynamic> args) =>
          wasmModule.wire_call_function_handle_sync__method__WasmitModuleId(
              that, func, args);

  void wire_call_function_handle__method__WasmitModuleId(NativePortType port_,
          List<dynamic> that, Object func, List<dynamic> args) =>
      wasmModule.wire_call_function_handle__method__WasmitModuleId(
          port_, that, func, args);

  void wire_call_function_handle_parallel__method__WasmitModuleId(
          NativePortType port_,
          List<dynamic> that,
          String func_name,
          List<dynamic> args) =>
      wasmModule.wire_call_function_handle_parallel__method__WasmitModuleId(
          port_, that, func_name, args);

  dynamic /* List<dynamic> */ wire_get_function_type__method__WasmitModuleId(
          List<dynamic> that, Object func) =>
      wasmModule.wire_get_function_type__method__WasmitModuleId(that, func);

  dynamic /* Object */ wire_create_function__method__WasmitModuleId(
          List<dynamic> that,
          int function_pointer,
          int function_id,
          List<dynamic> param_types,
          List<dynamic> result_types) =>
      wasmModule.wire_create_function__method__WasmitModuleId(
          that, function_pointer, function_id, param_types, result_types);

  dynamic /* Object */ wire_create_memory__method__WasmitModuleId(
          List<dynamic> that, List<dynamic> memory_type) =>
      wasmModule.wire_create_memory__method__WasmitModuleId(that, memory_type);

  dynamic /* Object */ wire_create_global__method__WasmitModuleId(
          List<dynamic> that, List<dynamic> value, bool mutable) =>
      wasmModule.wire_create_global__method__WasmitModuleId(
          that, value, mutable);

  dynamic /* Object */ wire_create_table__method__WasmitModuleId(
          List<dynamic> that, List<dynamic> value, List<dynamic> table_type) =>
      wasmModule.wire_create_table__method__WasmitModuleId(
          that, value, table_type);

  dynamic /* List<dynamic> */ wire_get_global_type__method__WasmitModuleId(
          List<dynamic> that, Object global) =>
      wasmModule.wire_get_global_type__method__WasmitModuleId(that, global);

  dynamic /* List<dynamic> */ wire_get_global_value__method__WasmitModuleId(
          List<dynamic> that, Object global) =>
      wasmModule.wire_get_global_value__method__WasmitModuleId(that, global);

  dynamic /* void */ wire_set_global_value__method__WasmitModuleId(
          List<dynamic> that, Object global, List<dynamic> value) =>
      wasmModule.wire_set_global_value__method__WasmitModuleId(
          that, global, value);

  dynamic /* List<dynamic> */ wire_get_memory_type__method__WasmitModuleId(
          List<dynamic> that, Object memory) =>
      wasmModule.wire_get_memory_type__method__WasmitModuleId(that, memory);

  dynamic /* Uint8List */ wire_get_memory_data__method__WasmitModuleId(
          List<dynamic> that, Object memory) =>
      wasmModule.wire_get_memory_data__method__WasmitModuleId(that, memory);

  dynamic /* int */ wire_get_memory_data_pointer__method__WasmitModuleId(
          List<dynamic> that, Object memory) =>
      wasmModule.wire_get_memory_data_pointer__method__WasmitModuleId(
          that, memory);

  dynamic /* Uint8List */ wire_read_memory__method__WasmitModuleId(
          List<dynamic> that, Object memory, int offset, int bytes) =>
      wasmModule.wire_read_memory__method__WasmitModuleId(
          that, memory, offset, bytes);

  dynamic /* int */ wire_get_memory_pages__method__WasmitModuleId(
          List<dynamic> that, Object memory) =>
      wasmModule.wire_get_memory_pages__method__WasmitModuleId(that, memory);

  dynamic /* void */ wire_write_memory__method__WasmitModuleId(
          List<dynamic> that, Object memory, int offset, Uint8List buffer) =>
      wasmModule.wire_write_memory__method__WasmitModuleId(
          that, memory, offset, buffer);

  dynamic /* int */ wire_grow_memory__method__WasmitModuleId(
          List<dynamic> that, Object memory, int pages) =>
      wasmModule.wire_grow_memory__method__WasmitModuleId(that, memory, pages);

  dynamic /* int */ wire_get_table_size__method__WasmitModuleId(
          List<dynamic> that, Object table) =>
      wasmModule.wire_get_table_size__method__WasmitModuleId(that, table);

  dynamic /* List<dynamic> */ wire_get_table_type__method__WasmitModuleId(
          List<dynamic> that, Object table) =>
      wasmModule.wire_get_table_type__method__WasmitModuleId(that, table);

  dynamic /* int */ wire_grow_table__method__WasmitModuleId(
          List<dynamic> that, Object table, int delta, List<dynamic> value) =>
      wasmModule.wire_grow_table__method__WasmitModuleId(
          that, table, delta, value);

  dynamic /* List<dynamic>? */ wire_get_table__method__WasmitModuleId(
          List<dynamic> that, Object table, int index) =>
      wasmModule.wire_get_table__method__WasmitModuleId(that, table, index);

  dynamic /* void */ wire_set_table__method__WasmitModuleId(
          List<dynamic> that, Object table, int index, List<dynamic> value) =>
      wasmModule.wire_set_table__method__WasmitModuleId(
          that, table, index, value);

  dynamic /* void */ wire_fill_table__method__WasmitModuleId(List<dynamic> that,
          Object table, int index, List<dynamic> value, int len) =>
      wasmModule.wire_fill_table__method__WasmitModuleId(
          that, table, index, value, len);

  dynamic /* void */ wire_add_fuel__method__WasmitModuleId(
          List<dynamic> that, Object delta) =>
      wasmModule.wire_add_fuel__method__WasmitModuleId(that, delta);

  dynamic /* Object? */ wire_fuel_consumed__method__WasmitModuleId(
          List<dynamic> that) =>
      wasmModule.wire_fuel_consumed__method__WasmitModuleId(that);

  dynamic /* Object */ wire_consume_fuel__method__WasmitModuleId(
          List<dynamic> that, Object delta) =>
      wasmModule.wire_consume_fuel__method__WasmitModuleId(that, delta);

  dynamic /* List<dynamic> */ wire_create_shared_memory__method__CompiledModule(
          List<dynamic> that, List<dynamic> memory_type) =>
      wasmModule.wire_create_shared_memory__method__CompiledModule(
          that, memory_type);

  dynamic /* List<dynamic> */ wire_get_module_imports__method__CompiledModule(
          List<dynamic> that) =>
      wasmModule.wire_get_module_imports__method__CompiledModule(that);

  dynamic /* List<dynamic> */ wire_get_module_exports__method__CompiledModule(
          List<dynamic> that) =>
      wasmModule.wire_get_module_exports__method__CompiledModule(that);

  dynamic /* List<dynamic> */ wire_ty__method__WasmitSharedMemory(
          List<dynamic> that) =>
      wasmModule.wire_ty__method__WasmitSharedMemory(that);

  dynamic /* Object */ wire_size__method__WasmitSharedMemory(
          List<dynamic> that) =>
      wasmModule.wire_size__method__WasmitSharedMemory(that);

  dynamic /* int */ wire_data_size__method__WasmitSharedMemory(
          List<dynamic> that) =>
      wasmModule.wire_data_size__method__WasmitSharedMemory(that);

  dynamic /* int */ wire_data_pointer__method__WasmitSharedMemory(
          List<dynamic> that) =>
      wasmModule.wire_data_pointer__method__WasmitSharedMemory(that);

  dynamic /* Object */ wire_grow__method__WasmitSharedMemory(
          List<dynamic> that, Object delta) =>
      wasmModule.wire_grow__method__WasmitSharedMemory(that, delta);

  void wire_atomics__method__WasmitSharedMemory(
          NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_atomics__method__WasmitSharedMemory(port_, that);

  dynamic /* int */ wire_atomic_notify__method__WasmitSharedMemory(
          List<dynamic> that, Object addr, int count) =>
      wasmModule.wire_atomic_notify__method__WasmitSharedMemory(
          that, addr, count);

  dynamic /* int */ wire_atomic_wait32__method__WasmitSharedMemory(
          List<dynamic> that, Object addr, int expected) =>
      wasmModule.wire_atomic_wait32__method__WasmitSharedMemory(
          that, addr, expected);

  dynamic /* int */ wire_atomic_wait64__method__WasmitSharedMemory(
          List<dynamic> that, Object addr, Object expected) =>
      wasmModule.wire_atomic_wait64__method__WasmitSharedMemory(
          that, addr, expected);

  void wire_add__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, Object val, int order) =>
      wasmModule.wire_add__method__Atomics(
          port_, that, offset, kind, val, order);

  void wire_load__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, int order) =>
      wasmModule.wire_load__method__Atomics(port_, that, offset, kind, order);

  void wire_store__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, Object val, int order) =>
      wasmModule.wire_store__method__Atomics(
          port_, that, offset, kind, val, order);

  void wire_swap__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, Object val, int order) =>
      wasmModule.wire_swap__method__Atomics(
          port_, that, offset, kind, val, order);

  void wire_compare_exchange__method__Atomics(
          NativePortType port_,
          List<dynamic> that,
          int offset,
          int kind,
          Object current,
          Object new_value,
          int success,
          int failure) =>
      wasmModule.wire_compare_exchange__method__Atomics(
          port_, that, offset, kind, current, new_value, success, failure);

  void wire_sub__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, Object val, int order) =>
      wasmModule.wire_sub__method__Atomics(
          port_, that, offset, kind, val, order);

  void wire_and__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, Object val, int order) =>
      wasmModule.wire_and__method__Atomics(
          port_, that, offset, kind, val, order);

  void wire_or__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, Object val, int order) =>
      wasmModule.wire_or__method__Atomics(
          port_, that, offset, kind, val, order);

  void wire_xor__method__Atomics(NativePortType port_, List<dynamic> that,
          int offset, int kind, Object val, int order) =>
      wasmModule.wire_xor__method__Atomics(
          port_, that, offset, kind, val, order);

  dynamic /*  */ drop_opaque_ArcStdSyncMutexModule(ptr) =>
      wasmModule.drop_opaque_ArcStdSyncMutexModule(ptr);

  int /* *const c_void */ share_opaque_ArcStdSyncMutexModule(ptr) =>
      wasmModule.share_opaque_ArcStdSyncMutexModule(ptr);

  dynamic /*  */ drop_opaque_Global(ptr) => wasmModule.drop_opaque_Global(ptr);

  int /* *const c_void */ share_opaque_Global(ptr) =>
      wasmModule.share_opaque_Global(ptr);

  dynamic /*  */ drop_opaque_Memory(ptr) => wasmModule.drop_opaque_Memory(ptr);

  int /* *const c_void */ share_opaque_Memory(ptr) =>
      wasmModule.share_opaque_Memory(ptr);

  dynamic /*  */ drop_opaque_RwLockSharedMemory(ptr) =>
      wasmModule.drop_opaque_RwLockSharedMemory(ptr);

  int /* *const c_void */ share_opaque_RwLockSharedMemory(ptr) =>
      wasmModule.share_opaque_RwLockSharedMemory(ptr);

  dynamic /*  */ drop_opaque_Table(ptr) => wasmModule.drop_opaque_Table(ptr);

  int /* *const c_void */ share_opaque_Table(ptr) =>
      wasmModule.share_opaque_Table(ptr);

  dynamic /*  */ drop_opaque_WFunc(ptr) => wasmModule.drop_opaque_WFunc(ptr);

  int /* *const c_void */ share_opaque_WFunc(ptr) =>
      wasmModule.share_opaque_WFunc(ptr);
}
