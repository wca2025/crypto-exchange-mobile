// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call({int id, String name, String desc, String slug});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res, $Val extends Role>
    implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

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
abstract class _$$_RoleCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$_RoleCopyWith(_$_Role value, $Res Function(_$_Role) then) =
      __$$_RoleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String desc, String slug});
}

/// @nodoc
class __$$_RoleCopyWithImpl<$Res> extends _$RoleCopyWithImpl<$Res, _$_Role>
    implements _$$_RoleCopyWith<$Res> {
  __$$_RoleCopyWithImpl(_$_Role _value, $Res Function(_$_Role) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? desc = null,
    Object? slug = null,
  }) {
    return _then(_$_Role(
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
class _$_Role with DiagnosticableTreeMixin implements _Role {
  const _$_Role(
      {required this.id,
      required this.name,
      required this.desc,
      required this.slug});

  factory _$_Role.fromJson(Map<String, dynamic> json) => _$$_RoleFromJson(json);

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
    return 'Role(id: $id, name: $name, desc: $desc, slug: $slug)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Role'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('slug', slug));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Role &&
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
  _$$_RoleCopyWith<_$_Role> get copyWith =>
      __$$_RoleCopyWithImpl<_$_Role>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleToJson(
      this,
    );
  }
}

abstract class _Role implements Role {
  const factory _Role(
      {required final int id,
      required final String name,
      required final String desc,
      required final String slug}) = _$_Role;

  factory _Role.fromJson(Map<String, dynamic> json) = _$_Role.fromJson;

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
  _$$_RoleCopyWith<_$_Role> get copyWith => throw _privateConstructorUsedError;
}
