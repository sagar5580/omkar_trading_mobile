import 'package:omkar_trading/code/constants/service_constants.dart';
import 'package:omkar_trading/code/model/complains_model.dart';
import 'package:omkar_trading/code/model/inquiries_model.dart';
import 'package:omkar_trading/code/model/notification_model.dart';
import 'package:omkar_trading/code/model/our_branche_model.dart';
import 'package:omkar_trading/code/model/product_earning_model.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/model/testimonials_model.dart';
import 'package:omkar_trading/code/model/user_login_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ServiceConstants.baseURL)
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;

  @GET('${ServiceConstants.products}')
  Future<ProductResponse> getProductList();

  @GET('${ServiceConstants.products}/{id}')
  Future<ProductData> getProductShow(@Path("id") String id);

  @GET('${ServiceConstants.testimonals}')
  Future<TestimonialsResponse> getTestimonialsList();

  @GET('${ServiceConstants.complains}')
  Future<ComplainsResponse> getComplainsList();

  @POST('${ServiceConstants.complains}')
  Future<ComplainsData> complainRequest(
    @Body() FormData formData,
  );

  @POST('${ServiceConstants.inquiries}')
  Future<InquiriesResponse> inquiriesRequest(
      @Body() Map<String, dynamic> requestData);

  @GET('${ServiceConstants.branches}')
  Future<OurBranchesResponse> getOurBranchesList();

  @POST('${ServiceConstants.sessions}')
  Future<UserLoginResponse> login(@Query('member_ship_no') String memberShipNo);

  @GET('${ServiceConstants.order_products}')
  Future<ProductResponse> getOrderProduct();

  @GET('${ServiceConstants.refer_earnings}')
  Future<EarningResponse> getReferEarning();

  @POST('${ServiceConstants.save_user_devise}')
  Future<SaveUserDeviseResponse> saveUserDevise(
      @Body() NotificationRequest notificationRequest);

  @DELETE('${ServiceConstants.sessions}/{id}')
  Future<ProductData> logout(
      @Path("id") String id, @Query('devise_id') String devise_id);
}
