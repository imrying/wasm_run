// FILE GENERATED FROM WIT

// ignore_for_file: require_trailing_commas, unnecessary_raw_strings, unnecessary_non_null_assertion

// ignore: unused_import
import 'dart:typed_data';

import 'package:wasm_wit_component/wasm_wit_component.dart';

typedef T9 = List<String>;
typedef T8 = Result<void, void>;
typedef T6 = Result<String, void>;
typedef T4 = Option<int /*U32*/ >;
typedef T2 = (
  int /*U32*/,
  BigInt /*U64*/,
);
typedef T10 = T9;

/// a bitflags type
class Permissions {
  /// The flags represented as a set of bits.
  final FlagsBits flagsBits;

  /// Creates an instance where the flags are represented by [flagsBits].
  /// The number of flags must match the number of flags in the type (3).
  Permissions(this.flagsBits) : assert(flagsBits.numFlags == 3);

  /// An instance where all flags are set to `false`.
  Permissions.none() : flagsBits = FlagsBits.none(numFlags: 3);

  /// An instance where all flags are set to `true`.
  Permissions.all() : flagsBits = FlagsBits.all(numFlags: 3);

  /// Creates an instance with flags booleans passed as arguments.
  factory Permissions.fromBool(
      {bool read = false, bool write = false, bool exec = false}) {
    final value_ = Permissions.none();
    if (read) value_.read = true;
    if (write) value_.write = true;
    if (exec) value_.exec = true;
    return value_;
  }

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory Permissions.fromJson(Object? json) {
    final flagsBits = FlagsBits.fromJson(json, flagsKeys: _spec.labels);
    return Permissions(flagsBits);
  }

  /// Returns this as a serializable JSON value.
  Object toJson() => flagsBits.toJson();

  /// Returns this as a WASM canonical abi value.
  Uint32List toWasm() => Uint32List.sublistView(flagsBits.data);
  @override
  String toString() => 'Permissions(${[
        if (read) 'read',
        if (write) 'write',
        if (exec) 'exec',
      ].join(', ')})';
  @override
  bool operator ==(Object other) =>
      other is Permissions && comparator.areEqual(flagsBits, other.flagsBits);
  @override
  int get hashCode => comparator.hashValue(flagsBits);

  /// Returns the bitwise AND of the flags in this and [other].
  Permissions operator &(Permissions other) =>
      Permissions(flagsBits & other.flagsBits);

  /// Returns the bitwise OR of the flags in this and [other].
  Permissions operator |(Permissions other) =>
      Permissions(flagsBits | other.flagsBits);

  /// Returns the bitwise XOR of the flags in this and [other].
  Permissions operator ^(Permissions other) =>
      Permissions(flagsBits ^ other.flagsBits);

  /// Returns the flags inverted (negated).
  Permissions operator ~() => Permissions(~flagsBits);
  bool get read => flagsBits[0];
  set read(bool enable) => flagsBits[0] = enable;
  bool get write => flagsBits[1];
  set write(bool enable) => flagsBits[1] = enable;
  bool get exec => flagsBits[2];
  set exec(bool enable) => flagsBits[2] = enable;
  static const _spec = Flags(['read', 'write', 'exec']);
}

class ManyFlags {
  /// The flags represented as a set of bits.
  final FlagsBits flagsBits;

  /// Creates an instance where the flags are represented by [flagsBits].
  /// The number of flags must match the number of flags in the type (33).
  ManyFlags(this.flagsBits) : assert(flagsBits.numFlags == 33);

  /// An instance where all flags are set to `false`.
  ManyFlags.none() : flagsBits = FlagsBits.none(numFlags: 33);

  /// An instance where all flags are set to `true`.
  ManyFlags.all() : flagsBits = FlagsBits.all(numFlags: 33);

  /// Creates an instance with flags booleans passed as arguments.
  factory ManyFlags.fromBool(
      {bool f1 = false,
      bool f2 = false,
      bool f3 = false,
      bool f4 = false,
      bool f5 = false,
      bool f6 = false,
      bool f7 = false,
      bool f8 = false,
      bool f9 = false,
      bool f10 = false,
      bool f11 = false,
      bool f12 = false,
      bool f13 = false,
      bool f14 = false,
      bool f15 = false,
      bool f16 = false,
      bool f17 = false,
      bool f18 = false,
      bool f19 = false,
      bool f20 = false,
      bool f21 = false,
      bool f22 = false,
      bool f23 = false,
      bool f24 = false,
      bool f25 = false,
      bool f26 = false,
      bool f27 = false,
      bool f28 = false,
      bool f29 = false,
      bool f30 = false,
      bool f31 = false,
      bool f32 = false,
      bool f33 = false}) {
    final value_ = ManyFlags.none();
    if (f1) value_.f1 = true;
    if (f2) value_.f2 = true;
    if (f3) value_.f3 = true;
    if (f4) value_.f4 = true;
    if (f5) value_.f5 = true;
    if (f6) value_.f6 = true;
    if (f7) value_.f7 = true;
    if (f8) value_.f8 = true;
    if (f9) value_.f9 = true;
    if (f10) value_.f10 = true;
    if (f11) value_.f11 = true;
    if (f12) value_.f12 = true;
    if (f13) value_.f13 = true;
    if (f14) value_.f14 = true;
    if (f15) value_.f15 = true;
    if (f16) value_.f16 = true;
    if (f17) value_.f17 = true;
    if (f18) value_.f18 = true;
    if (f19) value_.f19 = true;
    if (f20) value_.f20 = true;
    if (f21) value_.f21 = true;
    if (f22) value_.f22 = true;
    if (f23) value_.f23 = true;
    if (f24) value_.f24 = true;
    if (f25) value_.f25 = true;
    if (f26) value_.f26 = true;
    if (f27) value_.f27 = true;
    if (f28) value_.f28 = true;
    if (f29) value_.f29 = true;
    if (f30) value_.f30 = true;
    if (f31) value_.f31 = true;
    if (f32) value_.f32 = true;
    if (f33) value_.f33 = true;
    return value_;
  }

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory ManyFlags.fromJson(Object? json) {
    final flagsBits = FlagsBits.fromJson(json, flagsKeys: _spec.labels);
    return ManyFlags(flagsBits);
  }

  /// Returns this as a serializable JSON value.
  Object toJson() => flagsBits.toJson();

