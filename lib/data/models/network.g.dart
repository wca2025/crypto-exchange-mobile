// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Network _$$_NetworkFromJson(Map<String, dynamic> json) => _$_Network(
      name: json['name'] as String,
      id: json['id'] as int,
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_NetworkToJson(_$_Network instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
