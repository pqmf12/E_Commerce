import 'package:opencart_ecommapp1/Models/Account/account.dart';
import 'package:opencart_ecommapp1/Models/products/list_of_product.dart';
import 'package:opencart_ecommapp1/Models/products/product_details.dart';
import 'Account/DAOInfoDetails.dart';
import 'Account/DAOInformation.dart';
import 'AuthDio/DioSignIn.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'AuthDio/DioSignUp.dart';
import 'Banner/DAOBanner.dart';
import 'Banner/DAOBannerDetail.dart';
import 'Betseller/DAOSeller.dart';
import 'Cart/AddCart.dart';
import 'Cart/GetCart.dart';
import 'Category/DAOSubCategory.dart';
import 'Category/categories.dart';
import 'Category/list_of_categories.dart';
import 'Compare/DAOCompare.dart';
import 'Featured/DAOfeatured.dart';
import 'Language/DAOLanguageDetail.dart';
import 'Language/DAOLanguageList.dart';
import 'Latest/DAOLatestProduct.dart';
import 'Manufacturer/DAOManufactures.dart';
import 'Search/search.dart';
import 'Search/search.dart';
import 'Session/session.dart';
import 'Specials/DAOSpecialProducts.dart';
import 'UTC/DAOOffset.dart';
import 'WishList/DAOGetWishlist.dart';

part 'RestApiClient.g.dart';

@RestApi(baseUrl: 'https://api.opencart-api.com/api/rest/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @MultiPart()
  @POST('login')
  Future<DioSignIn> getLogin(
      @Body() data,
      @Header("X-Oc-Session") String Session,
      @Header("X-Oc-Merchant-Id") String Merchant,
      );

  @MultiPart()
  @POST('register')
  Future<DioSignUp> getSignUp(
      @Body() request,
      @Header("X-Oc-Session") String Session,
      @Header("X-Oc-Merchant-Id") String Merchant,
      );

  @MultiPart()
  @POST('forgotten')
  Future<DioSignUp> forgotten(
      @Body() data,
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      );

  @MultiPart()
  @GET('products')
  Future<Product> products(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("Accept") String Accept,
      );

  @MultiPart()
  @GET('products/manufacturer/{id}/limit/{limit}/page/{page}')
  Future<Product> manufacturerproducts(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("Accept") String Accept,
      @Header("X-Oc-Session") String Session,
      @Path('id') int id,
      @Path('limit') int limit,
      @Path('page') int page,
      );

  @MultiPart()
  @GET('products/{id}')
  Future<ProductDetail> productdetails(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("Accept") String Accept,
      @Header("X-Oc-Session") String Session,
      @Path('id') int id,
      );

  @MultiPart()
  @POST('logout')
  Future<DioSignUp> logout(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      );

  @MultiPart()
  @GET('products/category/')
  Future<categories> category(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('categories/{id}')
  Future<DAOSubCategory> subcategory(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      @Path('id') int id,
      );

  @MultiPart()
  @GET('categories')
  Future<ListCategory> listcatgory(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('account')
  Future<Account> account(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('session')
  Future<session> Session(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("Accept") String  Accept,
      @Header("Content-Type") String  Type,
      @Header("X-Oc-Session") String Session,
      );

  @MultiPart()
  @POST('cart')
  Future<AddCart> additemcart (
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Content-Type") String  Type,
      @Header("Accept") String  Accept,
      @Body() data,
      );

  @MultiPart()
  @POST('cart_bulk')
  Future<AddCart> cart_bulk(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Content-Type") String  Type,
      @Header("Accept") String  Accept,
      @Body() data,
      );

     @MultiPart()
     @GET('cart')
     Future<GetCart> getcart(
     @Header("X-Oc-Merchant-Id") String Merchant,
         @Header("X-Oc-Session") String Session,
         @Header("Accept") String  Accept,
         );

  @MultiPart()
  @GET('bestsellers')
  Future<DAOSeller> bestsellers(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('products/search/{search}')
  Future<Search> search(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("Accept") String Accept,
      @Path('search') String search,
      );

  @MultiPart()
  @GET('featured/limit/{limit}')
  Future<DAOfeatured> featured(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      @Path('limit') int limit,
      );

  @MultiPart()
  @GET('latest/limit/{limit}')
  Future<DAOLatestProduct> latest(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      @Path('limit') int limit,
      );

  @MultiPart()
  @GET('specials/limit/{limit}')
  Future<DAOSpecialProducts> specials(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      @Path('limit') int limit,
      );

  @MultiPart()
  @GET('order_statuses')
  Future<DAOLatestProduct> Getorder(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('information')
  Future<DAOInformation> information(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('information/{id}')
  Future<DAOInfoDetails> infodetails(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      @Path('id') int id,
      );

  @MultiPart()
  @GET('languages/{id}')
  Future<LanguageDetail> languagesdetails(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      @Path('id') int id,
      );

  @MultiPart()
  @GET('languages')
  Future<DAOLanguageList> languages(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('manufacturers')
  Future<DAOManufactures> manufacturers(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('banners')
  Future<DAOBanner> banners(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      );

  @MultiPart()
  @GET('banners/{id}')
  Future<DAOBannerDetail> bannersdetails(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String  Accept,
      @Path('id') String id,
      );

  @MultiPart()
  @POST('wishlist/{id}')
  Future<DioSignUp> add_wishlist(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Path('id') int id,
      );

  @MultiPart()
  @GET('wishlist')
  Future<DAOGetWishlist> getwishlist(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String Accept,
      );

  @MultiPart()
  @GET('order_statuses')
  Future<DAOGetWishlist> orderstatus(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String Accept,
      );

  @MultiPart()
  @POST('contact')
  Future<DioSignUp> contact(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Body() data,
      );

  @MultiPart()
  @GET('compare/{ids}')
  Future<DAOCompare> compare(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Path('ids') String ids,
      );

  @MultiPart()
  @GET('utc_offset')
  Future<DAOOffset> UtcOffset(
      @Header("X-Oc-Merchant-Id") String Merchant,
      @Header("X-Oc-Session") String Session,
      @Header("Accept") String Accept,
      );

}