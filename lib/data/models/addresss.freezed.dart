// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'addresss.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Addresss _$AddresssFromJson(Map<String, dynamic> json) {
  return _Addresss.fromJson(json);
}

/// @nodoc
mixin _$Addresss {
  int get id => throw _privateConstructorUsedError; // required   Asset assetID,
// required  Network NetworkID,
  String? get addresssname => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get asset => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  bool? get whitelist => throw _privateConstructorUsedError;
  String? get addresss =>
      throw _privateConstructorUsedError; //  TransactionStatus? transactionStatusId,
  double? get createdAt => throw _privateConstructorUsedError;
  double? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddresssCopyWith<Addresss> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddresssCopyWith<$Res> {
  factory $AddresssCopyWith(Addresss value, $Res Function(Addresss) then) =
      _$AddresssCopyWithImpl<$Res, Addresss>;
  @useResult
  $Res call(
      {int id,
      String? addresssname,
      String? label,
      String? asset,
      String? note,
      bool? whitelist,
      String? addresss,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class _$AddresssCopyWithImpl<$Res, $Val extends Addresss>
    implements $AddresssCopyWith<$Res> {
  _$AddresssCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addresssname = freezed,
    Object? label = freezed,
    Object? asset = freezed,
    Object? note = freezed,
    Object? whitelist = freezed,
    Object? addresss = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addresssname: freezed == addresssname
          ? _value.addresssname
          : addresssname // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      whitelist: freezed == whitelist
          ? _value.whitelist
          : whitelist // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresss: freezed == addresss
          ? _value.addresss
          : addresss // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_AddresssCopyWith<$Res> implements $AddresssCopyWith<$Res> {
  factory _$$_AddresssCopyWith(
          _$_Addresss value, $Res Function(_$_Addresss) then) =
      __$$_AddresssCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? addresssname,
      String? label,
      String? asset,
      String? note,
      bool? whitelist,
      String? addresss,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class __$$_AddresssCopyWithImpl<$Res>
    extends _$AddresssCopyWithImpl<$Res, _$_Addresss>
    implements _$$_AddresssCopyWith<$Res> {
  __$$_AddresssCopyWithImpl(
      _$_Addresss _value, $Res Function(_$_Addresss) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addresssname = freezed,
    Object? label = freezed,
    Object? asset = freezed,
    Object? note = freezed,
    Object? whitelist = freezed,
    Object? addresss = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Addresss(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addresssname: freezed == addresssname
          ? _value.addresssname
          : addresssname // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      whitelist: freezed == whitelist
          ? _value.whitelist
          : whitelist // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresss: freezed == addresss
          ? _value.addresss
          : addresss // ignore: cast_nullable_to_non_nullable
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
class _$_Addresss with DiagnosticableTreeMixin implements _Addresss {
  const _$_Addresss(
      {required this.id,
      this.addresssname,
      this.label,
      this.asset,
      this.note,
      this.whitelist,
      this.addresss,
      this.createdAt,
      this.updatedAt});

  factory _$_Addresss.fromJson(Map<String, dynamic> json) =>
      _$$_AddresssFromJson(json);

  @override
  final int id;
// required   Asset assetID,
// required  Network NetworkID,
  @override
  final String? addresssname;
  @override
  final String? label;
  @override
  final String? asset;
  @override
  final String? note;
  @override
  final bool? whitelist;
  @override
  final String? addresss;
//  TransactionStatus? transactionStatusId,
  @override
  final double? createdAt;
  @override
  final double? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Addresss(id: $id, addresssname: $addresssname, label: $label, asset: $asset, note: $note, whitelist: $whitelist, addresss: $addresss, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Addresss'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('addresssname', addresssname))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('asset', asset))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('whitelist', whitelist))
      ..add(DiagnosticsProperty('addresss', addresss))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Addresss &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addresssname, addresssname) ||
                other.addresssname == addresssname) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.whitelist, whitelist) ||
                other.whitelist == whitelist) &&
            (identical(other.addresss, addresss) ||
                other.addresss == addresss) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, addresssname, label, asset,
      note, whitelist, addresss, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddresssCopyWith<_$_Addresss> get copyWith =>
      __$$_AddresssCopyWithImpl<_$_Addresss>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddresssToJson(
      this,
    );
  }
}

abstract class _Addresss implements Addresss {
  const factory _Addresss(
      {required final int id,
      final String? addresssname,
      final String? label,
      final String? asset,
      final String? note,
      final bool? whitelist,
      final String? addresss,
      final double? createdAt,
      final double? updatedAt}) = _$_Addresss;

  factory _Addresss.fromJson(Map<String, dynamic> json) = _$_Addresss.fromJson;

  @override
  int get id;
  @override // required   Asset assetID,
// required  Network NetworkID,
  String? get addresssname;
  @override
  String? get label;
  @override
  String? get asset;
  @override
  String? get note;
  @override
  bool? get whitelist;
  @override
  String? get addresss;
  @override //  TransactionStatus? transactionStatusId,
  double? get createdAt;
  @override
  double? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AddresssCopyWith<_$_Addresss> get copyWith =>
      throw _privateConstructorUsedError;
}