  /// Returns this as a WASM canonical abi value.
  Uint32List toWasm() => Uint32List.sublistView(flagsBits.data);
  @override
  String toString() => 'ManyFlags(${[
        if (f1) 'f1',
        if (f2) 'f2',
        if (f3) 'f3',
        if (f4) 'f4',
        if (f5) 'f5',
        if (f6) 'f6',
        if (f7) 'f7',
        if (f8) 'f8',
        if (f9) 'f9',
        if (f10) 'f10',
        if (f11) 'f11',
        if (f12) 'f12',
        if (f13) 'f13',
        if (f14) 'f14',
        if (f15) 'f15',
        if (f16) 'f16',
        if (f17) 'f17',
        if (f18) 'f18',
        if (f19) 'f19',
        if (f20) 'f20',
        if (f21) 'f21',
        if (f22) 'f22',
        if (f23) 'f23',
        if (f24) 'f24',
        if (f25) 'f25',
        if (f26) 'f26',
        if (f27) 'f27',
        if (f28) 'f28',
        if (f29) 'f29',
        if (f30) 'f30',
        if (f31) 'f31',
        if (f32) 'f32',
        if (f33) 'f33',
      ].join(', ')})';
  @override
  bool operator ==(Object other) =>
      other is ManyFlags && comparator.areEqual(flagsBits, other.flagsBits);
  @override
  int get hashCode => comparator.hashValue(flagsBits);

  /// Returns the bitwise AND of the flags in this and [other].
  ManyFlags operator &(ManyFlags other) =>
      ManyFlags(flagsBits & other.flagsBits);

  /// Returns the bitwise OR of the flags in this and [other].
  ManyFlags operator |(ManyFlags other) =>
      ManyFlags(flagsBits | other.flagsBits);

  /// Returns the bitwise XOR of the flags in this and [other].
  ManyFlags operator ^(ManyFlags other) =>
      ManyFlags(flagsBits ^ other.flagsBits);

  /// Returns the flags inverted (negated).
  ManyFlags operator ~() => ManyFlags(~flagsBits);
  bool get f1 => flagsBits[0];
  set f1(bool enable) => flagsBits[0] = enable;
  bool get f2 => flagsBits[1];
  set f2(bool enable) => flagsBits[1] = enable;
  bool get f3 => flagsBits[2];
  set f3(bool enable) => flagsBits[2] = enable;
  bool get f4 => flagsBits[3];
  set f4(bool enable) => flagsBits[3] = enable;
  bool get f5 => flagsBits[4];
  set f5(bool enable) => flagsBits[4] = enable;
  bool get f6 => flagsBits[5];
  set f6(bool enable) => flagsBits[5] = enable;
  bool get f7 => flagsBits[6];
  set f7(bool enable) => flagsBits[6] = enable;
  bool get f8 => flagsBits[7];
  set f8(bool enable) => flagsBits[7] = enable;
  bool get f9 => flagsBits[8];
  set f9(bool enable) => flagsBits[8] = enable;
  bool get f10 => flagsBits[9];
  set f10(bool enable) => flagsBits[9] = enable;
  bool get f11 => flagsBits[10];
  set f11(bool enable) => flagsBits[10] = enable;
  bool get f12 => flagsBits[11];
  set f12(bool enable) => flagsBits[11] = enable;
  bool get f13 => flagsBits[12];
  set f13(bool enable) => flagsBits[12] = enable;
  bool get f14 => flagsBits[13];
  set f14(bool enable) => flagsBits[13] = enable;
  bool get f15 => flagsBits[14];
  set f15(bool enable) => flagsBits[14] = enable;
  bool get f16 => flagsBits[15];
  set f16(bool enable) => flagsBits[15] = enable;
  bool get f17 => flagsBits[16];
  set f17(bool enable) => flagsBits[16] = enable;
  bool get f18 => flagsBits[17];
  set f18(bool enable) => flagsBits[17] = enable;
  bool get f19 => flagsBits[18];
  set f19(bool enable) => flagsBits[18] = enable;
  bool get f20 => flagsBits[19];
  set f20(bool enable) => flagsBits[19] = enable;
  bool get f21 => flagsBits[20];
  set f21(bool enable) => flagsBits[20] = enable;
  bool get f22 => flagsBits[21];
  set f22(bool enable) => flagsBits[21] = enable;
  bool get f23 => flagsBits[22];
  set f23(bool enable) => flagsBits[22] = enable;
  bool get f24 => flagsBits[23];
  set f24(bool enable) => flagsBits[23] = enable;
  bool get f25 => flagsBits[24];
  set f25(bool enable) => flagsBits[24] = enable;
  bool get f26 => flagsBits[25];
  set f26(bool enable) => flagsBits[25] = enable;
  bool get f27 => flagsBits[26];
  set f27(bool enable) => flagsBits[26] = enable;
  bool get f28 => flagsBits[27];
  set f28(bool enable) => flagsBits[27] = enable;
  bool get f29 => flagsBits[28];
  set f29(bool enable) => flagsBits[28] = enable;
  bool get f30 => flagsBits[29];
  set f30(bool enable) => flagsBits[29] = enable;
  bool get f31 => flagsBits[30];
  set f31(bool enable) => flagsBits[30] = enable;
  bool get f32 => flagsBits[31];
  set f32(bool enable) => flagsBits[31] = enable;
  bool get f33 => flagsBits[32];
  set f33(bool enable) => flagsBits[32] = enable;
  static const _spec = Flags([
    'f1',
    'f2',
    'f3',
    'f4',
    'f5',
    'f6',
    'f7',
    'f8',
    'f9',
    'f10',
    'f11',
    'f12',
    'f13',
    'f14',
    'f15',
    'f16',
    'f17',
    'f18',
    'f19',
    'f20',
    'f21',
    'f22',
    'f23',
    'f24',
    'f25',
    'f26',
    'f27',
    'f28',
    'f29',
    'f30',
    'f31',
    'f32',
    'f33'
  ]);
}

/// similar to `variant`, but doesn't require naming cases and all variants
/// have a type payload -- note that this is not a C union, it still has a
/// discriminant
sealed class Input {
  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory Input.fromJson(Object? json_) {
    Object? json = json_;
    if (json is Map) {
      final k = json.keys.first;
      json = (k is int ? k : int.parse(k! as String), json.values.first);
    }
    return switch (json) {
      (0, final value) ||
      [0, final value] =>
        InputBigIntU64(bigIntFromJson(value)),
      (1, final value) ||
      [1, final value] =>
        InputString(value is String ? value : (value! as ParsedString).value),
      _ => throw Exception('Invalid JSON $json_'),
    };
  }
  const factory Input.bigIntU64(BigInt /*U64*/ value) = InputBigIntU64;
  const factory Input.string(String value) = InputString;

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson();

  /// Returns this as a WASM canonical abi value.
  (int, Object?) toWasm();
// ignore: unused_field
  static const _spec = Union([U64(), StringType()]);
}

class InputBigIntU64 implements Input {
  final BigInt /*U64*/ value;
  const InputBigIntU64(this.value);

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {'0': value.toString()};

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (0, value);
  @override
  String toString() => 'InputBigIntU64($value)';
  @override
  bool operator ==(Object other) =>
      other is InputBigIntU64 && comparator.areEqual(other.value, value);
  @override
  int get hashCode => comparator.hashValue(value);
}

class InputString implements Input {
  final String value;
  const InputString(this.value);

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {'1': value};

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (1, value);
  @override
  String toString() => 'InputString($value)';
  @override
  bool operator ==(Object other) =>
      other is InputString && comparator.areEqual(other.value, value);
  @override
  int get hashCode => comparator.hashValue(value);
}

