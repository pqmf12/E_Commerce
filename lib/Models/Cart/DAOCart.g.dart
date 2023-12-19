// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOCart _$DAOCartFromJson(Map<String, dynamic> json) => DAOCart(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'],
    );

Map<String, dynamic> _$DAOCartToJson(DAOCart instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

ApiData _$ApiDataFromJson(Map<String, dynamic> json) => ApiData(
      weight: json['weight'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
      vouchers: json['vouchers'] as List<dynamic>?,
      coupon_status: json['coupon_status'] as String?,
      coupon: json['coupon'] as String?,
      voucher_status: json['voucher_status'] as String?,
      voucher: json['voucher'] as String?,
      reward_status: json['reward_status'] as bool?,
      reward: json['reward'] as String?,
      totals: (json['totals'] as List<dynamic>?)
          ?.map((e) => Total.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as String?,
      total_raw: (json['total_raw'] as num?)?.toDouble(),
      total_product_count: json['total_product_count'] as int?,
      has_shipping: json['has_shipping'] as int?,
      has_download: json['has_download'] as int?,
      has_recurring_products: json['has_recurring_products'] as int?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiDataToJson(ApiData instance) => <String, dynamic>{
      'weight': instance.weight,
      'products': instance.products,
      'vouchers': instance.vouchers,
      'coupon_status': instance.coupon_status,
      'coupon': instance.coupon,
      'voucher_status': instance.voucher_status,
      'voucher': instance.voucher,
      'reward_status': instance.reward_status,
      'reward': instance.reward,
      'totals': instance.totals,
      'total': instance.total,
      'total_raw': instance.total_raw,
      'total_product_count': instance.total_product_count,
      'has_shipping': instance.has_shipping,
      'has_download': instance.has_download,
      'has_recurring_products': instance.has_recurring_products,
      'currency': instance.currency,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      key: json['key'] as String?,
      thumb: json['thumb'] as String?,
      name: json['name'] as String?,
      points: json['points'] as int?,
      product_id: json['product_id'] as String?,
      model: json['model'] as String?,
      option: json['option'] as List<dynamic>?,
      quantity: json['quantity'] as String?,
      stock: json['stock'] as bool?,
      reward: json['reward'] as String?,
      price: json['price'] as String?,
      recurring: json['recurring'] as String?,
      total: json['total'] as String?,
      price_raw: (json['price_raw'] as num?)?.toDouble(),
      total_raw: (json['total_raw'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'thumb': instance.thumb,
      'name': instance.name,
      'points': instance.points,
      'product_id': instance.product_id,
      'model': instance.model,
      'option': instance.option,
      'quantity': instance.quantity,
      'stock': instance.stock,
      'reward': instance.reward,
      'price': instance.price,
      'recurring': instance.recurring,
      'total': instance.total,
      'price_raw': instance.price_raw,
      'total_raw': instance.total_raw,
    };

Total _$TotalFromJson(Map<String, dynamic> json) => Total(
      title: json['title'] as String?,
      text: json['text'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'value': instance.value,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      currency_id: json['currency_id'] as String?,
      symbol_left: json['symbol_left'] as String?,
      symbol_right: json['symbol_right'] as String?,
      decimal_place: json['decimal_place'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'currency_id': instance.currency_id,
      'symbol_left': instance.symbol_left,
      'symbol_right': instance.symbol_right,
      'decimal_place': instance.decimal_place,
      'value': instance.value,
    };
