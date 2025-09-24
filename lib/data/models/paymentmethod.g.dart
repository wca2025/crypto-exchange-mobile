// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentmethod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Paymentmethod _$$_PaymentmethodFromJson(Map<String, dynamic> json) =>
    _$_Paymentmethod(
      name: json['name'] as String,
      id: json['id'] as int,
      fullname: json['fullname'] as String?,
      bankcardno: json['bankcardno'] as int?,
      expirydate: (json['expirydate'] as num?)?.toDouble(),
      cvc: json['cvc'] as int?,
      bankbranch: json['bankbranch'] as String?,
      bankaccount: json['bankaccount'] as int?,
      bankname: json['bankname'] as String?,
      addresss: json['addresss'] as String?,
      iban: json['iban'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      postcode: json['postcode'] as String?,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$$_PaymentmethodToJson(_$_Paymentmethod instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'fullname': instance.fullname,
      'bankcardno': instance.bankcardno,
      'expirydate': instance.expirydate,
      'cvc': instance.cvc,
      'bankbranch': instance.bankbranch,
      'bankaccount': instance.bankaccount,
      'bankname': instance.bankname,
      'addresss': instance.addresss,
      'iban': instance.iban,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postcode': instance.postcode,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
