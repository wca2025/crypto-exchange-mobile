// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_P2P _$$_P2PFromJson(Map<String, dynamic> json) => _$_P2P(
      id: json['id'] as int,
      orderid: json['orderid'] as int,
      available: json['available'] as String?,
      nickname: json['nickname'] as String?,
      floating: (json['floating'] as num?)?.toDouble(),
      fixedPrice: (json['fixedPrice'] as num?)?.toDouble(),
      floatingPrice: (json['floatingPrice'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      mintransactionquantity:
          (json['mintransactionquantity'] as num?)?.toDouble(),
      maxtransactionquantity:
          (json['maxtransactionquantity'] as num?)?.toDouble(),
      notes: (json['notes'] as num?)?.toDouble(),
      fixedprice: (json['fixedprice'] as num?)?.toDouble(),
      premium: (json['premium'] as num?)?.toDouble(),
      unitprice: (json['unitprice'] as num?)?.toDouble(),
      fiat: (json['fiat'] as num?)?.toDouble(),
      counterparty: (json['counterparty'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      typeoff: json['typeoff'] as String?,
      paymentwindow: json['paymentwindow'] as String?,
      reasonforappeal: json['reasonforappeal'] as String?,
      description: json['description'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_P2PToJson(_$_P2P instance) => <String, dynamic>{
      'id': instance.id,
      'orderid': instance.orderid,
      'available': instance.available,
      'nickname': instance.nickname,
      'floating': instance.floating,
      'fixedPrice': instance.fixedPrice,
      'floatingPrice': instance.floatingPrice,
      'amount': instance.amount,
      'mintransactionquantity': instance.mintransactionquantity,
      'maxtransactionquantity': instance.maxtransactionquantity,
      'notes': instance.notes,
      'fixedprice': instance.fixedprice,
      'premium': instance.premium,
      'unitprice': instance.unitprice,
      'fiat': instance.fiat,
      'counterparty': instance.counterparty,
      'quantity': instance.quantity,
      'typeoff': instance.typeoff,
      'paymentwindow': instance.paymentwindow,
      'reasonforappeal': instance.reasonforappeal,
      'description': instance.description,
      'phone': instance.phone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