/// values of this type will be one of the specified cases
sealed class HumanTypesInterface {
  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory HumanTypesInterface.fromJson(Object? json_) {
    Object? json = json_;
    if (json is Map) {
      final k = json.keys.first;
      json = (
        k is int ? k : _spec.cases.indexWhere((c) => c.label == k),
        json.values.first
      );
    }
    return switch (json) {
      (0, null) || [0, null] => const HumanTypesInterfaceBaby(),
      (1, final value) ||
      [1, final value] =>
        HumanTypesInterfaceChild(value! as int),
      (2, null) || [2, null] => const HumanTypesInterfaceAdult(),
      _ => throw Exception('Invalid JSON $json_'),
    };
  }
  const factory HumanTypesInterface.baby() = HumanTypesInterfaceBaby;
  const factory HumanTypesInterface.child(int /*U32*/ value) =
      HumanTypesInterfaceChild;
  const factory HumanTypesInterface.adult() = HumanTypesInterfaceAdult;

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson();

  /// Returns this as a WASM canonical abi value.
  (int, Object?) toWasm();
  static const _spec =
      Variant([Case('baby', null), Case('child', U32()), Case('adult', null)]);
}

class HumanTypesInterfaceBaby implements HumanTypesInterface {
  const HumanTypesInterfaceBaby();

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {'baby': null};

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (0, null);
  @override
  String toString() => 'HumanTypesInterfaceBaby()';
  @override
  bool operator ==(Object other) => other is HumanTypesInterfaceBaby;
  @override
  int get hashCode => (HumanTypesInterfaceBaby).hashCode;
}

/// type payload
class HumanTypesInterfaceChild implements HumanTypesInterface {
  final int /*U32*/ value;

  /// type payload
  const HumanTypesInterfaceChild(this.value);

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {'child': value};

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (1, value);
  @override
  String toString() => 'HumanTypesInterfaceChild($value)';
  @override
  bool operator ==(Object other) =>
      other is HumanTypesInterfaceChild &&
      comparator.areEqual(other.value, value);
  @override
  int get hashCode => comparator.hashValue(value);
}

class HumanTypesInterfaceAdult implements HumanTypesInterface {
  const HumanTypesInterfaceAdult();

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {'adult': null};

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (2, null);
  @override
  String toString() => 'HumanTypesInterfaceAdult()';
  @override
  bool operator ==(Object other) => other is HumanTypesInterfaceAdult;
  @override
  int get hashCode => (HumanTypesInterfaceAdult).hashCode;
}

/// similar to `variant`, but no type payloads
enum ErrnoTypesInterface {
  tooBig,
  tooSmall,
  tooFast,
  tooSlow;

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory ErrnoTypesInterface.fromJson(Object? json_) {
    final json = json_ is Map ? json_.keys.first : json_;
    if (json is String) {
      final index = _spec.labels.indexOf(json);
      return index != -1 ? values[index] : values.byName(json);
    }
    return json is (int, Object?) ? values[json.$1] : values[json! as int];
  }

  /// Returns this as a serializable JSON value.
  Object? toJson() => _spec.labels[index];

  /// Returns this as a WASM canonical abi value.
  int toWasm() => index;
  static const _spec =
      EnumType(['too-big', 'too-small', 'too-fast', 'too-slow']);
}

typedef T7 = Result<String /*Char*/, ErrnoTypesInterface>;

/// no "ok" type
typedef T5TypesInterface = Result<void, ErrnoTypesInterface>;

/// "package of named fields"
class R {
  final int /*U32*/ a;
  final String b;
  final List<
      (
        String,
        T4?,
      )> c;
  final Option<
      (
        List<BigInt /*S64*/ >,
        Option<BigInt /*U64*/ >?,
      )>? d;
  final ErrnoTypesInterface e;
  final Input i;
  final Permissions p;
  final ManyFlags f;

  /// "package of named fields"
  const R({
    required this.a,
    required this.b,
    required this.c,
    this.d,
    required this.e,
    required this.i,
    required this.p,
    required this.f,
  });

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory R.fromJson(Object? json_) {
    final json = json_ is Map
        ? _spec.fields.map((f) => json_[f.label]).toList(growable: false)
        : json_;
    return switch (json) {
      [
        final a,
        final b,
        final c,
        final d,
        final e,
        final i,
        final p,
        final f
      ] ||
      (
        final a,
        final b,
        final c,
        final d,
        final e,
        final i,
        final p,
        final f
      ) =>
        R(
          a: a! as int,
          b: b is String ? b : (b! as ParsedString).value,
          c: (c! as Iterable)
              .map((e) => (() {
                    final l = e is Map
                        ? List.generate(2, (i) => e[i.toString()],
                            growable: false)
                        : e;
                    return switch (l) {
                      [final v0, final v1] || (final v0, final v1) => (
                          v0 is String ? v0 : (v0! as ParsedString).value,
                          Option.fromJson(
                              v1,
                              (some) => Option.fromJson(
                                  some, (some) => some! as int)).value,
                        ),
                      _ => throw Exception('Invalid JSON $e')
                    };
                  })())
              .toList(),
          d: Option.fromJson(
              d,
              (some) => Option.fromJson(
                  some,
                  (some) => (() {
                        final l = some is Map
                            ? List.generate(2, (i) => some[i.toString()],
                                growable: false)
                            : some;
                        return switch (l) {
                          [final v0, final v1] || (final v0, final v1) => (
                              (v0! as Iterable).map(bigIntFromJson).toList(),
                              Option.fromJson(
                                      v1,
                                      (some) => Option.fromJson(
                                          some, (some) => bigIntFromJson(some)))
                                  .value,
                            ),
                          _ => throw Exception('Invalid JSON $some')
                        };
                      })())).value,
          e: ErrnoTypesInterface.fromJson(e),
          i: Input.fromJson(i),
          p: Permissions.fromJson(p),
          f: ManyFlags.fromJson(f),
        ),
      _ => throw Exception('Invalid JSON $json_')
    };
  }

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson() => {
        'a': a,
        'b': b,
        'c': c
            .map((e) => [
                  e.$1,
                  (e.$2 == null
                      ? const None().toJson()
                      : Option.fromValue(e.$2).toJson((some) => some.toJson()))
                ])
            .toList(),
        'd': (d == null
            ? const None().toJson()
            : Option.fromValue(d).toJson((some) => some.toJson((some) => [
                  some.$1.map((e) => e.toString()).toList(),
                  (some.$2 == null
                      ? const None().toJson()
                      : Option.fromValue(some.$2).toJson(
                          (some) => some.toJson((some) => some.toString())))
                ]))),
        'e': e.toJson(),
        'i': i.toJson(),
        'p': p.toJson(),
        'f': f.toJson(),
      };

  /// Returns this as a WASM canonical abi value.
  List<Object?> toWasm() => [
        a,
        b,
        c
            .map((e) => [
                  e.$1,
                  (e.$2 == null
                      ? const None().toWasm()
                      : Option.fromValue(e.$2).toWasm((some) => some.toWasm()))
                ])
            .toList(growable: false),
        (d == null
            ? const None().toWasm()
            : Option.fromValue(d).toWasm((some) => some.toWasm((some) => [
                  some.$1,
                  (some.$2 == null
                      ? const None().toWasm()
                      : Option.fromValue(some.$2)
                          .toWasm((some) => some.toWasm()))
                ]))),
        e.toWasm(),
        i.toWasm(),
        p.toWasm(),
        f.toWasm()
      ];
  @override
  String toString() =>
      'R${Map.fromIterables(_spec.fields.map((f) => f.label), _props)}';

