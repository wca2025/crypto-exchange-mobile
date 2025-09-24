// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as int,
      userID: json['userID'] as int,
      walletid: json['walletid'] as int,
      accountname: json['accountname'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      available: (json['available'] as num?)?.toDouble(),
      inorder: (json['inorder'] as num?)?.toDouble(),
      btcvalue: (json['btcvalue'] as num?)?.toDouble(),
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'walletid': instance.walletid,
      'accountname': instance.accountname,
      'total': instance.total,
      'available': instance.available,
      'inorder': instance.inorder,
      'btcvalue': instance.btcvalue,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
