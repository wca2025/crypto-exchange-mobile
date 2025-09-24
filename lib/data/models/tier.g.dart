// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tier _$$_TierFromJson(Map<String, dynamic> json) => _$_Tier(
      id: json['id'] as int,
      desc: json['desc'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      level: json['level'] as int?,
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TierToJson(_$_Tier instance) => <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
      'name': instance.name,
      'slug': instance.slug,
      'level': instance.level,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
