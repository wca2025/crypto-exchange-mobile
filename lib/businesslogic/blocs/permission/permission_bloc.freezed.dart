// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'permission_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PermissionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchpermissionlist,
    required TResult Function() fetchpermissionbyid,
    required TResult Function() addpermission,
    required TResult Function() updatepermission,
    required TResult Function() deletepermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchpermissionlist,
    TResult? Function()? fetchpermissionbyid,
    TResult? Function()? addpermission,
    TResult? Function()? updatepermission,
    TResult? Function()? deletepermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchpermissionlist,
    TResult Function()? fetchpermissionbyid,
    TResult Function()? addpermission,
    TResult Function()? updatepermission,
    TResult Function()? deletepermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPermissionListEvent value)
        fetchpermissionlist,
    required TResult Function(_FetchPermissionByIdEvent value)
        fetchpermissionbyid,
    required TResult Function(_AddPermissionEvent value) addpermission,
    required TResult Function(_UpdatePermissionEvent value) updatepermission,
    required TResult Function(_DeletePermissionEvent value) deletepermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult? Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult? Function(_AddPermissionEvent value)? addpermission,
    TResult? Function(_UpdatePermissionEvent value)? updatepermission,
    TResult? Function(_DeletePermissionEvent value)? deletepermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult Function(_AddPermissionEvent value)? addpermission,
    TResult Function(_UpdatePermissionEvent value)? updatepermission,
    TResult Function(_DeletePermissionEvent value)? deletepermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionEventCopyWith<$Res> {
  factory $PermissionEventCopyWith(
          PermissionEvent value, $Res Function(PermissionEvent) then) =
      _$PermissionEventCopyWithImpl<$Res, PermissionEvent>;
}

/// @nodoc
class _$PermissionEventCopyWithImpl<$Res, $Val extends PermissionEvent>
    implements $PermissionEventCopyWith<$Res> {
  _$PermissionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchPermissionListEventCopyWith<$Res> {
  factory _$$_FetchPermissionListEventCopyWith(
          _$_FetchPermissionListEvent value,
          $Res Function(_$_FetchPermissionListEvent) then) =
      __$$_FetchPermissionListEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchPermissionListEventCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$_FetchPermissionListEvent>
    implements _$$_FetchPermissionListEventCopyWith<$Res> {
  __$$_FetchPermissionListEventCopyWithImpl(_$_FetchPermissionListEvent _value,
      $Res Function(_$_FetchPermissionListEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchPermissionListEvent implements _FetchPermissionListEvent {
  const _$_FetchPermissionListEvent();

  @override
  String toString() {
    return 'PermissionEvent.fetchpermissionlist()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPermissionListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchpermissionlist,
    required TResult Function() fetchpermissionbyid,
    required TResult Function() addpermission,
    required TResult Function() updatepermission,
    required TResult Function() deletepermission,
  }) {
    return fetchpermissionlist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchpermissionlist,
    TResult? Function()? fetchpermissionbyid,
    TResult? Function()? addpermission,
    TResult? Function()? updatepermission,
    TResult? Function()? deletepermission,
  }) {
    return fetchpermissionlist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchpermissionlist,
    TResult Function()? fetchpermissionbyid,
    TResult Function()? addpermission,
    TResult Function()? updatepermission,
    TResult Function()? deletepermission,
    required TResult orElse(),
  }) {
    if (fetchpermissionlist != null) {
      return fetchpermissionlist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPermissionListEvent value)
        fetchpermissionlist,
    required TResult Function(_FetchPermissionByIdEvent value)
        fetchpermissionbyid,
    required TResult Function(_AddPermissionEvent value) addpermission,
    required TResult Function(_UpdatePermissionEvent value) updatepermission,
    required TResult Function(_DeletePermissionEvent value) deletepermission,
  }) {
    return fetchpermissionlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult? Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult? Function(_AddPermissionEvent value)? addpermission,
    TResult? Function(_UpdatePermissionEvent value)? updatepermission,
    TResult? Function(_DeletePermissionEvent value)? deletepermission,
  }) {
    return fetchpermissionlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult Function(_AddPermissionEvent value)? addpermission,
    TResult Function(_UpdatePermissionEvent value)? updatepermission,
    TResult Function(_DeletePermissionEvent value)? deletepermission,
    required TResult orElse(),
  }) {
    if (fetchpermissionlist != null) {
      return fetchpermissionlist(this);
    }
    return orElse();
  }
}