  /// Returns a new instance by overriding the values passed as arguments
  R copyWith({
    int /*U32*/ ? a,
    String? b,
    List<
            (
              String,
              T4?,
            )>?
        c,
    Option<
            Option<
                (
                  List<BigInt /*S64*/ >,
                  Option<BigInt /*U64*/ >?,
                )>>?
        d,
    ErrnoTypesInterface? e,
    Input? i,
    Permissions? p,
    ManyFlags? f,
  }) =>
      R(
          a: a ?? this.a,
          b: b ?? this.b,
          c: c ?? this.c,
          d: d != null ? d.value : this.d,
          e: e ?? this.e,
          i: i ?? this.i,
          p: p ?? this.p,
          f: f ?? this.f);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is R && comparator.arePropsEqual(_props, other._props);
  @override
  int get hashCode => comparator.hashProps(_props);

  // ignore: unused_field
  List<Object?> get _props => [a, b, c, d, e, i, p, f];
  static const _spec = RecordType([
    (label: 'a', t: U32()),
    (label: 'b', t: StringType()),
    (
      label: 'c',
      t: ListType(Tuple([StringType(), OptionType(OptionType(U32()))]))
    ),
    (
      label: 'd',
      t: OptionType(
          OptionType(Tuple([ListType(S64()), OptionType(OptionType(U64()))])))
    ),
    (label: 'e', t: ErrnoTypesInterface._spec),
    (label: 'i', t: Input._spec),
    (label: 'p', t: Permissions._spec),
    (label: 'f', t: ManyFlags._spec)
  ]);
}

class RoundTripNumbersListData {
  final Uint8List un8;
  final Uint16List un16;
  final Uint32List un32;
  final List<BigInt /*U64*/ > un64;
  final Int8List si8;
  final Int16List si16;
  final Int32List si32;
  final List<BigInt /*S64*/ > si64;
  final List<List<BigInt /*S64*/ >> si64List;
  final List<List<BigInt /*U64*/ >> un64List;
  final List<Uint8List> un8List;
  final Float32List f32;
  final Float64List f64;
  const RoundTripNumbersListData({
    required this.un8,
    required this.un16,
    required this.un32,
    required this.un64,
    required this.si8,
    required this.si16,
    required this.si32,
    required this.si64,
    required this.si64List,
    required this.un64List,
    required this.un8List,
    required this.f32,
    required this.f64,
  });

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory RoundTripNumbersListData.fromJson(Object? json_) {
    final json = json_ is Map
        ? _spec.fields.map((f) => json_[f.label]).toList(growable: false)
        : json_;
    return switch (json) {
      [
        final un8,
        final un16,
        final un32,
        final un64,
        final si8,
        final si16,
        final si32,
        final si64,
        final si64List,
        final un64List,
        final un8List,
        final f32,
        final f64
      ] ||
      (
        final un8,
        final un16,
        final un32,
        final un64,
        final si8,
        final si16,
        final si32,
        final si64,
        final si64List,
        final un64List,
        final un8List,
        final f32,
        final f64
      ) =>
        RoundTripNumbersListData(
          un8: (un8 is Uint8List
              ? un8
              : Uint8List.fromList((un8! as List).cast())),
          un16: (un16 is Uint16List
              ? un16
              : Uint16List.fromList((un16! as List).cast())),
          un32: (un32 is Uint32List
              ? un32
              : Uint32List.fromList((un32! as List).cast())),
          un64: (un64! as Iterable).map(bigIntFromJson).toList(),
          si8: (si8 is Int8List
              ? si8
              : Int8List.fromList((si8! as List).cast())),
          si16: (si16 is Int16List
              ? si16
              : Int16List.fromList((si16! as List).cast())),
          si32: (si32 is Int32List
              ? si32
              : Int32List.fromList((si32! as List).cast())),
          si64: (si64! as Iterable).map(bigIntFromJson).toList(),
          si64List: (si64List! as Iterable)
              .map((e) => (e! as Iterable).map(bigIntFromJson).toList())
              .toList(),
          un64List: (un64List! as Iterable)
              .map((e) => (e! as Iterable).map(bigIntFromJson).toList())
              .toList(),
          un8List: (un8List! as Iterable)
              .map((e) => (e is Uint8List
                  ? e
                  : Uint8List.fromList((e! as List).cast())))
              .toList(),
          f32: (f32 is Float32List
              ? f32
              : Float32List.fromList((f32! as List).cast())),
          f64: (f64 is Float64List
              ? f64
              : Float64List.fromList((f64! as List).cast())),
        ),
      _ => throw Exception('Invalid JSON $json_')
    };
  }

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson() => {
        'un8': un8.toList(),
        'un16': un16.toList(),
        'un32': un32.toList(),
        'un64': un64.map((e) => e.toString()).toList(),
        'si8': si8.toList(),
        'si16': si16.toList(),
        'si32': si32.toList(),
        'si64': si64.map((e) => e.toString()).toList(),
        'si64-list':
            si64List.map((e) => e.map((e) => e.toString()).toList()).toList(),
        'un64-list':
            un64List.map((e) => e.map((e) => e.toString()).toList()).toList(),
        'un8-list': un8List.map((e) => e.toList()).toList(),
        'f32': f32.toList(),
        'f64': f64.toList(),
      };

  /// Returns this as a WASM canonical abi value.
  List<Object?> toWasm() => [
        un8,
        un16,
        un32,
        un64,
        si8,
        si16,
        si32,
        si64,
        si64List,
        un64List,
        un8List,
        f32,
        f64
      ];
  @override
  String toString() =>
      'RoundTripNumbersListData${Map.fromIterables(_spec.fields.map((f) => f.label), _props)}';

  /// Returns a new instance by overriding the values passed as arguments
  RoundTripNumbersListData copyWith({
    Uint8List? un8,
    Uint16List? un16,
    Uint32List? un32,
    List<BigInt /*U64*/ >? un64,
    Int8List? si8,
    Int16List? si16,
    Int32List? si32,
    List<BigInt /*S64*/ >? si64,
    List<List<BigInt /*S64*/ >>? si64List,
    List<List<BigInt /*U64*/ >>? un64List,
    List<Uint8List>? un8List,
    Float32List? f32,
    Float64List? f64,
  }) =>
      RoundTripNumbersListData(
          un8: un8 ?? this.un8,
          un16: un16 ?? this.un16,
          un32: un32 ?? this.un32,
          un64: un64 ?? this.un64,
          si8: si8 ?? this.si8,
          si16: si16 ?? this.si16,
          si32: si32 ?? this.si32,
          si64: si64 ?? this.si64,
          si64List: si64List ?? this.si64List,
          un64List: un64List ?? this.un64List,
          un8List: un8List ?? this.un8List,
          f32: f32 ?? this.f32,
          f64: f64 ?? this.f64);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundTripNumbersListData &&
          comparator.arePropsEqual(_props, other._props);
  @override
  int get hashCode => comparator.hashProps(_props);

