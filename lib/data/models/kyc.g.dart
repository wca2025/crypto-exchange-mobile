// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Kyc _$$_KycFromJson(Map<String, dynamic> json) => _$_Kyc(
      id: json['id'] as int,
      name: json['name'] as String,
      desc: json['desc'] as String,
      slug: json['slug'] as String,
      externaluserid: json['externaluserid'] as String,
      applicantId: json['applicantId'] as String,
      inspectionId: json['inspectionId'] as String,
      correlationId: json['correlationId'] as String,
      type: json['type'] as String,
      reviewResult: json['reviewResult'] as String,
      reviewStatus: json['reviewStatus'] as String,
      createdAt: json['createdAt'] as String,
      clientId: json['clientId'] as String,
    );

Map<String, dynamic> _$$_KycToJson(_$_Kyc instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'slug': instance.slug,
      'externaluserid': instance.externaluserid,
      'applicantId': instance.applicantId,
      'inspectionId': instance.inspectionId,
      'correlationId': instance.correlationId,
      'type': instance.type,
      'reviewResult': instance.reviewResult,
      'reviewStatus': instance.reviewStatus,
      'createdAt': instance.createdAt,
      'clientId': instance.clientId,
    };
