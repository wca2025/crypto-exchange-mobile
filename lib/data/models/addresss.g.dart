// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Addresss _$$_AddresssFromJson(Map<String, dynamic> json) => _$_Addresss(
      id: json['id'] as int,
      addresssname: json['addresssname'] as String?,
      label: json['label'] as String?,
      asset: json['asset'] as String?,
      note: json['note'] as String?,
      whitelist: json['whitelist'] as bool?,
      addresss: json['addresss'] as String?,
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AddresssToJson(_$_Addresss instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addresssname': instance.addresssname,
      'label': instance.label,
      'asset': instance.asset,
      'note': instance.note,
      'whitelist': instance.whitelist,
      'addresss': instance.addresss,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
