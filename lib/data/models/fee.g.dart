// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fee _$$_FeeFromJson(Map<String, dynamic> json) => _$_Fee(
      id: json['id'] as int,
      fiatcryptotype: json['fiatcryptotype'] as String?,
      cryptofiatpairs: json['cryptofiatpairs'] as String?,
      name: json['name'] as String?,
      feetype: json['feetype'] as String?,
      feerate: json['feerate'] as String?,
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FeeToJson(_$_Fee instance) => <String, dynamic>{
      'id': instance.id,
      'fiatcryptotype': instance.fiatcryptotype,
      'cryptofiatpairs': instance.cryptofiatpairs,
      'name': instance.name,
      'feetype': instance.feetype,
      'feerate': instance.feerate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
