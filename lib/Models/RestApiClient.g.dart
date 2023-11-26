// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestApiClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.opencart-api.com/api/rest/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DioSignIn> getLogin(
    dynamic data,
    String Session,
    String Merchant,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Session': Session,
      r'X-Oc-Merchant-Id': Merchant,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = data;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DioSignIn>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DioSignIn.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DioSignUp> getSignUp(
    dynamic request,
    String Session,
    String Merchant,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Session': Session,
      r'X-Oc-Merchant-Id': Merchant,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = request;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DioSignUp>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DioSignUp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DioSignUp> forgotten(
    dynamic data,
    String Merchant,
    String Session,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = data;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DioSignUp>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'forgotten',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DioSignUp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Product> products(
    String Merchant,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Product>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'products',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Product.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Product> manufacturerproducts(
    String Merchant,
    String Accept,
    String Session,
    int id,
    int limit,
    int page,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'Accept': Accept,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Product>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'products/manufacturer/${id}/limit/${limit}/page/${page}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Product.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductDetail> productdetails(
    String Merchant,
    String Accept,
    String Session,
    int id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'Accept': Accept,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ProductDetail>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'products/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ProductDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DioSignUp> logout(
    String Merchant,
    String Session,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DioSignUp>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'logout',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DioSignUp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<categories> category(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<categories>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'products/category/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = categories.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOSubCategory> subcategory(
    String Merchant,
    String Session,
    String Accept,
    int id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOSubCategory>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'categories/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOSubCategory.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ListCategory> listcatgory(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ListCategory>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListCategory.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Account> account(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Account>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'account',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Account.fromJson(_result.data!);
    return value;
  }

  @override
  Future<session> Session(
    String Merchant,
    String Accept,
    String Type,
    String Session,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'Accept': Accept,
      r'Content-Type': Type,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<session>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'session',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = session.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddCart> additemcart(
    String Merchant,
    String Session,
    String Type,
    String Accept,
    dynamic data,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Content-Type': Type,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = data;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<AddCart>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AddCart.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddCart> cart_bulk(
    String Merchant,
    String Session,
    String Type,
    String Accept,
    dynamic data,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Content-Type': Type,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = data;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<AddCart>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'cart_bulk',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AddCart.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCart> getcart(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<GetCart>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'cart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetCart.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOSeller> bestsellers(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOSeller>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'bestsellers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOSeller.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Search> search(
    String Merchant,
    String Accept,
    String search,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Search>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'products/search/${search}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Search.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOfeatured> featured(
    String Merchant,
    String Session,
    String Accept,
    int limit,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOfeatured>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'featured/limit/${limit}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOfeatured.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOLatestProduct> latest(
    String Merchant,
    String Session,
    String Accept,
    int limit,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOLatestProduct>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'latest/limit/${limit}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOLatestProduct.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOSpecialProducts> specials(
    String Merchant,
    String Session,
    String Accept,
    int limit,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOSpecialProducts>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'specials/limit/${limit}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOSpecialProducts.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOLatestProduct> Getorder(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOLatestProduct>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'order_statuses',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOLatestProduct.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOInformation> information(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOInformation>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'information',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOInformation.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOInfoDetails> infodetails(
    String Merchant,
    String Session,
    String Accept,
    int id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOInfoDetails>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'information/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOInfoDetails.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LanguageDetail> languagesdetails(
    String Merchant,
    String Session,
    String Accept,
    int id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LanguageDetail>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'languages/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LanguageDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOLanguageList> languages(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOLanguageList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'languages',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOLanguageList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOManufactures> manufacturers(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOManufactures>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'manufacturers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOManufactures.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOBanner> banners(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOBanner>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'banners',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOBanner.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOBannerDetail> bannersdetails(
    String Merchant,
    String Session,
    String Accept,
    String id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOBannerDetail>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'banners/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOBannerDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DioSignUp> add_wishlist(
    String Merchant,
    String Session,
    int id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DioSignUp>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'wishlist/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DioSignUp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOGetWishlist> getwishlist(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOGetWishlist>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'wishlist',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOGetWishlist.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOGetWishlist> orderstatus(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOGetWishlist>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'order_statuses',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOGetWishlist.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DioSignUp> contact(
    String Merchant,
    String Session,
    dynamic data,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = data;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DioSignUp>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'contact',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DioSignUp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOCompare> compare(
    String Merchant,
    String Session,
    String ids,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOCompare>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'compare/${ids}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOCompare.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DAOOffset> UtcOffset(
    String Merchant,
    String Session,
    String Accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Oc-Merchant-Id': Merchant,
      r'X-Oc-Session': Session,
      r'Accept': Accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DAOOffset>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'utc_offset',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DAOOffset.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