  // ignore: unused_field
  List<Object?> get _props => [
        un8,
        un16,
        un32,
        un64,
        si8,
        si16,
        si32,
        si64,
        si64List,
        un64List,
        un8List,
        f32,
        f64
      ];
  static const _spec = RecordType([
    (label: 'un8', t: ListType(U8())),
    (label: 'un16', t: ListType(U16())),
    (label: 'un32', t: ListType(U32())),
    (label: 'un64', t: ListType(U64())),
    (label: 'si8', t: ListType(S8())),
    (label: 'si16', t: ListType(S16())),
    (label: 'si32', t: ListType(S32())),
    (label: 'si64', t: ListType(S64())),
    (label: 'si64-list', t: ListType(ListType(S64()))),
    (label: 'un64-list', t: ListType(ListType(U64()))),
    (label: 'un8-list', t: ListType(ListType(U8()))),
    (label: 'f32', t: ListType(Float32())),
    (label: 'f64', t: ListType(Float64()))
  ]);
}

class RoundTripNumbersData {
  final int /*U8*/ un8;
  final int /*U16*/ un16;
  final int /*U32*/ un32;
  final BigInt /*U64*/ un64;
  final int /*S8*/ si8;
  final int /*S16*/ si16;
  final int /*S32*/ si32;
  final BigInt /*S64*/ si64;
  final double /*F32*/ f32;
  final double /*F64*/ f64;
  const RoundTripNumbersData({
    required this.un8,
    required this.un16,
    required this.un32,
    required this.un64,
    required this.si8,
    required this.si16,
    required this.si32,
    required this.si64,
    required this.f32,
    required this.f64,
  });

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory RoundTripNumbersData.fromJson(Object? json_) {
    final json = json_ is Map
        ? _spec.fields.map((f) => json_[f.label]).toList(growable: false)
        : json_;
    return switch (json) {
      [
        final un8,
        final un16,
        final un32,
        final un64,
        final si8,
        final si16,
        final si32,
        final si64,
        final f32,
        final f64
      ] ||
      (
        final un8,
        final un16,
        final un32,
        final un64,
        final si8,
        final si16,
        final si32,
        final si64,
        final f32,
        final f64
      ) =>
        RoundTripNumbersData(
          un8: un8! as int,
          un16: un16! as int,
          un32: un32! as int,
          un64: bigIntFromJson(un64),
          si8: si8! as int,
          si16: si16! as int,
          si32: si32! as int,
          si64: bigIntFromJson(si64),
          f32: f32! as double,
          f64: f64! as double,
        ),
      _ => throw Exception('Invalid JSON $json_')
    };
  }

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson() => {
        'un8': un8,
        'un16': un16,
        'un32': un32,
        'un64': un64.toString(),
        'si8': si8,
        'si16': si16,
        'si32': si32,
        'si64': si64.toString(),
        'f32': f32,
        'f64': f64,
      };

  /// Returns this as a WASM canonical abi value.
  List<Object?> toWasm() =>
      [un8, un16, un32, un64, si8, si16, si32, si64, f32, f64];
  @override
  String toString() =>
      'RoundTripNumbersData${Map.fromIterables(_spec.fields.map((f) => f.label), _props)}';

  /// Returns a new instance by overriding the values passed as arguments
  RoundTripNumbersData copyWith({
    int /*U8*/ ? un8,
    int /*U16*/ ? un16,
    int /*U32*/ ? un32,
    BigInt /*U64*/ ? un64,
    int /*S8*/ ? si8,
    int /*S16*/ ? si16,
    int /*S32*/ ? si32,
    BigInt /*S64*/ ? si64,
    double /*F32*/ ? f32,
    double /*F64*/ ? f64,
  }) =>
      RoundTripNumbersData(
          un8: un8 ?? this.un8,
          un16: un16 ?? this.un16,
          un32: un32 ?? this.un32,
          un64: un64 ?? this.un64,
          si8: si8 ?? this.si8,
          si16: si16 ?? this.si16,
          si32: si32 ?? this.si32,
          si64: si64 ?? this.si64,
          f32: f32 ?? this.f32,
          f64: f64 ?? this.f64);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundTripNumbersData &&
          comparator.arePropsEqual(_props, other._props);
  @override
  int get hashCode => comparator.hashProps(_props);

  // ignore: unused_field
  List<Object?> get _props =>
      [un8, un16, un32, un64, si8, si16, si32, si64, f32, f64];
  static const _spec = RecordType([
    (label: 'un8', t: U8()),
    (label: 'un16', t: U16()),
    (label: 'un32', t: U32()),
    (label: 'un64', t: U64()),
    (label: 'si8', t: S8()),
    (label: 'si16', t: S16()),
    (label: 'si32', t: S32()),
    (label: 'si64', t: S64()),
    (label: 'f32', t: Float32()),
    (label: 'f64', t: Float64())
  ]);
}

typedef ErrnoApiImports = ErrnoTypesInterface;

/// Same name as the type in `types-interface`, but this is a different type
sealed class HumanApiImports {
  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory HumanApiImports.fromJson(Object? json_) {
    Object? json = json_;
    if (json is Map) {
      final k = json.keys.first;
      json = (
        k is int ? k : _spec.cases.indexWhere((c) => c.label == k),
        json.values.first
      );
    }
    return switch (json) {
      (0, null) || [0, null] => const HumanApiImportsBaby(),
      (1, final value) ||
      [1, final value] =>
        HumanApiImportsChild(bigIntFromJson(value)),
      (2, final value) || [2, final value] => HumanApiImportsAdult((() {
          final l = value is Map
              ? List.generate(3, (i) => value[i.toString()], growable: false)
              : value;
          return switch (l) {
            [final v0, final v1, final v2] ||
            (final v0, final v1, final v2) =>
              (
                v0 is String ? v0 : (v0! as ParsedString).value,
                Option.fromJson(
                    v1,
                    (some) => Option.fromJson(
                        some,
                        (some) => some is String
                            ? some
                            : (some! as ParsedString).value)).value,
                (() {
                  final l = v2 is Map
                      ? List.generate(1, (i) => v2[i.toString()],
                          growable: false)
                      : v2;
                  return switch (l) {
                    [final v0] || (final v0,) => (bigIntFromJson(v0),),
                    _ => throw Exception('Invalid JSON $v2')
                  };
                })(),
              ),
            _ => throw Exception('Invalid JSON $value')
          };
        })()),
      _ => throw Exception('Invalid JSON $json_'),
    };
  }
  const factory HumanApiImports.baby() = HumanApiImportsBaby;
  const factory HumanApiImports.child(BigInt /*U64*/ value) =
      HumanApiImportsChild;
  const factory HumanApiImports.adult(
      (
        String,
        Option<String>?,
        (BigInt /*S64*/,),
      ) value) = HumanApiImportsAdult;

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson();

  /// Returns this as a WASM canonical abi value.
  (int, Object?) toWasm();
  static const _spec = Variant([
    Case('baby', null),
    Case('child', U64()),
    Case(
        'adult',
        Tuple([
          StringType(),
          OptionType(OptionType(StringType())),
          Tuple([S64()])
        ]))
  ]);
}

