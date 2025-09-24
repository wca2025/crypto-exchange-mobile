// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoinEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchcoinlist,
    required TResult Function() fetchcoinbyid,
    required TResult Function() addcoin,
    required TResult Function() updatecoin,
    required TResult Function() deleteacoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchcoinlist,
    TResult? Function()? fetchcoinbyid,
    TResult? Function()? addcoin,
    TResult? Function()? updatecoin,
    TResult? Function()? deleteacoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchcoinlist,
    TResult Function()? fetchcoinbyid,
    TResult Function()? addcoin,
    TResult Function()? updatecoin,
    TResult Function()? deleteacoin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCoinListEvent value) fetchcoinlist,
    required TResult Function(_FetchCoinByIdEvent value) fetchcoinbyid,
    required TResult Function(_AddCoinEvent value) addcoin,
    required TResult Function(_UpdateCoinEvent value) updatecoin,
    required TResult Function(_DeleteCoinEvent value) deleteacoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult? Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult? Function(_AddCoinEvent value)? addcoin,
    TResult? Function(_UpdateCoinEvent value)? updatecoin,
    TResult? Function(_DeleteCoinEvent value)? deleteacoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult Function(_AddCoinEvent value)? addcoin,
    TResult Function(_UpdateCoinEvent value)? updatecoin,
    TResult Function(_DeleteCoinEvent value)? deleteacoin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinEventCopyWith<$Res> {
  factory $CoinEventCopyWith(CoinEvent value, $Res Function(CoinEvent) then) =
      _$CoinEventCopyWithImpl<$Res, CoinEvent>;
}

/// @nodoc
class _$CoinEventCopyWithImpl<$Res, $Val extends CoinEvent>
    implements $CoinEventCopyWith<$Res> {
  _$CoinEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchCoinListEventCopyWith<$Res> {
  factory _$$_FetchCoinListEventCopyWith(_$_FetchCoinListEvent value,
          $Res Function(_$_FetchCoinListEvent) then) =
      __$$_FetchCoinListEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCoinListEventCopyWithImpl<$Res>
    extends _$CoinEventCopyWithImpl<$Res, _$_FetchCoinListEvent>
    implements _$$_FetchCoinListEventCopyWith<$Res> {
  __$$_FetchCoinListEventCopyWithImpl(
      _$_FetchCoinListEvent _value, $Res Function(_$_FetchCoinListEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchCoinListEvent implements _FetchCoinListEvent {
  const _$_FetchCoinListEvent();

  @override
  String toString() {
    return 'CoinEvent.fetchcoinlist()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchCoinListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchcoinlist,
    required TResult Function() fetchcoinbyid,
    required TResult Function() addcoin,
    required TResult Function() updatecoin,
    required TResult Function() deleteacoin,
  }) {
    return fetchcoinlist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchcoinlist,
    TResult? Function()? fetchcoinbyid,
    TResult? Function()? addcoin,
    TResult? Function()? updatecoin,
    TResult? Function()? deleteacoin,
  }) {
    return fetchcoinlist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchcoinlist,
    TResult Function()? fetchcoinbyid,
    TResult Function()? addcoin,
    TResult Function()? updatecoin,
    TResult Function()? deleteacoin,
    required TResult orElse(),
  }) {
    if (fetchcoinlist != null) {
      return fetchcoinlist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCoinListEvent value) fetchcoinlist,
    required TResult Function(_FetchCoinByIdEvent value) fetchcoinbyid,
    required TResult Function(_AddCoinEvent value) addcoin,
    required TResult Function(_UpdateCoinEvent value) updatecoin,
    required TResult Function(_DeleteCoinEvent value) deleteacoin,
  }) {
    return fetchcoinlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult? Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult? Function(_AddCoinEvent value)? addcoin,
    TResult? Function(_UpdateCoinEvent value)? updatecoin,
    TResult? Function(_DeleteCoinEvent value)? deleteacoin,
  }) {
    return fetchcoinlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult Function(_AddCoinEvent value)? addcoin,
    TResult Function(_UpdateCoinEvent value)? updatecoin,
    TResult Function(_DeleteCoinEvent value)? deleteacoin,
    required TResult orElse(),
  }) {
    if (fetchcoinlist != null) {
      return fetchcoinlist(this);
    }
    return orElse();
  }
}