abstract class _FetchPermissionListEvent implements PermissionEvent {
  const factory _FetchPermissionListEvent() = _$_FetchPermissionListEvent;
}

/// @nodoc
abstract class _$$_FetchPermissionByIdEventCopyWith<$Res> {
  factory _$$_FetchPermissionByIdEventCopyWith(
          _$_FetchPermissionByIdEvent value,
          $Res Function(_$_FetchPermissionByIdEvent) then) =
      __$$_FetchPermissionByIdEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchPermissionByIdEventCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$_FetchPermissionByIdEvent>
    implements _$$_FetchPermissionByIdEventCopyWith<$Res> {
  __$$_FetchPermissionByIdEventCopyWithImpl(_$_FetchPermissionByIdEvent _value,
      $Res Function(_$_FetchPermissionByIdEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchPermissionByIdEvent implements _FetchPermissionByIdEvent {
  const _$_FetchPermissionByIdEvent();

  @override
  String toString() {
    return 'PermissionEvent.fetchpermissionbyid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPermissionByIdEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchpermissionlist,
    required TResult Function() fetchpermissionbyid,
    required TResult Function() addpermission,
    required TResult Function() updatepermission,
    required TResult Function() deletepermission,
  }) {
    return fetchpermissionbyid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchpermissionlist,
    TResult? Function()? fetchpermissionbyid,
    TResult? Function()? addpermission,
    TResult? Function()? updatepermission,
    TResult? Function()? deletepermission,
  }) {
    return fetchpermissionbyid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchpermissionlist,
    TResult Function()? fetchpermissionbyid,
    TResult Function()? addpermission,
    TResult Function()? updatepermission,
    TResult Function()? deletepermission,
    required TResult orElse(),
  }) {
    if (fetchpermissionbyid != null) {
      return fetchpermissionbyid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPermissionListEvent value)
        fetchpermissionlist,
    required TResult Function(_FetchPermissionByIdEvent value)
        fetchpermissionbyid,
    required TResult Function(_AddPermissionEvent value) addpermission,
    required TResult Function(_UpdatePermissionEvent value) updatepermission,
    required TResult Function(_DeletePermissionEvent value) deletepermission,
  }) {
    return fetchpermissionbyid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult? Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult? Function(_AddPermissionEvent value)? addpermission,
    TResult? Function(_UpdatePermissionEvent value)? updatepermission,
    TResult? Function(_DeletePermissionEvent value)? deletepermission,
  }) {
    return fetchpermissionbyid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult Function(_AddPermissionEvent value)? addpermission,
    TResult Function(_UpdatePermissionEvent value)? updatepermission,
    TResult Function(_DeletePermissionEvent value)? deletepermission,
    required TResult orElse(),
  }) {
    if (fetchpermissionbyid != null) {
      return fetchpermissionbyid(this);
    }
    return orElse();
  }
}

abstract class _FetchPermissionByIdEvent implements PermissionEvent {
  const factory _FetchPermissionByIdEvent() = _$_FetchPermissionByIdEvent;
}

