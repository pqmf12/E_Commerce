// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCart _$GetCartFromJson(Map<String, dynamic> json) => GetCart(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCartToJson(GetCart instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

AddItem _$AddItemFromJson(Map<String, dynamic> json) => AddItem(
      weight: json['weight'],
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductList.fromJson(e as Map<String, dynamic>))
          .toList(),
      vouchers: json['vouchers'] as List<dynamic>?,
      coupon_status: json['coupon_status'],
      coupon: json['coupon'],
      voucher_status: json['voucher_status'],
      voucher: json['voucher'],
      reward_status: json['reward_status'],
      reward: json['reward'],
      totals: (json['totals'] as List<dynamic>?)
          ?.map((e) => Sum.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'],
      total_raw: json['total_raw'],
      total_product_count: json['total_product_count'],
      has_shipping: json['has_shipping'],
      has_download: json['has_download'],
      has_recurring_products: json['has_recurring_products'],
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddItemToJson(AddItem instance) => <String, dynamic>{
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

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      key: json['key'],
      thumb: json['thumb'],
      name: json['name'],
      points: json['points'],
      product_id: json['product_id'],
      model: json['model'],
      option: json['option'] as List<dynamic>?,
      quantity: json['quantity'],
      stock: json['stock'],
      reward: json['reward'],
      price: json['price'],
      recurring: json['recurring'],
      total: json['total'],
      price_raw: json['price_raw'],
      total_raw: json['total_raw'],
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
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

Sum _$SumFromJson(Map<String, dynamic> json) => Sum(
      title: json['title'],
      text: json['text'],
      value: json['value'],
    );

Map<String, dynamic> _$SumToJson(Sum instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'value': instance.value,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      currency_id: json['currency_id'],
      symbol_left: json['symbol_left'],
      symbol_right: json['symbol_right'],
      decimal_place: json['decimal_place'],
      value: json['value'],
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'currency_id': instance.currency_id,
      'symbol_left': instance.symbol_left,
      'symbol_right': instance.symbol_right,
      'decimal_place': instance.decimal_place,
      'value': instance.value,
    };