abstract class _FetchCoinListEvent implements CoinEvent {
  const factory _FetchCoinListEvent() = _$_FetchCoinListEvent;
}

/// @nodoc
abstract class _$$_FetchCoinByIdEventCopyWith<$Res> {
  factory _$$_FetchCoinByIdEventCopyWith(_$_FetchCoinByIdEvent value,
          $Res Function(_$_FetchCoinByIdEvent) then) =
      __$$_FetchCoinByIdEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCoinByIdEventCopyWithImpl<$Res>
    extends _$CoinEventCopyWithImpl<$Res, _$_FetchCoinByIdEvent>
    implements _$$_FetchCoinByIdEventCopyWith<$Res> {
  __$$_FetchCoinByIdEventCopyWithImpl(
      _$_FetchCoinByIdEvent _value, $Res Function(_$_FetchCoinByIdEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchCoinByIdEvent implements _FetchCoinByIdEvent {
  const _$_FetchCoinByIdEvent();

  @override
  String toString() {
    return 'CoinEvent.fetchcoinbyid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchCoinByIdEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchcoinlist,
    required TResult Function() fetchcoinbyid,
    required TResult Function() addcoin,
    required TResult Function() updatecoin,
    required TResult Function() deleteacoin,
  }) {
    return fetchcoinbyid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchcoinlist,
    TResult? Function()? fetchcoinbyid,
    TResult? Function()? addcoin,
    TResult? Function()? updatecoin,
    TResult? Function()? deleteacoin,
  }) {
    return fetchcoinbyid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchcoinlist,
    TResult Function()? fetchcoinbyid,
    TResult Function()? addcoin,
    TResult Function()? updatecoin,
    TResult Function()? deleteacoin,
    required TResult orElse(),
  }) {
    if (fetchcoinbyid != null) {
      return fetchcoinbyid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCoinListEvent value) fetchcoinlist,
    required TResult Function(_FetchCoinByIdEvent value) fetchcoinbyid,
    required TResult Function(_AddCoinEvent value) addcoin,
    required TResult Function(_UpdateCoinEvent value) updatecoin,
    required TResult Function(_DeleteCoinEvent value) deleteacoin,
  }) {
    return fetchcoinbyid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult? Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult? Function(_AddCoinEvent value)? addcoin,
    TResult? Function(_UpdateCoinEvent value)? updatecoin,
    TResult? Function(_DeleteCoinEvent value)? deleteacoin,
  }) {
    return fetchcoinbyid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult Function(_AddCoinEvent value)? addcoin,
    TResult Function(_UpdateCoinEvent value)? updatecoin,
    TResult Function(_DeleteCoinEvent value)? deleteacoin,
    required TResult orElse(),
  }) {
    if (fetchcoinbyid != null) {
      return fetchcoinbyid(this);
    }
    return orElse();
  }
}

abstract class _FetchCoinByIdEvent implements CoinEvent {
  const factory _FetchCoinByIdEvent() = _$_FetchCoinByIdEvent;
}

/// @nodoc
abstract class _$$_AddCoinEventCopyWith<$Res> {
  factory _$$_AddCoinEventCopyWith(
          _$_AddCoinEvent value, $Res Function(_$_AddCoinEvent) then) =
      __$$_AddCoinEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddCoinEventCopyWithImpl<$Res>
    extends _$CoinEventCopyWithImpl<$Res, _$_AddCoinEvent>
    implements _$$_AddCoinEventCopyWith<$Res> {
  __$$_AddCoinEventCopyWithImpl(
      _$_AddCoinEvent _value, $Res Function(_$_AddCoinEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AddCoinEvent implements _AddCoinEvent {
  const _$_AddCoinEvent();

  @override
  String toString() {
    return 'CoinEvent.addcoin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddCoinEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchcoinlist,
    required TResult Function() fetchcoinbyid,
    required TResult Function() addcoin,
    required TResult Function() updatecoin,
    required TResult Function() deleteacoin,
  }) {
    return addcoin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchcoinlist,
    TResult? Function()? fetchcoinbyid,
    TResult? Function()? addcoin,
    TResult? Function()? updatecoin,
    TResult? Function()? deleteacoin,
  }) {
    return addcoin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchcoinlist,
    TResult Function()? fetchcoinbyid,
    TResult Function()? addcoin,
    TResult Function()? updatecoin,
    TResult Function()? deleteacoin,
    required TResult orElse(),
  }) {
    if (addcoin != null) {
      return addcoin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCoinListEvent value) fetchcoinlist,
    required TResult Function(_FetchCoinByIdEvent value) fetchcoinbyid,
    required TResult Function(_AddCoinEvent value) addcoin,
    required TResult Function(_UpdateCoinEvent value) updatecoin,
    required TResult Function(_DeleteCoinEvent value) deleteacoin,
  }) {
    return addcoin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult? Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult? Function(_AddCoinEvent value)? addcoin,
    TResult? Function(_UpdateCoinEvent value)? updatecoin,
    TResult? Function(_DeleteCoinEvent value)? deleteacoin,
  }) {
    return addcoin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult Function(_AddCoinEvent value)? addcoin,
    TResult Function(_UpdateCoinEvent value)? updatecoin,
    TResult Function(_DeleteCoinEvent value)? deleteacoin,
    required TResult orElse(),
  }) {
    if (addcoin != null) {
      return addcoin(this);
    }
    return orElse();
  }
}