class HumanApiImportsBaby implements HumanApiImports {
  const HumanApiImportsBaby();

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {'baby': null};

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (0, null);
  @override
  String toString() => 'HumanApiImportsBaby()';
  @override
  bool operator ==(Object other) => other is HumanApiImportsBaby;
  @override
  int get hashCode => (HumanApiImportsBaby).hashCode;
}

class HumanApiImportsChild implements HumanApiImports {
  final BigInt /*U64*/ value;
  const HumanApiImportsChild(this.value);

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {'child': value.toString()};

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (1, value);
  @override
  String toString() => 'HumanApiImportsChild($value)';
  @override
  bool operator ==(Object other) =>
      other is HumanApiImportsChild && comparator.areEqual(other.value, value);
  @override
  int get hashCode => comparator.hashValue(value);
}

class HumanApiImportsAdult implements HumanApiImports {
  final (
    String,
    Option<String>?,
    (BigInt /*S64*/,),
  ) value;
  const HumanApiImportsAdult(this.value);

  /// Returns this as a serializable JSON value.
  @override
  Map<String, Object?> toJson() => {
        'adult': [
          value.$1,
          (value.$2 == null
              ? const None().toJson()
              : Option.fromValue(value.$2).toJson((some) => some.toJson())),
          [value.$3.$1.toString()]
        ]
      };

  /// Returns this as a WASM canonical abi value.
  @override
  (int, Object?) toWasm() => (
        2,
        [
          value.$1,
          (value.$2 == null
              ? const None().toWasm()
              : Option.fromValue(value.$2).toWasm((some) => some.toWasm())),
          [value.$3.$1]
        ]
      );
  @override
  String toString() => 'HumanApiImportsAdult($value)';
  @override
  bool operator ==(Object other) =>
      other is HumanApiImportsAdult && comparator.areEqual(other.value, value);
  @override
  int get hashCode => comparator.hashValue(value);
}

typedef ErrnoRenamed = ErrnoTypesInterface;

class ErrnoApi {
  final BigInt /*U64*/ aU1;

  /// A list of signed 64-bit integers
  final List<BigInt /*S64*/ > listS1;
  final String? str;
  final String /*Char*/ ? c;
  const ErrnoApi({
    required this.aU1,
    required this.listS1,
    this.str,
    this.c,
  });

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory ErrnoApi.fromJson(Object? json_) {
    final json = json_ is Map
        ? _spec.fields.map((f) => json_[f.label]).toList(growable: false)
        : json_;
    return switch (json) {
      [final aU1, final listS1, final str, final c] ||
      (final aU1, final listS1, final str, final c) =>
        ErrnoApi(
          aU1: bigIntFromJson(aU1),
          listS1: (listS1! as Iterable).map(bigIntFromJson).toList(),
          str: Option.fromJson(
              str,
              (some) =>
                  some is String ? some : (some! as ParsedString).value).value,
          c: Option.fromJson(c, (some) => some! as String).value,
        ),
      _ => throw Exception('Invalid JSON $json_')
    };
  }

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson() => {
        'a-u1': aU1.toString(),
        'list-s1': listS1.map((e) => e.toString()).toList(),
        'str': (str == null
            ? const None().toJson()
            : Option.fromValue(str).toJson()),
        'c': (c == null ? const None().toJson() : Option.fromValue(c).toJson()),
      };

  /// Returns this as a WASM canonical abi value.
  List<Object?> toWasm() => [
        aU1,
        listS1,
        (str == null ? const None().toWasm() : Option.fromValue(str).toWasm()),
        (c == null ? const None().toWasm() : Option.fromValue(c).toWasm())
      ];
  @override
  String toString() =>
      'ErrnoApi${Map.fromIterables(_spec.fields.map((f) => f.label), _props)}';

  /// Returns a new instance by overriding the values passed as arguments
  ErrnoApi copyWith({
    BigInt /*U64*/ ? aU1,
    List<BigInt /*S64*/ >? listS1,
    Option<String>? str,
    Option<String /*Char*/ >? c,
  }) =>
      ErrnoApi(
          aU1: aU1 ?? this.aU1,
          listS1: listS1 ?? this.listS1,
          str: str != null ? str.value : this.str,
          c: c != null ? c.value : this.c);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrnoApi && comparator.arePropsEqual(_props, other._props);
  @override
  int get hashCode => comparator.hashProps(_props);

  // ignore: unused_field
  List<Object?> get _props => [aU1, listS1, str, c];
  static const _spec = RecordType([
    (label: 'a-u1', t: U64()),
    (label: 'list-s1', t: ListType(S64())),
    (label: 'str', t: OptionType(StringType())),
    (label: 'c', t: OptionType(Char()))
  ]);
}

/// Comment for t5 in api
typedef T5Api = Result<void, ErrnoApi?>;
typedef T2Renamed = T2;

enum LogLevel {
  /// lowest level
  debug,
  info,
  warn,
  error;

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory LogLevel.fromJson(Object? json_) {
    final json = json_ is Map ? json_.keys.first : json_;
    if (json is String) {
      final index = _spec.labels.indexOf(json);
      return index != -1 ? values[index] : values.byName(json);
    }
    return json is (int, Object?) ? values[json.$1] : values[json! as int];
  }

  /// Returns this as a serializable JSON value.
  Object? toJson() => _spec.labels[index];

  /// Returns this as a WASM canonical abi value.
  int toWasm() => index;
  static const _spec = EnumType(['debug', 'info', 'warn', 'error']);
}

class Empty {
  const Empty();

  /// Returns a new instance from a JSON value.
  /// May throw if the value does not have the expected structure.
  factory Empty.fromJson(Object? _) => const Empty();

  /// Returns this as a serializable JSON value.
  Map<String, Object?> toJson() => {};

  /// Returns this as a WASM canonical abi value.
  List<Object?> toWasm() => [];
  @override
  String toString() =>
      'Empty${Map.fromIterables(_spec.fields.map((f) => f.label), _props)}';

  /// Returns a new instance by overriding the values passed as arguments
  Empty copyWith() => Empty();
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Empty && comparator.arePropsEqual(_props, other._props);
  @override
  int get hashCode => comparator.hashProps(_props);

  // ignore: unused_field
  List<Object?> get _props => [];
  static const _spec = RecordType([]);
}

/// Comment for import interface
abstract class ApiImportsImport {
  ({T7 h1, HumanApiImports val2}) apiA1B2({
    required List<HumanApiImports> arg,
  });

  /// Function with a record, enum, flags and union types
  ({R r, ErrnoApiImports e, Permissions p, Input i}) recordFunc({
    required R r,
    required ErrnoApiImports e,
    required Permissions p,
    required Input i,
  });
}

/// Comment for import inline
abstract class InlineImport {
  /// Comment for import inline function
  Result<void, String /*Char*/ > inlineImp({
    required List<String /*Char*/ ?> args,
  });
}

abstract class RoundTripNumbersImport {
  RoundTripNumbersData roundTripNumbers({
    required RoundTripNumbersData data,
  });
  RoundTripNumbersListData roundTripNumbersList({
    required RoundTripNumbersListData data,
  });
}

