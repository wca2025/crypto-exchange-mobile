// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  int get id => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  int get walletid =>
      throw _privateConstructorUsedError; // required Tier tierID,
// required Asset assetID,
  String? get accountname => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  double? get available => throw _privateConstructorUsedError;
  double? get inorder => throw _privateConstructorUsedError;
  double? get btcvalue => throw _privateConstructorUsedError;
  double? get createdAt => throw _privateConstructorUsedError;
  double? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {int id,
      int userID,
      int walletid,
      String? accountname,
      double? total,
      double? available,
      double? inorder,
      double? btcvalue,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? walletid = null,
    Object? accountname = freezed,
    Object? total = freezed,
    Object? available = freezed,
    Object? inorder = freezed,
    Object? btcvalue = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      walletid: null == walletid
          ? _value.walletid
          : walletid // ignore: cast_nullable_to_non_nullable
              as int,
      accountname: freezed == accountname
          ? _value.accountname
          : accountname // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double?,
      inorder: freezed == inorder
          ? _value.inorder
          : inorder // ignore: cast_nullable_to_non_nullable
              as double?,
      btcvalue: freezed == btcvalue
          ? _value.btcvalue
          : btcvalue // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$_AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$_AccountCopyWith(
          _$_Account value, $Res Function(_$_Account) then) =
      __$$_AccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userID,
      int walletid,
      String? accountname,
      double? total,
      double? available,
      double? inorder,
      double? btcvalue,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class __$$_AccountCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$_Account>
    implements _$$_AccountCopyWith<$Res> {
  __$$_AccountCopyWithImpl(_$_Account _value, $Res Function(_$_Account) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? walletid = null,
    Object? accountname = freezed,
    Object? total = freezed,
    Object? available = freezed,
    Object? inorder = freezed,
    Object? btcvalue = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Account(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      walletid: null == walletid
          ? _value.walletid
          : walletid // ignore: cast_nullable_to_non_nullable
              as int,
      accountname: freezed == accountname
          ? _value.accountname
          : accountname // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double?,
      inorder: freezed == inorder
          ? _value.inorder
          : inorder // ignore: cast_nullable_to_non_nullable
              as double?,
      btcvalue: freezed == btcvalue
          ? _value.btcvalue
          : btcvalue // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$_Account with DiagnosticableTreeMixin implements _Account {
  const _$_Account(
      {required this.id,
      required this.userID,
      required this.walletid,
      this.accountname,
      this.total,
      this.available,
      this.inorder,
      this.btcvalue,
      this.createdAt,
      this.updatedAt});

  factory _$_Account.fromJson(Map<String, dynamic> json) =>
      _$$_AccountFromJson(json);

  @override
  final int id;
  @override
  final int userID;
  @override
  final int walletid;
// required Tier tierID,
// required Asset assetID,
  @override
  final String? accountname;
  @override
  final double? total;
  @override
  final double? available;
  @override
  final double? inorder;
  @override
  final double? btcvalue;
  @override
  final double? createdAt;
  @override
  final double? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Account(id: $id, userID: $userID, walletid: $walletid, accountname: $accountname, total: $total, available: $available, inorder: $inorder, btcvalue: $btcvalue, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Account'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('walletid', walletid))
      ..add(DiagnosticsProperty('accountname', accountname))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('available', available))
      ..add(DiagnosticsProperty('inorder', inorder))
      ..add(DiagnosticsProperty('btcvalue', btcvalue))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.walletid, walletid) ||
                other.walletid == walletid) &&
            (identical(other.accountname, accountname) ||
                other.accountname == accountname) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.inorder, inorder) || other.inorder == inorder) &&
            (identical(other.btcvalue, btcvalue) ||
                other.btcvalue == btcvalue) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userID, walletid,
      accountname, total, available, inorder, btcvalue, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      __$$_AccountCopyWithImpl<_$_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {required final int id,
      required final int userID,
      required final int walletid,
      final String? accountname,
      final double? total,
      final double? available,
      final double? inorder,
      final double? btcvalue,
      final double? createdAt,
      final double? updatedAt}) = _$_Account;

  factory _Account.fromJson(Map<String, dynamic> json) = _$_Account.fromJson;

  @override
  int get id;
  @override
  int get userID;
  @override
  int get walletid;
  @override // required Tier tierID,
// required Asset assetID,
  String? get accountname;
  @override
  double? get total;
  @override
  double? get available;
  @override
  double? get inorder;
  @override
  double? get btcvalue;
  @override
  double? get createdAt;
  @override
  double? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      throw _privateConstructorUsedError;
}