abstract class _AddCoinEvent implements CoinEvent {
  const factory _AddCoinEvent() = _$_AddCoinEvent;
}

/// @nodoc
abstract class _$$_UpdateCoinEventCopyWith<$Res> {
  factory _$$_UpdateCoinEventCopyWith(
          _$_UpdateCoinEvent value, $Res Function(_$_UpdateCoinEvent) then) =
      __$$_UpdateCoinEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateCoinEventCopyWithImpl<$Res>
    extends _$CoinEventCopyWithImpl<$Res, _$_UpdateCoinEvent>
    implements _$$_UpdateCoinEventCopyWith<$Res> {
  __$$_UpdateCoinEventCopyWithImpl(
      _$_UpdateCoinEvent _value, $Res Function(_$_UpdateCoinEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateCoinEvent implements _UpdateCoinEvent {
  const _$_UpdateCoinEvent();

  @override
  String toString() {
    return 'CoinEvent.updatecoin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateCoinEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchcoinlist,
    required TResult Function() fetchcoinbyid,
    required TResult Function() addcoin,
    required TResult Function() updatecoin,
    required TResult Function() deleteacoin,
  }) {
    return updatecoin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchcoinlist,
    TResult? Function()? fetchcoinbyid,
    TResult? Function()? addcoin,
    TResult? Function()? updatecoin,
    TResult? Function()? deleteacoin,
  }) {
    return updatecoin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchcoinlist,
    TResult Function()? fetchcoinbyid,
    TResult Function()? addcoin,
    TResult Function()? updatecoin,
    TResult Function()? deleteacoin,
    required TResult orElse(),
  }) {
    if (updatecoin != null) {
      return updatecoin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCoinListEvent value) fetchcoinlist,
    required TResult Function(_FetchCoinByIdEvent value) fetchcoinbyid,
    required TResult Function(_AddCoinEvent value) addcoin,
    required TResult Function(_UpdateCoinEvent value) updatecoin,
    required TResult Function(_DeleteCoinEvent value) deleteacoin,
  }) {
    return updatecoin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult? Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult? Function(_AddCoinEvent value)? addcoin,
    TResult? Function(_UpdateCoinEvent value)? updatecoin,
    TResult? Function(_DeleteCoinEvent value)? deleteacoin,
  }) {
    return updatecoin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult Function(_AddCoinEvent value)? addcoin,
    TResult Function(_UpdateCoinEvent value)? updatecoin,
    TResult Function(_DeleteCoinEvent value)? deleteacoin,
    required TResult orElse(),
  }) {
    if (updatecoin != null) {
      return updatecoin(this);
    }
    return orElse();
  }
}

abstract class _UpdateCoinEvent implements CoinEvent {
  const factory _UpdateCoinEvent() = _$_UpdateCoinEvent;
}

