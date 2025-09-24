// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tier _$TierFromJson(Map<String, dynamic> json) {
  return _Tier.fromJson(json);
}

/// @nodoc
mixin _$Tier {
  int get id => throw _privateConstructorUsedError; // required  Fee feeID,
// required Limit LimitID,
  String? get desc => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  double? get createdAt => throw _privateConstructorUsedError;
  double? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TierCopyWith<Tier> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TierCopyWith<$Res> {
  factory $TierCopyWith(Tier value, $Res Function(Tier) then) =
      _$TierCopyWithImpl<$Res, Tier>;
  @useResult
  $Res call(
      {int id,
      String? desc,
      String? name,
      String? slug,
      int? level,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class _$TierCopyWithImpl<$Res, $Val extends Tier>
    implements $TierCopyWith<$Res> {
  _$TierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? level = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_TierCopyWith<$Res> implements $TierCopyWith<$Res> {
  factory _$$_TierCopyWith(_$_Tier value, $Res Function(_$_Tier) then) =
      __$$_TierCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? desc,
      String? name,
      String? slug,
      int? level,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class __$$_TierCopyWithImpl<$Res> extends _$TierCopyWithImpl<$Res, _$_Tier>
    implements _$$_TierCopyWith<$Res> {
  __$$_TierCopyWithImpl(_$_Tier _value, $Res Function(_$_Tier) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? level = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Tier(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
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

@JsonSerializable(explicitToJson: true)
class _$_Tier with DiagnosticableTreeMixin implements _Tier {
  const _$_Tier(
      {required this.id,
      this.desc,
      this.name,
      this.slug,
      this.level,
      this.createdAt,
      this.updatedAt});

  factory _$_Tier.fromJson(Map<String, dynamic> json) => _$$_TierFromJson(json);

  @override
  final int id;
// required  Fee feeID,
// required Limit LimitID,
  @override
  final String? desc;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final int? level;
  @override
  final double? createdAt;
  @override
  final double? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Tier(id: $id, desc: $desc, name: $name, slug: $slug, level: $level, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Tier'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, desc, name, slug, level, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TierCopyWith<_$_Tier> get copyWith =>
      __$$_TierCopyWithImpl<_$_Tier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TierToJson(
      this,
    );
  }
}

abstract class _Tier implements Tier {
  const factory _Tier(
      {required final int id,
      final String? desc,
      final String? name,
      final String? slug,
      final int? level,
      final double? createdAt,
      final double? updatedAt}) = _$_Tier;

  factory _Tier.fromJson(Map<String, dynamic> json) = _$_Tier.fromJson;

  @override
  int get id;
  @override // required  Fee feeID,
// required Limit LimitID,
  String? get desc;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  int? get level;
  @override
  double? get createdAt;
  @override
  double? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TierCopyWith<_$_Tier> get copyWith => throw _privateConstructorUsedError;
}