class TypesExampleWorldImports {
  final ApiImportsImport apiImports;
  final InlineImport inline;
  final RoundTripNumbersImport roundTripNumbers;
  final void Function({
    required String message,
    required LogLevel level,
  }) print;
  const TypesExampleWorldImports({
    required this.apiImports,
    required this.inline,
    required this.roundTripNumbers,
    required this.print,
  });
}

class RoundTripNumbers {
  RoundTripNumbers(WasmLibrary library)
      : _roundTripNumbers = library.getComponentFunction(
          'types-example-namespace:types-example-pkg/round-trip-numbers#round-trip-numbers',
          const FuncType([('data', RoundTripNumbersData._spec)],
              [('', RoundTripNumbersData._spec)]),
        )!,
        _roundTripNumbersList = library.getComponentFunction(
          'types-example-namespace:types-example-pkg/round-trip-numbers#round-trip-numbers-list',
          const FuncType([('data', RoundTripNumbersListData._spec)],
              [('', RoundTripNumbersListData._spec)]),
        )!;
  final ListValue Function(ListValue) _roundTripNumbers;
  RoundTripNumbersData roundTripNumbers({
    required RoundTripNumbersData data,
  }) {
    final results = _roundTripNumbers([data.toWasm()]);
    final result = results[0];
    return RoundTripNumbersData.fromJson(result);
  }

  final ListValue Function(ListValue) _roundTripNumbersList;
  RoundTripNumbersListData roundTripNumbersList({
    required RoundTripNumbersListData data,
  }) {
    final results = _roundTripNumbersList([data.toWasm()]);
    final result = results[0];
    return RoundTripNumbersListData.fromJson(result);
  }
}

class Api {
  Api(WasmLibrary library)
      : _f12 = library.getComponentFunction(
          'types-example-namespace:types-example-pkg/api#f12',
          const FuncType([], [
            ('val-one', Tuple([S32()])),
            ('val2', StringType())
          ]),
        )!,
        _class_ = library.getComponentFunction(
          'types-example-namespace:types-example-pkg/api#class',
          const FuncType([
            (
              'break',
              OptionType(
                  OptionType(ResultType(null, OptionType(ErrnoApi._spec))))
            )
          ], [
            ('', Tuple([]))
          ]),
        )!,
        _continue_ = library.getComponentFunction(
          'types-example-namespace:types-example-pkg/api#continue',
          const FuncType([
            ('abstract', OptionType(ResultType(null, ErrnoApi._spec))),
            ('extends', Tuple([]))
          ], [
            ('implements', OptionType(Tuple([])))
          ]),
        )!,
        _recordFunc = library.getComponentFunction(
          'types-example-namespace:types-example-pkg/api#record-func',
          const FuncType([
            ('r', R._spec),
            ('e', ErrnoTypesInterface._spec),
            ('p', Permissions._spec),
            ('i', Input._spec)
          ], [
            ('r', R._spec),
            ('e', ErrnoTypesInterface._spec),
            ('p', Permissions._spec),
            ('i', Input._spec)
          ]),
        )!;
  final ListValue Function(ListValue) _f12;

  /// Comment for export function
  ({(int /*S32*/,) valOne, String val2}) f12() {
    final results = _f12([]);
    final r0 = results[0];
    final r1 = results[1];
    return (
      valOne: (() {
        final l = r0 is Map
            ? List.generate(1, (i) => r0[i.toString()], growable: false)
            : r0;
        return switch (l) {
          [final v0] || (final v0,) => (v0! as int,),
          _ => throw Exception('Invalid JSON $r0')
        };
      })(),
      val2: r1 is String ? r1 : (r1! as ParsedString).value,
    );
  }

  final ListValue Function(ListValue) _class_;
  () class_({
    Option<T5Api>? break_,
  }) {
    _class_([
      (break_ == null
          ? const None().toWasm()
          : Option.fromValue(break_).toWasm((some) => some.toWasm((some) =>
              some.toWasm(
                  null,
                  (error) => (error == null
                      ? const None().toWasm()
                      : Option.fromValue(error)
                          .toWasm((some) => some.toWasm()))))))
    ]);
    return ();
  }

  final ListValue Function(ListValue) _continue_;
  ({Object? implements_}) continue_({
    Result<void, ErrnoApi>? abstract_,
    required () extends_,
  }) {
    final results = _continue_([
      (abstract_ == null
          ? const None().toWasm()
          : Option.fromValue(abstract_)
              .toWasm((some) => some.toWasm(null, (error) => error.toWasm()))),
      []
    ]);
    final r0 = results[0];
    return (implements_: Option.fromJson(r0, (some) => ()).value,);
  }

  final ListValue Function(ListValue) _recordFunc;

  /// Function with a record, enum, flags and union types
  ({R r, ErrnoRenamed e, Permissions p, Input i}) recordFunc({
    required R r,
    required ErrnoRenamed e,
    required Permissions p,
    required Input i,
  }) {
    final results =
        _recordFunc([r.toWasm(), e.toWasm(), p.toWasm(), i.toWasm()]);
    final r0 = results[0];
    final r1 = results[1];
    final r2 = results[2];
    final r3 = results[3];
    return (
      r: R.fromJson(r0),
      e: ErrnoTypesInterface.fromJson(r1),
      p: Permissions.fromJson(r2),
      i: Input.fromJson(r3),
    );
  }
}

class TypesExampleWorld {
  final TypesExampleWorldImports imports;
  final WasmLibrary library;
  final RoundTripNumbers roundTripNumbers;
  final Api api;

  TypesExampleWorld({
    required this.imports,
    required this.library,
  })  : roundTripNumbers = RoundTripNumbers(library),
        api = Api(library),
        _fF1 = library.getComponentFunction(
          'f-f1',
          const FuncType([('typedef', ListType(StringType()))],
              [('', ListType(StringType()))]),
        )!,
        _f1 = library.getComponentFunction(
          'f1',
          const FuncType([
            ('f', Float32()),
            ('f-list', ListType(Tuple([Char(), Float64()])))
          ], [
            ('val-p1', S64()),
            ('val2', StringType())
          ]),
        )!,
        _reNamed = library.getComponentFunction(
          're-named',
          const FuncType([
            ('perm', OptionType(Permissions._spec)),
            ('e', OptionType(Empty._spec))
          ], [
            ('', Tuple([U32(), U64()]))
          ]),
        )!,
        _reNamed2 = library.getComponentFunction(
          're-named2',
          const FuncType([
            ('tup', Tuple([ListType(U16())])),
            ('e', Empty._spec)
          ], [
            ('', Tuple([OptionType(U8()), S8()]))
          ]),
        )!;

