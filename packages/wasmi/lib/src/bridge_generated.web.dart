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

class WasmiDartPlatform extends FlutterRustBridgeBase<WasmiDartWire>
    with FlutterRustBridgeSetupMixin {
  WasmiDartPlatform(FutureOr<WasmModule> dylib) : super(WasmiDartWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

  @protected
  Object api2wire_ArcStdSyncMutexModule(ArcStdSyncMutexModule raw) {
    return raw.shareOrMove();
  }

  @protected
  Object api2wire_Func(Func raw) {
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
  Object api2wire_box_autoadd_Func(Func raw) {
    return api2wire_Func(raw);
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
  List<dynamic> api2wire_box_autoadd_table_type_2(TableType2 raw) {
    return api2wire_table_type_2(raw);
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
  List<dynamic> api2wire_box_autoadd_value_2(Value2 raw) {
    return api2wire_value_2(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasi_config(WasiConfig raw) {
    return api2wire_wasi_config(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasi_stack_limits(WasiStackLimits raw) {
    return api2wire_wasi_stack_limits(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasm_memory_type(WasmMemoryType raw) {
    return api2wire_wasm_memory_type(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasmi_instance_id(WasmiInstanceId raw) {
    return api2wire_wasmi_instance_id(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_wasmi_module_id(WasmiModuleId raw) {
    return api2wire_wasmi_module_id(raw);
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
      return [0, api2wire_Func(raw.field0)];
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
  List<dynamic> api2wire_list_value_2(List<Value2> raw) {
    return raw.map(api2wire_value_2).toList();
  }

  @protected
  List<dynamic> api2wire_list_value_ty(List<ValueTy> raw) {
    return raw.map(api2wire_value_ty).toList();
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
      api2wire_opt_box_autoadd_bool(raw.epochInterruption),
      api2wire_opt_box_autoadd_usize(raw.maxWasmStack),
      api2wire_opt_box_autoadd_bool(raw.wasmThreads),
      api2wire_opt_box_autoadd_bool(raw.wasmSimd),
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
  Object? api2wire_opt_box_autoadd_Func(Func? raw) {
    return raw == null ? null : api2wire_box_autoadd_Func(raw);
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
  List<dynamic>? api2wire_opt_box_autoadd_wasi_config(WasiConfig? raw) {
    return raw == null ? null : api2wire_box_autoadd_wasi_config(raw);
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
  List<dynamic> api2wire_table_type_2(TableType2 raw) {
    return [api2wire_u32(raw.min), api2wire_opt_box_autoadd_u32(raw.max)];
  }

  @protected
  Object api2wire_u64(int raw) {
    return castNativeBigInt(raw);
  }

  @protected
  Uint8List api2wire_uint_8_list(Uint8List raw) {
    return raw;
  }

  @protected
  List<dynamic> api2wire_value_2(Value2 raw) {
    if (raw is Value2_I32) {
      return [0, api2wire_i32(raw.field0)];
    }
    if (raw is Value2_I64) {
      return [1, api2wire_i64(raw.field0)];
    }
    if (raw is Value2_F32) {
      return [2, api2wire_f32(raw.field0)];
    }
    if (raw is Value2_F64) {
      return [3, api2wire_f64(raw.field0)];
    }
    if (raw is Value2_FuncRef) {
      return [4, api2wire_opt_box_autoadd_Func(raw.field0)];
    }
    if (raw is Value2_ExternRef) {
      return [5, api2wire_u32(raw.field0)];
    }

    throw Exception('unreachable');
  }

  @protected
  List<dynamic> api2wire_wasi_config(WasiConfig raw) {
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
  List<dynamic> api2wire_wasm_memory_type(WasmMemoryType raw) {
    return [
      api2wire_u32(raw.initialPages),
      api2wire_opt_box_autoadd_u32(raw.maximumPages)
    ];
  }

  @protected
  List<dynamic> api2wire_wasmi_instance_id(WasmiInstanceId raw) {
    return [api2wire_u32(raw.field0)];
  }

  @protected
  List<dynamic> api2wire_wasmi_module_id(WasmiModuleId raw) {
    return [api2wire_u32(raw.field0)];
  }
// Section: finalizer

  late final Finalizer<PlatformPointer> _ArcStdSyncMutexModuleFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_ArcStdSyncMutexModule);
  Finalizer<PlatformPointer> get ArcStdSyncMutexModuleFinalizer =>
      _ArcStdSyncMutexModuleFinalizer;
  late final Finalizer<PlatformPointer> _FuncFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_Func);
  Finalizer<PlatformPointer> get FuncFinalizer => _FuncFinalizer;
  late final Finalizer<PlatformPointer> _GlobalFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_Global);
  Finalizer<PlatformPointer> get GlobalFinalizer => _GlobalFinalizer;
  late final Finalizer<PlatformPointer> _MemoryFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_Memory);
  Finalizer<PlatformPointer> get MemoryFinalizer => _MemoryFinalizer;
  late final Finalizer<PlatformPointer> _TableFinalizer =
      Finalizer<PlatformPointer>(inner.drop_opaque_Table);
  Finalizer<PlatformPointer> get TableFinalizer => _TableFinalizer;
}

// Section: WASM wire module

@JS('wasm_bindgen')
external WasmiDartWasmModule get wasmModule;

@JS()
@anonymous
class WasmiDartWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external WasmiDartWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* Object */ wire_create_shared_memory(
      List<dynamic> _module);

  external dynamic /* List<dynamic> */ wire_module_builder(
      List<dynamic> module, List<dynamic>? wasi_config);

  external dynamic /* void */ wire_parse_wat_format(
      NativePortType port_, String wat);

  external dynamic /* List<dynamic> */ wire_run_function(int pointer);

  external dynamic /* List<dynamic> */ wire_run_wasm_func(
      int pointer, List<dynamic> params);

  external dynamic /* List<dynamic> */ wire_run_wasm_func_mut(
      int pointer, List<dynamic> params);

  external dynamic /* bool */ wire_run_wasm_func_void(
      int pointer, List<dynamic> params);

  external dynamic /* void */ wire_compile_wasm(
      NativePortType port_, Uint8List module_wasm, List<dynamic> config);

  external dynamic /* List<dynamic> */ wire_compile_wasm_sync(
      Uint8List module_wasm, List<dynamic> config);

  external dynamic /* void */ wire_call_wasm(NativePortType port_);

  external dynamic /* void */ wire_add(
      NativePortType port_, Object a, Object b);

  external dynamic /* void */ wire_call_function__method__WasmiInstanceId(
      NativePortType port_, List<dynamic> that, String name);

  external dynamic /* List<dynamic> */
      wire_call_function_with_args_sync__method__WasmiInstanceId(
          List<dynamic> that, String name, List<dynamic> args);

  external dynamic /* void */
      wire_call_function_with_args__method__WasmiInstanceId(
          NativePortType port_,
          List<dynamic> that,
          String name,
          List<dynamic> args);

  external dynamic /* List<dynamic> */ wire_exports__method__WasmiInstanceId(
      List<dynamic> that);

  external dynamic /* List<dynamic> */
      wire_instantiate_sync__method__WasmiModuleId(List<dynamic> that);

  external dynamic /* void */ wire_instantiate__method__WasmiModuleId(
      NativePortType port_, List<dynamic> that);

  external dynamic /* void */ wire_link_imports__method__WasmiModuleId(
      List<dynamic> that, List<dynamic> imports);

  external dynamic /* void */ wire_dispose__method__WasmiModuleId(
      NativePortType port_, List<dynamic> that);

  external dynamic /* List<dynamic> */
      wire_call_function_handle_sync__method__WasmiModuleId(
          List<dynamic> that, Object func, List<dynamic> args);

  external dynamic /* void */ wire_call_function_handle__method__WasmiModuleId(
      NativePortType port_,
      List<dynamic> that,
      Object func,
      List<dynamic> args);

  external dynamic /* List<dynamic> */
      wire_get_function_type__method__WasmiModuleId(
          List<dynamic> that, Object func);

  external dynamic /* Object */ wire_create_function__method__WasmiModuleId(
      List<dynamic> that,
      int function_pointer,
      int function_id,
      List<dynamic> param_types,
      List<dynamic> result_types);

  external dynamic /* Object */ wire_create_memory__method__WasmiModuleId(
      List<dynamic> that, List<dynamic> memory_type);

  external dynamic /* Object */ wire_create_global__method__WasmiModuleId(
      List<dynamic> that, List<dynamic> value, int mutability);

  external dynamic /* Object */ wire_create_table__method__WasmiModuleId(
      List<dynamic> that, List<dynamic> value, List<dynamic> table_type);

  external dynamic /* List<dynamic> */
      wire_get_global_type__method__WasmiModuleId(
          List<dynamic> that, Object global);

  external dynamic /* List<dynamic> */
      wire_get_global_value__method__WasmiModuleId(
          List<dynamic> that, Object global);

  external dynamic /* void */ wire_set_global_value__method__WasmiModuleId(
      List<dynamic> that, Object global, List<dynamic> value);

  external dynamic /* List<dynamic> */
      wire_get_memory_type__method__WasmiModuleId(
          List<dynamic> that, Object memory);

  external dynamic /* Uint8List */ wire_get_memory_data__method__WasmiModuleId(
      List<dynamic> that, Object memory);

  external dynamic /* Uint8List */ wire_read_memory__method__WasmiModuleId(
      List<dynamic> that, Object memory, int offset, int bytes);

  external dynamic /* int */ wire_get_memory_pages__method__WasmiModuleId(
      List<dynamic> that, Object memory);

  external dynamic /* void */ wire_write_memory__method__WasmiModuleId(
      List<dynamic> that, Object memory, int offset, Uint8List buffer);

  external dynamic /* int */ wire_grow_memory__method__WasmiModuleId(
      List<dynamic> that, Object memory, int pages);

  external dynamic /* int */ wire_get_table_size__method__WasmiModuleId(
      List<dynamic> that, Object table);

  external dynamic /* List<dynamic> */
      wire_get_table_type__method__WasmiModuleId(
          List<dynamic> that, Object table);

  external dynamic /* int */ wire_grow_table__method__WasmiModuleId(
      List<dynamic> that, Object table, int delta, List<dynamic> value);

  external dynamic /* List<dynamic>? */ wire_get_table__method__WasmiModuleId(
      List<dynamic> that, Object table, int index);

  external dynamic /* void */ wire_set_table__method__WasmiModuleId(
      List<dynamic> that, Object table, int index, List<dynamic> value);

  external dynamic /* void */ wire_fill_table__method__WasmiModuleId(
      List<dynamic> that,
      Object table,
      int index,
      List<dynamic> value,
      int len);

  external dynamic /* List<dynamic> */
      wire_get_module_imports__method__CompiledModule(List<dynamic> that);

  external dynamic /* List<dynamic> */
      wire_get_module_exports__method__CompiledModule(List<dynamic> that);

  external dynamic /*  */ drop_opaque_ArcStdSyncMutexModule(ptr);

  external int /* *const c_void */ share_opaque_ArcStdSyncMutexModule(ptr);

  external dynamic /*  */ drop_opaque_Func(ptr);

  external int /* *const c_void */ share_opaque_Func(ptr);

  external dynamic /*  */ drop_opaque_Global(ptr);

  external int /* *const c_void */ share_opaque_Global(ptr);

  external dynamic /*  */ drop_opaque_Memory(ptr);

  external int /* *const c_void */ share_opaque_Memory(ptr);

  external dynamic /*  */ drop_opaque_Table(ptr);

  external int /* *const c_void */ share_opaque_Table(ptr);
}

// Section: WASM wire connector

class WasmiDartWire extends FlutterRustBridgeWasmWireBase<WasmiDartWasmModule> {
  WasmiDartWire(FutureOr<WasmModule> module)
      : super(WasmModule.cast<WasmiDartWasmModule>(module));

  dynamic /* Object */ wire_create_shared_memory(List<dynamic> _module) =>
      wasmModule.wire_create_shared_memory(_module);

  dynamic /* List<dynamic> */ wire_module_builder(
          List<dynamic> module, List<dynamic>? wasi_config) =>
      wasmModule.wire_module_builder(module, wasi_config);

  void wire_parse_wat_format(NativePortType port_, String wat) =>
      wasmModule.wire_parse_wat_format(port_, wat);

  dynamic /* List<dynamic> */ wire_run_function(int pointer) =>
      wasmModule.wire_run_function(pointer);

  dynamic /* List<dynamic> */ wire_run_wasm_func(
          int pointer, List<dynamic> params) =>
      wasmModule.wire_run_wasm_func(pointer, params);

  dynamic /* List<dynamic> */ wire_run_wasm_func_mut(
          int pointer, List<dynamic> params) =>
      wasmModule.wire_run_wasm_func_mut(pointer, params);

  dynamic /* bool */ wire_run_wasm_func_void(
          int pointer, List<dynamic> params) =>
      wasmModule.wire_run_wasm_func_void(pointer, params);

  void wire_compile_wasm(
          NativePortType port_, Uint8List module_wasm, List<dynamic> config) =>
      wasmModule.wire_compile_wasm(port_, module_wasm, config);

  dynamic /* List<dynamic> */ wire_compile_wasm_sync(
          Uint8List module_wasm, List<dynamic> config) =>
      wasmModule.wire_compile_wasm_sync(module_wasm, config);

  void wire_call_wasm(NativePortType port_) => wasmModule.wire_call_wasm(port_);

  void wire_add(NativePortType port_, Object a, Object b) =>
      wasmModule.wire_add(port_, a, b);

  void wire_call_function__method__WasmiInstanceId(
          NativePortType port_, List<dynamic> that, String name) =>
      wasmModule.wire_call_function__method__WasmiInstanceId(port_, that, name);

  dynamic /* List<dynamic> */
      wire_call_function_with_args_sync__method__WasmiInstanceId(
              List<dynamic> that, String name, List<dynamic> args) =>
          wasmModule.wire_call_function_with_args_sync__method__WasmiInstanceId(
              that, name, args);

  void wire_call_function_with_args__method__WasmiInstanceId(
          NativePortType port_,
          List<dynamic> that,
          String name,
          List<dynamic> args) =>
      wasmModule.wire_call_function_with_args__method__WasmiInstanceId(
          port_, that, name, args);

  dynamic /* List<dynamic> */ wire_exports__method__WasmiInstanceId(
          List<dynamic> that) =>
      wasmModule.wire_exports__method__WasmiInstanceId(that);

  dynamic /* List<dynamic> */ wire_instantiate_sync__method__WasmiModuleId(
          List<dynamic> that) =>
      wasmModule.wire_instantiate_sync__method__WasmiModuleId(that);

  void wire_instantiate__method__WasmiModuleId(
          NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_instantiate__method__WasmiModuleId(port_, that);

  dynamic /* void */ wire_link_imports__method__WasmiModuleId(
          List<dynamic> that, List<dynamic> imports) =>
      wasmModule.wire_link_imports__method__WasmiModuleId(that, imports);

  void wire_dispose__method__WasmiModuleId(
          NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_dispose__method__WasmiModuleId(port_, that);

  dynamic /* List<dynamic> */
      wire_call_function_handle_sync__method__WasmiModuleId(
              List<dynamic> that, Object func, List<dynamic> args) =>
          wasmModule.wire_call_function_handle_sync__method__WasmiModuleId(
              that, func, args);

  void wire_call_function_handle__method__WasmiModuleId(NativePortType port_,
          List<dynamic> that, Object func, List<dynamic> args) =>
      wasmModule.wire_call_function_handle__method__WasmiModuleId(
          port_, that, func, args);

  dynamic /* List<dynamic> */ wire_get_function_type__method__WasmiModuleId(
          List<dynamic> that, Object func) =>
      wasmModule.wire_get_function_type__method__WasmiModuleId(that, func);

  dynamic /* Object */ wire_create_function__method__WasmiModuleId(
          List<dynamic> that,
          int function_pointer,
          int function_id,
          List<dynamic> param_types,
          List<dynamic> result_types) =>
      wasmModule.wire_create_function__method__WasmiModuleId(
          that, function_pointer, function_id, param_types, result_types);

  dynamic /* Object */ wire_create_memory__method__WasmiModuleId(
          List<dynamic> that, List<dynamic> memory_type) =>
      wasmModule.wire_create_memory__method__WasmiModuleId(that, memory_type);

  dynamic /* Object */ wire_create_global__method__WasmiModuleId(
          List<dynamic> that, List<dynamic> value, int mutability) =>
      wasmModule.wire_create_global__method__WasmiModuleId(
          that, value, mutability);

  dynamic /* Object */ wire_create_table__method__WasmiModuleId(
          List<dynamic> that, List<dynamic> value, List<dynamic> table_type) =>
      wasmModule.wire_create_table__method__WasmiModuleId(
          that, value, table_type);

  dynamic /* List<dynamic> */ wire_get_global_type__method__WasmiModuleId(
          List<dynamic> that, Object global) =>
      wasmModule.wire_get_global_type__method__WasmiModuleId(that, global);

  dynamic /* List<dynamic> */ wire_get_global_value__method__WasmiModuleId(
          List<dynamic> that, Object global) =>
      wasmModule.wire_get_global_value__method__WasmiModuleId(that, global);

  dynamic /* void */ wire_set_global_value__method__WasmiModuleId(
          List<dynamic> that, Object global, List<dynamic> value) =>
      wasmModule.wire_set_global_value__method__WasmiModuleId(
          that, global, value);

  dynamic /* List<dynamic> */ wire_get_memory_type__method__WasmiModuleId(
          List<dynamic> that, Object memory) =>
      wasmModule.wire_get_memory_type__method__WasmiModuleId(that, memory);

  dynamic /* Uint8List */ wire_get_memory_data__method__WasmiModuleId(
          List<dynamic> that, Object memory) =>
      wasmModule.wire_get_memory_data__method__WasmiModuleId(that, memory);

  dynamic /* Uint8List */ wire_read_memory__method__WasmiModuleId(
          List<dynamic> that, Object memory, int offset, int bytes) =>
      wasmModule.wire_read_memory__method__WasmiModuleId(
          that, memory, offset, bytes);

  dynamic /* int */ wire_get_memory_pages__method__WasmiModuleId(
          List<dynamic> that, Object memory) =>
      wasmModule.wire_get_memory_pages__method__WasmiModuleId(that, memory);

  dynamic /* void */ wire_write_memory__method__WasmiModuleId(
          List<dynamic> that, Object memory, int offset, Uint8List buffer) =>
      wasmModule.wire_write_memory__method__WasmiModuleId(
          that, memory, offset, buffer);

  dynamic /* int */ wire_grow_memory__method__WasmiModuleId(
          List<dynamic> that, Object memory, int pages) =>
      wasmModule.wire_grow_memory__method__WasmiModuleId(that, memory, pages);

  dynamic /* int */ wire_get_table_size__method__WasmiModuleId(
          List<dynamic> that, Object table) =>
      wasmModule.wire_get_table_size__method__WasmiModuleId(that, table);

  dynamic /* List<dynamic> */ wire_get_table_type__method__WasmiModuleId(
          List<dynamic> that, Object table) =>
      wasmModule.wire_get_table_type__method__WasmiModuleId(that, table);

  dynamic /* int */ wire_grow_table__method__WasmiModuleId(
          List<dynamic> that, Object table, int delta, List<dynamic> value) =>
      wasmModule.wire_grow_table__method__WasmiModuleId(
          that, table, delta, value);

  dynamic /* List<dynamic>? */ wire_get_table__method__WasmiModuleId(
          List<dynamic> that, Object table, int index) =>
      wasmModule.wire_get_table__method__WasmiModuleId(that, table, index);

  dynamic /* void */ wire_set_table__method__WasmiModuleId(
          List<dynamic> that, Object table, int index, List<dynamic> value) =>
      wasmModule.wire_set_table__method__WasmiModuleId(
          that, table, index, value);

  dynamic /* void */ wire_fill_table__method__WasmiModuleId(List<dynamic> that,
          Object table, int index, List<dynamic> value, int len) =>
      wasmModule.wire_fill_table__method__WasmiModuleId(
          that, table, index, value, len);

  dynamic /* List<dynamic> */ wire_get_module_imports__method__CompiledModule(
          List<dynamic> that) =>
      wasmModule.wire_get_module_imports__method__CompiledModule(that);

  dynamic /* List<dynamic> */ wire_get_module_exports__method__CompiledModule(
          List<dynamic> that) =>
      wasmModule.wire_get_module_exports__method__CompiledModule(that);

  dynamic /*  */ drop_opaque_ArcStdSyncMutexModule(ptr) =>
      wasmModule.drop_opaque_ArcStdSyncMutexModule(ptr);

  int /* *const c_void */ share_opaque_ArcStdSyncMutexModule(ptr) =>
      wasmModule.share_opaque_ArcStdSyncMutexModule(ptr);

  dynamic /*  */ drop_opaque_Func(ptr) => wasmModule.drop_opaque_Func(ptr);

  int /* *const c_void */ share_opaque_Func(ptr) =>
      wasmModule.share_opaque_Func(ptr);

  dynamic /*  */ drop_opaque_Global(ptr) => wasmModule.drop_opaque_Global(ptr);

  int /* *const c_void */ share_opaque_Global(ptr) =>
      wasmModule.share_opaque_Global(ptr);

  dynamic /*  */ drop_opaque_Memory(ptr) => wasmModule.drop_opaque_Memory(ptr);

  int /* *const c_void */ share_opaque_Memory(ptr) =>
      wasmModule.share_opaque_Memory(ptr);

  dynamic /*  */ drop_opaque_Table(ptr) => wasmModule.drop_opaque_Table(ptr);

  int /* *const c_void */ share_opaque_Table(ptr) =>
      wasmModule.share_opaque_Table(ptr);
}