/// @nodoc
abstract class _$$_AddPermissionEventCopyWith<$Res> {
  factory _$$_AddPermissionEventCopyWith(_$_AddPermissionEvent value,
          $Res Function(_$_AddPermissionEvent) then) =
      __$$_AddPermissionEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddPermissionEventCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$_AddPermissionEvent>
    implements _$$_AddPermissionEventCopyWith<$Res> {
  __$$_AddPermissionEventCopyWithImpl(
      _$_AddPermissionEvent _value, $Res Function(_$_AddPermissionEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AddPermissionEvent implements _AddPermissionEvent {
  const _$_AddPermissionEvent();

  @override
  String toString() {
    return 'PermissionEvent.addpermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddPermissionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchpermissionlist,
    required TResult Function() fetchpermissionbyid,
    required TResult Function() addpermission,
    required TResult Function() updatepermission,
    required TResult Function() deletepermission,
  }) {
    return addpermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchpermissionlist,
    TResult? Function()? fetchpermissionbyid,
    TResult? Function()? addpermission,
    TResult? Function()? updatepermission,
    TResult? Function()? deletepermission,
  }) {
    return addpermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchpermissionlist,
    TResult Function()? fetchpermissionbyid,
    TResult Function()? addpermission,
    TResult Function()? updatepermission,
    TResult Function()? deletepermission,
    required TResult orElse(),
  }) {
    if (addpermission != null) {
      return addpermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPermissionListEvent value)
        fetchpermissionlist,
    required TResult Function(_FetchPermissionByIdEvent value)
        fetchpermissionbyid,
    required TResult Function(_AddPermissionEvent value) addpermission,
    required TResult Function(_UpdatePermissionEvent value) updatepermission,
    required TResult Function(_DeletePermissionEvent value) deletepermission,
  }) {
    return addpermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult? Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult? Function(_AddPermissionEvent value)? addpermission,
    TResult? Function(_UpdatePermissionEvent value)? updatepermission,
    TResult? Function(_DeletePermissionEvent value)? deletepermission,
  }) {
    return addpermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult Function(_AddPermissionEvent value)? addpermission,
    TResult Function(_UpdatePermissionEvent value)? updatepermission,
    TResult Function(_DeletePermissionEvent value)? deletepermission,
    required TResult orElse(),
  }) {
    if (addpermission != null) {
      return addpermission(this);
    }
    return orElse();
  }
}

abstract class _AddPermissionEvent implements PermissionEvent {
  const factory _AddPermissionEvent() = _$_AddPermissionEvent;
}

/// @nodoc
abstract class _$$_UpdatePermissionEventCopyWith<$Res> {
  factory _$$_UpdatePermissionEventCopyWith(_$_UpdatePermissionEvent value,
          $Res Function(_$_UpdatePermissionEvent) then) =
      __$$_UpdatePermissionEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdatePermissionEventCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$_UpdatePermissionEvent>
    implements _$$_UpdatePermissionEventCopyWith<$Res> {
  __$$_UpdatePermissionEventCopyWithImpl(_$_UpdatePermissionEvent _value,
      $Res Function(_$_UpdatePermissionEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdatePermissionEvent implements _UpdatePermissionEvent {
  const _$_UpdatePermissionEvent();

  @override
  String toString() {
    return 'PermissionEvent.updatepermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdatePermissionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchpermissionlist,
    required TResult Function() fetchpermissionbyid,
    required TResult Function() addpermission,
    required TResult Function() updatepermission,
    required TResult Function() deletepermission,
  }) {
    return updatepermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchpermissionlist,
    TResult? Function()? fetchpermissionbyid,
    TResult? Function()? addpermission,
    TResult? Function()? updatepermission,
    TResult? Function()? deletepermission,
  }) {
    return updatepermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchpermissionlist,
    TResult Function()? fetchpermissionbyid,
    TResult Function()? addpermission,
    TResult Function()? updatepermission,
    TResult Function()? deletepermission,
    required TResult orElse(),
  }) {
    if (updatepermission != null) {
      return updatepermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPermissionListEvent value)
        fetchpermissionlist,
    required TResult Function(_FetchPermissionByIdEvent value)
        fetchpermissionbyid,
    required TResult Function(_AddPermissionEvent value) addpermission,
    required TResult Function(_UpdatePermissionEvent value) updatepermission,
    required TResult Function(_DeletePermissionEvent value) deletepermission,
  }) {
    return updatepermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult? Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult? Function(_AddPermissionEvent value)? addpermission,
    TResult? Function(_UpdatePermissionEvent value)? updatepermission,
    TResult? Function(_DeletePermissionEvent value)? deletepermission,
  }) {
    return updatepermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult Function(_AddPermissionEvent value)? addpermission,
    TResult Function(_UpdatePermissionEvent value)? updatepermission,
    TResult Function(_DeletePermissionEvent value)? deletepermission,
    required TResult orElse(),
  }) {
    if (updatepermission != null) {
      return updatepermission(this);
    }
    return orElse();
  }
}

