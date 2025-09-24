// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Limit _$$_LimitFromJson(Map<String, dynamic> json) => _$_Limit(
      id: json['id'] as int,
      fiattradingpair: json['fiattradingpair'] as String?,
      typeoff: json['typeoff'] as String?,
      asset: json['asset'] as String?,
      slug: json['slug'] as String?,
      dailyconfirmationlimit:
          (json['dailyconfirmationlimit'] as num?)?.toDouble(),
      dailyapprovallimit: (json['dailyapprovallimit'] as num?)?.toDouble(),
      weeklyapprovallimit: (json['weeklyapprovallimit'] as num?)?.toDouble(),
      weeklyconfirmation: (json['weeklyconfirmation'] as num?)?.toDouble(),
      onetimeap: (json['onetimeap'] as num?)?.toDouble(),
      onetimeapprovallimit: (json['onetimeapprovallimit'] as num?)?.toDouble(),
      onetimeconfirmationlimit:
          (json['onetimeconfirmationlimit'] as num?)?.toDouble(),
      pertransactionminlimit:
          (json['pertransactionminlimit'] as num?)?.toDouble(),
      pertransactionmaxlimit:
          (json['pertransactionmaxlimit'] as num?)?.toDouble(),
      hrs24userxchnagelimit:
          (json['hrs24userxchnagelimit'] as num?)?.toDouble(),
      hrs24platformxchangelimit:
          (json['hrs24platformxchangelimit'] as num?)?.toDouble(),
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_LimitToJson(_$_Limit instance) => <String, dynamic>{
      'id': instance.id,
      'fiattradingpair': instance.fiattradingpair,
      'typeoff': instance.typeoff,
      'asset': instance.asset,
      'slug': instance.slug,
      'dailyconfirmationlimit': instance.dailyconfirmationlimit,
      'dailyapprovallimit': instance.dailyapprovallimit,
      'weeklyapprovallimit': instance.weeklyapprovallimit,
      'weeklyconfirmation': instance.weeklyconfirmation,
      'onetimeap': instance.onetimeap,
      'onetimeapprovallimit': instance.onetimeapprovallimit,
      'onetimeconfirmationlimit': instance.onetimeconfirmationlimit,
      'pertransactionminlimit': instance.pertransactionminlimit,
      'pertransactionmaxlimit': instance.pertransactionmaxlimit,
      'hrs24userxchnagelimit': instance.hrs24userxchnagelimit,
      'hrs24platformxchangelimit': instance.hrs24platformxchangelimit,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