/// @nodoc
abstract class _$$_DeleteCoinEventCopyWith<$Res> {
  factory _$$_DeleteCoinEventCopyWith(
          _$_DeleteCoinEvent value, $Res Function(_$_DeleteCoinEvent) then) =
      __$$_DeleteCoinEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteCoinEventCopyWithImpl<$Res>
    extends _$CoinEventCopyWithImpl<$Res, _$_DeleteCoinEvent>
    implements _$$_DeleteCoinEventCopyWith<$Res> {
  __$$_DeleteCoinEventCopyWithImpl(
      _$_DeleteCoinEvent _value, $Res Function(_$_DeleteCoinEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteCoinEvent implements _DeleteCoinEvent {
  const _$_DeleteCoinEvent();

  @override
  String toString() {
    return 'CoinEvent.deleteacoin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteCoinEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchcoinlist,
    required TResult Function() fetchcoinbyid,
    required TResult Function() addcoin,
    required TResult Function() updatecoin,
    required TResult Function() deleteacoin,
  }) {
    return deleteacoin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchcoinlist,
    TResult? Function()? fetchcoinbyid,
    TResult? Function()? addcoin,
    TResult? Function()? updatecoin,
    TResult? Function()? deleteacoin,
  }) {
    return deleteacoin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchcoinlist,
    TResult Function()? fetchcoinbyid,
    TResult Function()? addcoin,
    TResult Function()? updatecoin,
    TResult Function()? deleteacoin,
    required TResult orElse(),
  }) {
    if (deleteacoin != null) {
      return deleteacoin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCoinListEvent value) fetchcoinlist,
    required TResult Function(_FetchCoinByIdEvent value) fetchcoinbyid,
    required TResult Function(_AddCoinEvent value) addcoin,
    required TResult Function(_UpdateCoinEvent value) updatecoin,
    required TResult Function(_DeleteCoinEvent value) deleteacoin,
  }) {
    return deleteacoin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult? Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult? Function(_AddCoinEvent value)? addcoin,
    TResult? Function(_UpdateCoinEvent value)? updatecoin,
    TResult? Function(_DeleteCoinEvent value)? deleteacoin,
  }) {
    return deleteacoin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCoinListEvent value)? fetchcoinlist,
    TResult Function(_FetchCoinByIdEvent value)? fetchcoinbyid,
    TResult Function(_AddCoinEvent value)? addcoin,
    TResult Function(_UpdateCoinEvent value)? updatecoin,
    TResult Function(_DeleteCoinEvent value)? deleteacoin,
    required TResult orElse(),
  }) {
    if (deleteacoin != null) {
      return deleteacoin(this);
    }
    return orElse();
  }
}

abstract class _DeleteCoinEvent implements CoinEvent {
  const factory _DeleteCoinEvent() = _$_DeleteCoinEvent;
}

/// @nodoc
mixin _$CoinState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function() displayspecificcoins,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displayspecificcoins,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displayspecificcoins,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialCoinState value) initial,
    required TResult Function(_LoadingCoinState value) loading,
    required TResult Function(_ErrorCoinState value) error,
    required TResult Function(_SuccesCoinState value) success,
    required TResult Function(_DisplaySpecificCoinsState value)
        displayspecificcoins,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCoinState value)? initial,
    TResult? Function(_LoadingCoinState value)? loading,
    TResult? Function(_ErrorCoinState value)? error,
    TResult? Function(_SuccesCoinState value)? success,
    TResult? Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCoinState value)? initial,
    TResult Function(_LoadingCoinState value)? loading,
    TResult Function(_ErrorCoinState value)? error,
    TResult Function(_SuccesCoinState value)? success,
    TResult Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinStateCopyWith<$Res> {
  factory $CoinStateCopyWith(CoinState value, $Res Function(CoinState) then) =
      _$CoinStateCopyWithImpl<$Res, CoinState>;
}