abstract class _UpdatePermissionEvent implements PermissionEvent {
  const factory _UpdatePermissionEvent() = _$_UpdatePermissionEvent;
}

/// @nodoc
abstract class _$$_DeletePermissionEventCopyWith<$Res> {
  factory _$$_DeletePermissionEventCopyWith(_$_DeletePermissionEvent value,
          $Res Function(_$_DeletePermissionEvent) then) =
      __$$_DeletePermissionEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeletePermissionEventCopyWithImpl<$Res>
    extends _$PermissionEventCopyWithImpl<$Res, _$_DeletePermissionEvent>
    implements _$$_DeletePermissionEventCopyWith<$Res> {
  __$$_DeletePermissionEventCopyWithImpl(_$_DeletePermissionEvent _value,
      $Res Function(_$_DeletePermissionEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeletePermissionEvent implements _DeletePermissionEvent {
  const _$_DeletePermissionEvent();

  @override
  String toString() {
    return 'PermissionEvent.deletepermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeletePermissionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchpermissionlist,
    required TResult Function() fetchpermissionbyid,
    required TResult Function() addpermission,
    required TResult Function() updatepermission,
    required TResult Function() deletepermission,
  }) {
    return deletepermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchpermissionlist,
    TResult? Function()? fetchpermissionbyid,
    TResult? Function()? addpermission,
    TResult? Function()? updatepermission,
    TResult? Function()? deletepermission,
  }) {
    return deletepermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchpermissionlist,
    TResult Function()? fetchpermissionbyid,
    TResult Function()? addpermission,
    TResult Function()? updatepermission,
    TResult Function()? deletepermission,
    required TResult orElse(),
  }) {
    if (deletepermission != null) {
      return deletepermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPermissionListEvent value)
        fetchpermissionlist,
    required TResult Function(_FetchPermissionByIdEvent value)
        fetchpermissionbyid,
    required TResult Function(_AddPermissionEvent value) addpermission,
    required TResult Function(_UpdatePermissionEvent value) updatepermission,
    required TResult Function(_DeletePermissionEvent value) deletepermission,
  }) {
    return deletepermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult? Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult? Function(_AddPermissionEvent value)? addpermission,
    TResult? Function(_UpdatePermissionEvent value)? updatepermission,
    TResult? Function(_DeletePermissionEvent value)? deletepermission,
  }) {
    return deletepermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPermissionListEvent value)? fetchpermissionlist,
    TResult Function(_FetchPermissionByIdEvent value)? fetchpermissionbyid,
    TResult Function(_AddPermissionEvent value)? addpermission,
    TResult Function(_UpdatePermissionEvent value)? updatepermission,
    TResult Function(_DeletePermissionEvent value)? deletepermission,
    required TResult orElse(),
  }) {
    if (deletepermission != null) {
      return deletepermission(this);
    }
    return orElse();
  }
}

abstract class _DeletePermissionEvent implements PermissionEvent {
  const factory _DeletePermissionEvent() = _$_DeletePermissionEvent;
}

