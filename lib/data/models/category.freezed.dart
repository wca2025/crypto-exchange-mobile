// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Categoryx _$CategoryxFromJson(Map<String, dynamic> json) {
  return _Categoryx.fromJson(json);
}

/// @nodoc
mixin _$Categoryx {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryxCopyWith<Categoryx> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryxCopyWith<$Res> {
  factory $CategoryxCopyWith(Categoryx value, $Res Function(Categoryx) then) =
      _$CategoryxCopyWithImpl<$Res, Categoryx>;
  @useResult
  $Res call({int id, String name, String desc, String slug});
}

/// @nodoc
class _$CategoryxCopyWithImpl<$Res, $Val extends Categoryx>
    implements $CategoryxCopyWith<$Res> {
  _$CategoryxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? desc = null,
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryxCopyWith<$Res> implements $CategoryxCopyWith<$Res> {
  factory _$$_CategoryxCopyWith(
          _$_Categoryx value, $Res Function(_$_Categoryx) then) =
      __$$_CategoryxCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String desc, String slug});
}

/// @nodoc
class __$$_CategoryxCopyWithImpl<$Res>
    extends _$CategoryxCopyWithImpl<$Res, _$_Categoryx>
    implements _$$_CategoryxCopyWith<$Res> {
  __$$_CategoryxCopyWithImpl(
      _$_Categoryx _value, $Res Function(_$_Categoryx) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? desc = null,
    Object? slug = null,
  }) {
    return _then(_$_Categoryx(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Categoryx with DiagnosticableTreeMixin implements _Categoryx {
  const _$_Categoryx(
      {required this.id,
      required this.name,
      required this.desc,
      required this.slug});

  factory _$_Categoryx.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryxFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String desc;
  @override
  final String slug;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Categoryx(id: $id, name: $name, desc: $desc, slug: $slug)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Categoryx'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('slug', slug));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Categoryx &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, desc, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryxCopyWith<_$_Categoryx> get copyWith =>
      __$$_CategoryxCopyWithImpl<_$_Categoryx>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryxToJson(
      this,
    );
  }
}

abstract class _Categoryx implements Categoryx {
  const factory _Categoryx(
      {required final int id,
      required final String name,
      required final String desc,
      required final String slug}) = _$_Categoryx;

  factory _Categoryx.fromJson(Map<String, dynamic> json) =
      _$_Categoryx.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get desc;
  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryxCopyWith<_$_Categoryx> get copyWith =>
      throw _privateConstructorUsedError;
}