  static Future<TypesExampleWorld> init(
    WasmInstanceBuilder builder, {
    required TypesExampleWorldImports imports,
  }) async {
    late final WasmLibrary library;
    WasmLibrary getLib() => library;

    {
      const ft = FuncType([
        ('arg', ListType(HumanApiImports._spec))
      ], [
        ('h1', ResultType(Char(), ErrnoTypesInterface._spec)),
        ('val2', HumanApiImports._spec)
      ]);

      (ListValue, void Function()) execImportsApiImportsApiA1b2(
          ListValue args) {
        final args0 = args[0];
        final results = imports.apiImports.apiA1B2(
            arg: (args0! as Iterable).map(HumanApiImports.fromJson).toList());
        return (
          [
            results.h1.toWasm(null, (error) => error.toWasm()),
            results.val2.toWasm()
          ],
          () {}
        );
      }

      final lowered = loweredImportFunction(
          r'types-example-namespace:types-example-pkg/api-imports#api-a1-b2',
          ft,
          execImportsApiImportsApiA1b2,
          getLib);
      builder.addImport(
          r'types-example-namespace:types-example-pkg/api-imports',
          'api-a1-b2',
          lowered);
    }
    {
      const ft = FuncType([
        ('r', R._spec),
        ('e', ErrnoTypesInterface._spec),
        ('p', Permissions._spec),
        ('i', Input._spec)
      ], [
        ('r', R._spec),
        ('e', ErrnoTypesInterface._spec),
        ('p', Permissions._spec),
        ('i', Input._spec)
      ]);

      (ListValue, void Function()) execImportsApiImportsRecordFunc(
          ListValue args) {
        final args0 = args[0];
        final args1 = args[1];
        final args2 = args[2];
        final args3 = args[3];
        final results = imports.apiImports.recordFunc(
            r: R.fromJson(args0),
            e: ErrnoTypesInterface.fromJson(args1),
            p: Permissions.fromJson(args2),
            i: Input.fromJson(args3));
        return (
          [
            results.r.toWasm(),
            results.e.toWasm(),
            results.p.toWasm(),
            results.i.toWasm()
          ],
          () {}
        );
      }

      final lowered = loweredImportFunction(
          r'types-example-namespace:types-example-pkg/api-imports#record-func',
          ft,
          execImportsApiImportsRecordFunc,
          getLib);
      builder.addImport(
          r'types-example-namespace:types-example-pkg/api-imports',
          'record-func',
          lowered);
    }
    {
      const ft = FuncType([('args', ListType(OptionType(Char())))],
          [('', ResultType(null, Char()))]);

      (ListValue, void Function()) execImportsInlineInlineImp(ListValue args) {
        final args0 = args[0];
        final results = imports.inline.inlineImp(
            args: (args0! as Iterable)
                .map((e) => Option.fromJson(e, (some) => some! as String).value)
                .toList());
        return ([results.toWasm(null, null)], () {});
      }

      final lowered = loweredImportFunction(
          r'inline#inline-imp', ft, execImportsInlineInlineImp, getLib);
      builder.addImport(r'inline', 'inline-imp', lowered);
    }
    {
      const ft = FuncType([('data', RoundTripNumbersData._spec)],
          [('', RoundTripNumbersData._spec)]);

      (ListValue, void Function()) execImportsRoundTripNumbersRoundTripNumbers(
          ListValue args) {
        final args0 = args[0];
        final results = imports.roundTripNumbers
            .roundTripNumbers(data: RoundTripNumbersData.fromJson(args0));
        return ([results.toWasm()], () {});
      }

      final lowered = loweredImportFunction(
          r'types-example-namespace:types-example-pkg/round-trip-numbers#round-trip-numbers',
          ft,
          execImportsRoundTripNumbersRoundTripNumbers,
          getLib);
      builder.addImport(
          r'types-example-namespace:types-example-pkg/round-trip-numbers',
          'round-trip-numbers',
          lowered);
    }
    {
      const ft = FuncType([('data', RoundTripNumbersListData._spec)],
          [('', RoundTripNumbersListData._spec)]);

      (ListValue, void Function())
          execImportsRoundTripNumbersRoundTripNumbersList(ListValue args) {
        final args0 = args[0];
        final results = imports.roundTripNumbers.roundTripNumbersList(
            data: RoundTripNumbersListData.fromJson(args0));
        return ([results.toWasm()], () {});
      }

      final lowered = loweredImportFunction(
          r'types-example-namespace:types-example-pkg/round-trip-numbers#round-trip-numbers-list',
          ft,
          execImportsRoundTripNumbersRoundTripNumbersList,
          getLib);
      builder.addImport(
          r'types-example-namespace:types-example-pkg/round-trip-numbers',
          'round-trip-numbers-list',
          lowered);
    }
    {
      const ft =
          FuncType([('message', StringType()), ('level', LogLevel._spec)], []);

      (ListValue, void Function()) execImportsPrint(ListValue args) {
        final args0 = args[0];
        final args1 = args[1];
        imports.print(
            message: args0 is String ? args0 : (args0! as ParsedString).value,
            level: LogLevel.fromJson(args1));
        return (const [], () {});
      }

      final lowered =
          loweredImportFunction(r'$root#print', ft, execImportsPrint, getLib);
      builder.addImport(r'$root', 'print', lowered);
    }

    final instance = await builder.build();

    library = WasmLibrary(instance, int64Type: Int64TypeConfig.bigInt);
    return TypesExampleWorld(imports: imports, library: library);
  }

  final ListValue Function(ListValue) _fF1;
  T10 fF1({
    required T10 typedef_,
  }) {
    final results = _fF1([typedef_]);
    final result = results[0];
    return (result! as Iterable)
        .map((e) => e is String ? e : (e! as ParsedString).value)
        .toList();
  }

  final ListValue Function(ListValue) _f1;
  ({BigInt /*S64*/ valP1, String val2}) f1({
    required double /*F32*/ f,
    required List<
            (
              String /*Char*/,
              double /*F64*/,
            )>
        fList,
  }) {
    final results = _f1([
      f,
      fList.map((e) => [e.$1, e.$2]).toList(growable: false)
    ]);
    final r0 = results[0];
    final r1 = results[1];
    return (
      valP1: bigIntFromJson(r0),
      val2: r1 is String ? r1 : (r1! as ParsedString).value,
    );
  }

  final ListValue Function(ListValue) _reNamed;

  /// t2 has been renamed with `use types-interface.{t2 as t2-renamed}`
  T2Renamed reNamed({
    Permissions? perm,
    Empty? e,
  }) {
    final results = _reNamed([
      (perm == null
          ? const None().toWasm()
          : Option.fromValue(perm).toWasm((some) => some.toWasm())),
      (e == null
          ? const None().toWasm()
          : Option.fromValue(e).toWasm((some) => some.toWasm()))
    ]);
    final result = results[0];
    return (() {
      final l = result is Map
          ? List.generate(2, (i) => result[i.toString()], growable: false)
          : result;
      return switch (l) {
        [final v0, final v1] || (final v0, final v1) => (
            v0! as int,
            bigIntFromJson(v1),
          ),
        _ => throw Exception('Invalid JSON $result')
      };
    })();
  }

  final ListValue Function(ListValue) _reNamed2;
  (
    int /*U8*/ ?,
    int /*S8*/,
  ) reNamed2({
    required (Uint16List,) tup,
    required Empty e,
  }) {
    final results = _reNamed2([
      [tup.$1],
      e.toWasm()
    ]);
    final result = results[0];
    return (() {
      final l = result is Map
          ? List.generate(2, (i) => result[i.toString()], growable: false)
          : result;
      return switch (l) {
        [final v0, final v1] || (final v0, final v1) => (
            Option.fromJson(v0, (some) => some! as int).value,
            v1! as int,
          ),
        _ => throw Exception('Invalid JSON $result')
      };
    })();
  }
}