/// @nodoc
class _$CoinStateCopyWithImpl<$Res, $Val extends CoinState>
    implements $CoinStateCopyWith<$Res> {
  _$CoinStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCoinStateCopyWith<$Res> {
  factory _$$_InitialCoinStateCopyWith(
          _$_InitialCoinState value, $Res Function(_$_InitialCoinState) then) =
      __$$_InitialCoinStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCoinStateCopyWithImpl<$Res>
    extends _$CoinStateCopyWithImpl<$Res, _$_InitialCoinState>
    implements _$$_InitialCoinStateCopyWith<$Res> {
  __$$_InitialCoinStateCopyWithImpl(
      _$_InitialCoinState _value, $Res Function(_$_InitialCoinState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialCoinState implements _InitialCoinState {
  const _$_InitialCoinState();

  @override
  String toString() {
    return 'CoinState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialCoinState);
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
    required TResult Function() displayspecificcoins,
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
    TResult? Function()? displayspecificcoins,
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
    TResult Function()? displayspecificcoins,
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
    required TResult Function(_InitialCoinState value) initial,
    required TResult Function(_LoadingCoinState value) loading,
    required TResult Function(_ErrorCoinState value) error,
    required TResult Function(_SuccesCoinState value) success,
    required TResult Function(_DisplaySpecificCoinsState value)
        displayspecificcoins,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCoinState value)? initial,
    TResult? Function(_LoadingCoinState value)? loading,
    TResult? Function(_ErrorCoinState value)? error,
    TResult? Function(_SuccesCoinState value)? success,
    TResult? Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCoinState value)? initial,
    TResult Function(_LoadingCoinState value)? loading,
    TResult Function(_ErrorCoinState value)? error,
    TResult Function(_SuccesCoinState value)? success,
    TResult Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialCoinState implements CoinState {
  const factory _InitialCoinState() = _$_InitialCoinState;
}

/// @nodoc
abstract class _$$_LoadingCoinStateCopyWith<$Res> {
  factory _$$_LoadingCoinStateCopyWith(
          _$_LoadingCoinState value, $Res Function(_$_LoadingCoinState) then) =
      __$$_LoadingCoinStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCoinStateCopyWithImpl<$Res>
    extends _$CoinStateCopyWithImpl<$Res, _$_LoadingCoinState>
    implements _$$_LoadingCoinStateCopyWith<$Res> {
  __$$_LoadingCoinStateCopyWithImpl(
      _$_LoadingCoinState _value, $Res Function(_$_LoadingCoinState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingCoinState implements _LoadingCoinState {
  const _$_LoadingCoinState();

  @override
  String toString() {
    return 'CoinState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingCoinState);
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
    required TResult Function() displayspecificcoins,
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
    TResult? Function()? displayspecificcoins,
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
    TResult Function()? displayspecificcoins,
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
    required TResult Function(_InitialCoinState value) initial,
    required TResult Function(_LoadingCoinState value) loading,
    required TResult Function(_ErrorCoinState value) error,
    required TResult Function(_SuccesCoinState value) success,
    required TResult Function(_DisplaySpecificCoinsState value)
        displayspecificcoins,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCoinState value)? initial,
    TResult? Function(_LoadingCoinState value)? loading,
    TResult? Function(_ErrorCoinState value)? error,
    TResult? Function(_SuccesCoinState value)? success,
    TResult? Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCoinState value)? initial,
    TResult Function(_LoadingCoinState value)? loading,
    TResult Function(_ErrorCoinState value)? error,
    TResult Function(_SuccesCoinState value)? success,
    TResult Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingCoinState implements CoinState {
  const factory _LoadingCoinState() = _$_LoadingCoinState;
}

/// @nodoc
abstract class _$$_ErrorCoinStateCopyWith<$Res> {
  factory _$$_ErrorCoinStateCopyWith(
          _$_ErrorCoinState value, $Res Function(_$_ErrorCoinState) then) =
      __$$_ErrorCoinStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCoinStateCopyWithImpl<$Res>
    extends _$CoinStateCopyWithImpl<$Res, _$_ErrorCoinState>
    implements _$$_ErrorCoinStateCopyWith<$Res> {
  __$$_ErrorCoinStateCopyWithImpl(
      _$_ErrorCoinState _value, $Res Function(_$_ErrorCoinState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ErrorCoinState implements _ErrorCoinState {
  const _$_ErrorCoinState();

  @override
  String toString() {
    return 'CoinState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ErrorCoinState);
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
    required TResult Function() displayspecificcoins,
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
    TResult? Function()? displayspecificcoins,
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
    TResult Function()? displayspecificcoins,
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
    required TResult Function(_InitialCoinState value) initial,
    required TResult Function(_LoadingCoinState value) loading,
    required TResult Function(_ErrorCoinState value) error,
    required TResult Function(_SuccesCoinState value) success,
    required TResult Function(_DisplaySpecificCoinsState value)
        displayspecificcoins,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCoinState value)? initial,
    TResult? Function(_LoadingCoinState value)? loading,
    TResult? Function(_ErrorCoinState value)? error,
    TResult? Function(_SuccesCoinState value)? success,
    TResult? Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCoinState value)? initial,
    TResult Function(_LoadingCoinState value)? loading,
    TResult Function(_ErrorCoinState value)? error,
    TResult Function(_SuccesCoinState value)? success,
    TResult Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorCoinState implements CoinState {
  const factory _ErrorCoinState() = _$_ErrorCoinState;
}

/// @nodoc
abstract class _$$_SuccesCoinStateCopyWith<$Res> {
  factory _$$_SuccesCoinStateCopyWith(
          _$_SuccesCoinState value, $Res Function(_$_SuccesCoinState) then) =
      __$$_SuccesCoinStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccesCoinStateCopyWithImpl<$Res>
    extends _$CoinStateCopyWithImpl<$Res, _$_SuccesCoinState>
    implements _$$_SuccesCoinStateCopyWith<$Res> {
  __$$_SuccesCoinStateCopyWithImpl(
      _$_SuccesCoinState _value, $Res Function(_$_SuccesCoinState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SuccesCoinState implements _SuccesCoinState {
  const _$_SuccesCoinState();

  @override
  String toString() {
    return 'CoinState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SuccesCoinState);
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
    required TResult Function() displayspecificcoins,
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
    TResult? Function()? displayspecificcoins,
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
    TResult Function()? displayspecificcoins,
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
    required TResult Function(_InitialCoinState value) initial,
    required TResult Function(_LoadingCoinState value) loading,
    required TResult Function(_ErrorCoinState value) error,
    required TResult Function(_SuccesCoinState value) success,
    required TResult Function(_DisplaySpecificCoinsState value)
        displayspecificcoins,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCoinState value)? initial,
    TResult? Function(_LoadingCoinState value)? loading,
    TResult? Function(_ErrorCoinState value)? error,
    TResult? Function(_SuccesCoinState value)? success,
    TResult? Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCoinState value)? initial,
    TResult Function(_LoadingCoinState value)? loading,
    TResult Function(_ErrorCoinState value)? error,
    TResult Function(_SuccesCoinState value)? success,
    TResult Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccesCoinState implements CoinState {
  const factory _SuccesCoinState() = _$_SuccesCoinState;
}

/// @nodoc
abstract class _$$_DisplaySpecificCoinsStateCopyWith<$Res> {
  factory _$$_DisplaySpecificCoinsStateCopyWith(
          _$_DisplaySpecificCoinsState value,
          $Res Function(_$_DisplaySpecificCoinsState) then) =
      __$$_DisplaySpecificCoinsStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisplaySpecificCoinsStateCopyWithImpl<$Res>
    extends _$CoinStateCopyWithImpl<$Res, _$_DisplaySpecificCoinsState>
    implements _$$_DisplaySpecificCoinsStateCopyWith<$Res> {
  __$$_DisplaySpecificCoinsStateCopyWithImpl(
      _$_DisplaySpecificCoinsState _value,
      $Res Function(_$_DisplaySpecificCoinsState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisplaySpecificCoinsState implements _DisplaySpecificCoinsState {
  const _$_DisplaySpecificCoinsState();

  @override
  String toString() {
    return 'CoinState.displayspecificcoins()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DisplaySpecificCoinsState);
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
    required TResult Function() displayspecificcoins,
  }) {
    return displayspecificcoins();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
    TResult? Function()? displayspecificcoins,
  }) {
    return displayspecificcoins?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function()? displayspecificcoins,
    required TResult orElse(),
  }) {
    if (displayspecificcoins != null) {
      return displayspecificcoins();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialCoinState value) initial,
    required TResult Function(_LoadingCoinState value) loading,
    required TResult Function(_ErrorCoinState value) error,
    required TResult Function(_SuccesCoinState value) success,
    required TResult Function(_DisplaySpecificCoinsState value)
        displayspecificcoins,
  }) {
    return displayspecificcoins(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCoinState value)? initial,
    TResult? Function(_LoadingCoinState value)? loading,
    TResult? Function(_ErrorCoinState value)? error,
    TResult? Function(_SuccesCoinState value)? success,
    TResult? Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
  }) {
    return displayspecificcoins?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCoinState value)? initial,
    TResult Function(_LoadingCoinState value)? loading,
    TResult Function(_ErrorCoinState value)? error,
    TResult Function(_SuccesCoinState value)? success,
    TResult Function(_DisplaySpecificCoinsState value)? displayspecificcoins,
    required TResult orElse(),
  }) {
    if (displayspecificcoins != null) {
      return displayspecificcoins(this);
    }
    return orElse();
  }
}

abstract class _DisplaySpecificCoinsState implements CoinState {
  const factory _DisplaySpecificCoinsState() = _$_DisplaySpecificCoinsState;
}