/// @nodoc
mixin _$PermissionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displaypermissions,
    required TResult Function() displayspecificpermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displaypermissions,
    TResult? Function()? displayspecificpermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displaypermissions,
    TResult Function()? displayspecificpermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingPermissionState value) loading,
    required TResult Function(_ErrorPermissionState value) error,
    required TResult Function(_SuccessPermissionState value) success,
    required TResult Function(_DisplayPermissionsState value)
        displaypermissions,
    required TResult Function(_DisplaySpecificPermissionsState value)
        displayspecificpermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingPermissionState value)? loading,
    TResult? Function(_ErrorPermissionState value)? error,
    TResult? Function(_SuccessPermissionState value)? success,
    TResult? Function(_DisplayPermissionsState value)? displaypermissions,
    TResult? Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingPermissionState value)? loading,
    TResult Function(_ErrorPermissionState value)? error,
    TResult Function(_SuccessPermissionState value)? success,
    TResult Function(_DisplayPermissionsState value)? displaypermissions,
    TResult Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) then) =
      _$PermissionStateCopyWithImpl<$Res, PermissionState>;
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res, $Val extends PermissionState>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialStateCopyWith<$Res> {
  factory _$$_InitialStateCopyWith(
          _$_InitialState value, $Res Function(_$_InitialState) then) =
      __$$_InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialStateCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$_InitialState>
    implements _$$_InitialStateCopyWith<$Res> {
  __$$_InitialStateCopyWithImpl(
      _$_InitialState _value, $Res Function(_$_InitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialState implements _InitialState {
  const _$_InitialState();

  @override
  String toString() {
    return 'PermissionState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displaypermissions,
    required TResult Function() displayspecificpermissions,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displaypermissions,
    TResult? Function()? displayspecificpermissions,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displaypermissions,
    TResult Function()? displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingPermissionState value) loading,
    required TResult Function(_ErrorPermissionState value) error,
    required TResult Function(_SuccessPermissionState value) success,
    required TResult Function(_DisplayPermissionsState value)
        displaypermissions,
    required TResult Function(_DisplaySpecificPermissionsState value)
        displayspecificpermissions,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingPermissionState value)? loading,
    TResult? Function(_ErrorPermissionState value)? error,
    TResult? Function(_SuccessPermissionState value)? success,
    TResult? Function(_DisplayPermissionsState value)? displaypermissions,
    TResult? Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingPermissionState value)? loading,
    TResult Function(_ErrorPermissionState value)? error,
    TResult Function(_SuccessPermissionState value)? success,
    TResult Function(_DisplayPermissionsState value)? displaypermissions,
    TResult Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements PermissionState {
  const factory _InitialState() = _$_InitialState;
}

/// @nodoc
abstract class _$$_LoadingPermissionStateCopyWith<$Res> {
  factory _$$_LoadingPermissionStateCopyWith(_$_LoadingPermissionState value,
          $Res Function(_$_LoadingPermissionState) then) =
      __$$_LoadingPermissionStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingPermissionStateCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$_LoadingPermissionState>
    implements _$$_LoadingPermissionStateCopyWith<$Res> {
  __$$_LoadingPermissionStateCopyWithImpl(_$_LoadingPermissionState _value,
      $Res Function(_$_LoadingPermissionState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingPermissionState implements _LoadingPermissionState {
  const _$_LoadingPermissionState();

  @override
  String toString() {
    return 'PermissionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingPermissionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displaypermissions,
    required TResult Function() displayspecificpermissions,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displaypermissions,
    TResult? Function()? displayspecificpermissions,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displaypermissions,
    TResult Function()? displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingPermissionState value) loading,
    required TResult Function(_ErrorPermissionState value) error,
    required TResult Function(_SuccessPermissionState value) success,
    required TResult Function(_DisplayPermissionsState value)
        displaypermissions,
    required TResult Function(_DisplaySpecificPermissionsState value)
        displayspecificpermissions,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingPermissionState value)? loading,
    TResult? Function(_ErrorPermissionState value)? error,
    TResult? Function(_SuccessPermissionState value)? success,
    TResult? Function(_DisplayPermissionsState value)? displaypermissions,
    TResult? Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingPermissionState value)? loading,
    TResult Function(_ErrorPermissionState value)? error,
    TResult Function(_SuccessPermissionState value)? success,
    TResult Function(_DisplayPermissionsState value)? displaypermissions,
    TResult Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingPermissionState implements PermissionState {
  const factory _LoadingPermissionState() = _$_LoadingPermissionState;
}

/// @nodoc
abstract class _$$_ErrorPermissionStateCopyWith<$Res> {
  factory _$$_ErrorPermissionStateCopyWith(_$_ErrorPermissionState value,
          $Res Function(_$_ErrorPermissionState) then) =
      __$$_ErrorPermissionStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorPermissionStateCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$_ErrorPermissionState>
    implements _$$_ErrorPermissionStateCopyWith<$Res> {
  __$$_ErrorPermissionStateCopyWithImpl(_$_ErrorPermissionState _value,
      $Res Function(_$_ErrorPermissionState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ErrorPermissionState implements _ErrorPermissionState {
  const _$_ErrorPermissionState();

  @override
  String toString() {
    return 'PermissionState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ErrorPermissionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displaypermissions,
    required TResult Function() displayspecificpermissions,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displaypermissions,
    TResult? Function()? displayspecificpermissions,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displaypermissions,
    TResult Function()? displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingPermissionState value) loading,
    required TResult Function(_ErrorPermissionState value) error,
    required TResult Function(_SuccessPermissionState value) success,
    required TResult Function(_DisplayPermissionsState value)
        displaypermissions,
    required TResult Function(_DisplaySpecificPermissionsState value)
        displayspecificpermissions,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingPermissionState value)? loading,
    TResult? Function(_ErrorPermissionState value)? error,
    TResult? Function(_SuccessPermissionState value)? success,
    TResult? Function(_DisplayPermissionsState value)? displaypermissions,
    TResult? Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingPermissionState value)? loading,
    TResult Function(_ErrorPermissionState value)? error,
    TResult Function(_SuccessPermissionState value)? success,
    TResult Function(_DisplayPermissionsState value)? displaypermissions,
    TResult Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorPermissionState implements PermissionState {
  const factory _ErrorPermissionState() = _$_ErrorPermissionState;
}

/// @nodoc
abstract class _$$_SuccessPermissionStateCopyWith<$Res> {
  factory _$$_SuccessPermissionStateCopyWith(_$_SuccessPermissionState value,
          $Res Function(_$_SuccessPermissionState) then) =
      __$$_SuccessPermissionStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessPermissionStateCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$_SuccessPermissionState>
    implements _$$_SuccessPermissionStateCopyWith<$Res> {
  __$$_SuccessPermissionStateCopyWithImpl(_$_SuccessPermissionState _value,
      $Res Function(_$_SuccessPermissionState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SuccessPermissionState implements _SuccessPermissionState {
  const _$_SuccessPermissionState();

  @override
  String toString() {
    return 'PermissionState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessPermissionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displaypermissions,
    required TResult Function() displayspecificpermissions,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displaypermissions,
    TResult? Function()? displayspecificpermissions,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displaypermissions,
    TResult Function()? displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingPermissionState value) loading,
    required TResult Function(_ErrorPermissionState value) error,
    required TResult Function(_SuccessPermissionState value) success,
    required TResult Function(_DisplayPermissionsState value)
        displaypermissions,
    required TResult Function(_DisplaySpecificPermissionsState value)
        displayspecificpermissions,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingPermissionState value)? loading,
    TResult? Function(_ErrorPermissionState value)? error,
    TResult? Function(_SuccessPermissionState value)? success,
    TResult? Function(_DisplayPermissionsState value)? displaypermissions,
    TResult? Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingPermissionState value)? loading,
    TResult Function(_ErrorPermissionState value)? error,
    TResult Function(_SuccessPermissionState value)? success,
    TResult Function(_DisplayPermissionsState value)? displaypermissions,
    TResult Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessPermissionState implements PermissionState {
  const factory _SuccessPermissionState() = _$_SuccessPermissionState;
}

/// @nodoc
abstract class _$$_DisplayPermissionsStateCopyWith<$Res> {
  factory _$$_DisplayPermissionsStateCopyWith(_$_DisplayPermissionsState value,
          $Res Function(_$_DisplayPermissionsState) then) =
      __$$_DisplayPermissionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisplayPermissionsStateCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$_DisplayPermissionsState>
    implements _$$_DisplayPermissionsStateCopyWith<$Res> {
  __$$_DisplayPermissionsStateCopyWithImpl(_$_DisplayPermissionsState _value,
      $Res Function(_$_DisplayPermissionsState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisplayPermissionsState implements _DisplayPermissionsState {
  const _$_DisplayPermissionsState();

  @override
  String toString() {
    return 'PermissionState.displaypermissions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DisplayPermissionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displaypermissions,
    required TResult Function() displayspecificpermissions,
  }) {
    return displaypermissions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displaypermissions,
    TResult? Function()? displayspecificpermissions,
  }) {
    return displaypermissions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displaypermissions,
    TResult Function()? displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (displaypermissions != null) {
      return displaypermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingPermissionState value) loading,
    required TResult Function(_ErrorPermissionState value) error,
    required TResult Function(_SuccessPermissionState value) success,
    required TResult Function(_DisplayPermissionsState value)
        displaypermissions,
    required TResult Function(_DisplaySpecificPermissionsState value)
        displayspecificpermissions,
  }) {
    return displaypermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingPermissionState value)? loading,
    TResult? Function(_ErrorPermissionState value)? error,
    TResult? Function(_SuccessPermissionState value)? success,
    TResult? Function(_DisplayPermissionsState value)? displaypermissions,
    TResult? Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
  }) {
    return displaypermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingPermissionState value)? loading,
    TResult Function(_ErrorPermissionState value)? error,
    TResult Function(_SuccessPermissionState value)? success,
    TResult Function(_DisplayPermissionsState value)? displaypermissions,
    TResult Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (displaypermissions != null) {
      return displaypermissions(this);
    }
    return orElse();
  }
}

abstract class _DisplayPermissionsState implements PermissionState {
  const factory _DisplayPermissionsState() = _$_DisplayPermissionsState;
}

/// @nodoc
abstract class _$$_DisplaySpecificPermissionsStateCopyWith<$Res> {
  factory _$$_DisplaySpecificPermissionsStateCopyWith(
          _$_DisplaySpecificPermissionsState value,
          $Res Function(_$_DisplaySpecificPermissionsState) then) =
      __$$_DisplaySpecificPermissionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisplaySpecificPermissionsStateCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res,
        _$_DisplaySpecificPermissionsState>
    implements _$$_DisplaySpecificPermissionsStateCopyWith<$Res> {
  __$$_DisplaySpecificPermissionsStateCopyWithImpl(
      _$_DisplaySpecificPermissionsState _value,
      $Res Function(_$_DisplaySpecificPermissionsState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisplaySpecificPermissionsState
    implements _DisplaySpecificPermissionsState {
  const _$_DisplaySpecificPermissionsState();

  @override
  String toString() {
    return 'PermissionState.displayspecificpermissions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DisplaySpecificPermissionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displaypermissions,
    required TResult Function() displayspecificpermissions,
  }) {
    return displayspecificpermissions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displaypermissions,
    TResult? Function()? displayspecificpermissions,
  }) {
    return displayspecificpermissions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displaypermissions,
    TResult Function()? displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (displayspecificpermissions != null) {
      return displayspecificpermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingPermissionState value) loading,
    required TResult Function(_ErrorPermissionState value) error,
    required TResult Function(_SuccessPermissionState value) success,
    required TResult Function(_DisplayPermissionsState value)
        displaypermissions,
    required TResult Function(_DisplaySpecificPermissionsState value)
        displayspecificpermissions,
  }) {
    return displayspecificpermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingPermissionState value)? loading,
    TResult? Function(_ErrorPermissionState value)? error,
    TResult? Function(_SuccessPermissionState value)? success,
    TResult? Function(_DisplayPermissionsState value)? displaypermissions,
    TResult? Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
  }) {
    return displayspecificpermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingPermissionState value)? loading,
    TResult Function(_ErrorPermissionState value)? error,
    TResult Function(_SuccessPermissionState value)? success,
    TResult Function(_DisplayPermissionsState value)? displaypermissions,
    TResult Function(_DisplaySpecificPermissionsState value)?
        displayspecificpermissions,
    required TResult orElse(),
  }) {
    if (displayspecificpermissions != null) {
      return displayspecificpermissions(this);
    }
    return orElse();
  }
}

abstract class _DisplaySpecificPermissionsState implements PermissionState {
  const factory _DisplaySpecificPermissionsState() =
      _$_DisplaySpecificPermissionsState;
}
