// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fee _$FeeFromJson(Map<String, dynamic> json) {
  return _Fee.fromJson(json);
}

/// @nodoc
mixin _$Fee {
  int get id => throw _privateConstructorUsedError;
  String? get fiatcryptotype => throw _privateConstructorUsedError;
  String? get cryptofiatpairs => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get feetype => throw _privateConstructorUsedError;
  String? get feerate => throw _privateConstructorUsedError;
  double? get createdAt => throw _privateConstructorUsedError;
  double? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeCopyWith<Fee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeCopyWith<$Res> {
  factory $FeeCopyWith(Fee value, $Res Function(Fee) then) =
      _$FeeCopyWithImpl<$Res, Fee>;
  @useResult
  $Res call(
      {int id,
      String? fiatcryptotype,
      String? cryptofiatpairs,
      String? name,
      String? feetype,
      String? feerate,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class _$FeeCopyWithImpl<$Res, $Val extends Fee> implements $FeeCopyWith<$Res> {
  _$FeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fiatcryptotype = freezed,
    Object? cryptofiatpairs = freezed,
    Object? name = freezed,
    Object? feetype = freezed,
    Object? feerate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fiatcryptotype: freezed == fiatcryptotype
          ? _value.fiatcryptotype
          : fiatcryptotype // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptofiatpairs: freezed == cryptofiatpairs
          ? _value.cryptofiatpairs
          : cryptofiatpairs // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      feetype: freezed == feetype
          ? _value.feetype
          : feetype // ignore: cast_nullable_to_non_nullable
              as String?,
      feerate: freezed == feerate
          ? _value.feerate
          : feerate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeeCopyWith<$Res> implements $FeeCopyWith<$Res> {
  factory _$$_FeeCopyWith(_$_Fee value, $Res Function(_$_Fee) then) =
      __$$_FeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? fiatcryptotype,
      String? cryptofiatpairs,
      String? name,
      String? feetype,
      String? feerate,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class __$$_FeeCopyWithImpl<$Res> extends _$FeeCopyWithImpl<$Res, _$_Fee>
    implements _$$_FeeCopyWith<$Res> {
  __$$_FeeCopyWithImpl(_$_Fee _value, $Res Function(_$_Fee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fiatcryptotype = freezed,
    Object? cryptofiatpairs = freezed,
    Object? name = freezed,
    Object? feetype = freezed,
    Object? feerate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Fee(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fiatcryptotype: freezed == fiatcryptotype
          ? _value.fiatcryptotype
          : fiatcryptotype // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptofiatpairs: freezed == cryptofiatpairs
          ? _value.cryptofiatpairs
          : cryptofiatpairs // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      feetype: freezed == feetype
          ? _value.feetype
          : feetype // ignore: cast_nullable_to_non_nullable
              as String?,
      feerate: freezed == feerate
          ? _value.feerate
          : feerate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fee with DiagnosticableTreeMixin implements _Fee {
  const _$_Fee(
      {required this.id,
      this.fiatcryptotype,
      this.cryptofiatpairs,
      this.name,
      this.feetype,
      this.feerate,
      this.createdAt,
      this.updatedAt});

  factory _$_Fee.fromJson(Map<String, dynamic> json) => _$$_FeeFromJson(json);

  @override
  final int id;
  @override
  final String? fiatcryptotype;
  @override
  final String? cryptofiatpairs;
  @override
  final String? name;
  @override
  final String? feetype;
  @override
  final String? feerate;
  @override
  final double? createdAt;
  @override
  final double? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Fee(id: $id, fiatcryptotype: $fiatcryptotype, cryptofiatpairs: $cryptofiatpairs, name: $name, feetype: $feetype, feerate: $feerate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Fee'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fiatcryptotype', fiatcryptotype))
      ..add(DiagnosticsProperty('cryptofiatpairs', cryptofiatpairs))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('feetype', feetype))
      ..add(DiagnosticsProperty('feerate', feerate))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fiatcryptotype, fiatcryptotype) ||
                other.fiatcryptotype == fiatcryptotype) &&
            (identical(other.cryptofiatpairs, cryptofiatpairs) ||
                other.cryptofiatpairs == cryptofiatpairs) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.feetype, feetype) || other.feetype == feetype) &&
            (identical(other.feerate, feerate) || other.feerate == feerate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fiatcryptotype,
      cryptofiatpairs, name, feetype, feerate, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeeCopyWith<_$_Fee> get copyWith =>
      __$$_FeeCopyWithImpl<_$_Fee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeeToJson(
      this,
    );
  }
}

abstract class _Fee implements Fee {
  const factory _Fee(
      {required final int id,
      final String? fiatcryptotype,
      final String? cryptofiatpairs,
      final String? name,
      final String? feetype,
      final String? feerate,
      final double? createdAt,
      final double? updatedAt}) = _$_Fee;

  factory _Fee.fromJson(Map<String, dynamic> json) = _$_Fee.fromJson;

  @override
  int get id;
  @override
  String? get fiatcryptotype;
  @override
  String? get cryptofiatpairs;
  @override
  String? get name;
  @override
  String? get feetype;
  @override
  String? get feerate;
  @override
  double? get createdAt;
  @override
  double? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_FeeCopyWith<_$_Fee> get copyWith => throw _privateConstructorUsedError;
}
