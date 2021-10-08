import 'dart:io';

import 'package:omkar_trading/code/api_service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:omkar_trading/code/constants/service_constants.dart';
import 'package:omkar_trading/code/model/complains_model.dart';
import 'package:omkar_trading/code/model/inquiries_model.dart';
import 'package:omkar_trading/code/model/notification_model.dart';
import 'package:omkar_trading/code/model/our_branche_model.dart';
import 'package:omkar_trading/code/model/product_earning_model.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/model/testimonials_model.dart';
import 'package:omkar_trading/code/model/user_login_model.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';

class APIRepository {
  static Dio getDio() {
    Dio dio = new Dio();
    dio.options.headers['content-type'] = 'application/json; charset=utf-8';
    dio.options.headers["Accept"] = "application/json";
    return dio;
  }

  Future<ProductResponse> getProductList() async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.getProductList().catchError((onError) {
      throw onError;
    });
  }

  Future<ProductData> getProductShow(String id) async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.getProductShow(id).catchError((onError) {
      throw onError;
    });
  }

  Future<TestimonialsResponse> getTestimonialsList() async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.getTestimonialsList().catchError((onError) {
      throw onError;
    });
  }

  Future<ComplainsResponse> getComplainsList() async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.getComplainsList().catchError((onError) {
      throw onError;
    });
  }

  Future<ComplainsData> complainRequest(
      /*fileList, subject, message*/
      formData) async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.complainRequest(formData).catchError((onError) {
      throw onError;
    });
  }

  Future<InquiriesResponse> inquiriesRequest(
      Map<String, dynamic> requestData) async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService
        .inquiriesRequest(requestData)
        .catchError((onError) {
      throw onError;
    });
  }

  Future<OurBranchesResponse> getOurBranchesList() async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.getOurBranchesList().catchError((onError) {
      throw onError;
    });
  }

  Future<UserLoginResponse> userLogin(String member_ship_no) async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.login(member_ship_no).catchError((onError) {
      throw onError;
    });
  }

  Future<ProductData> userLogout(String id,String devise_id) async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.logout(id,devise_id).catchError((onError) {
      throw onError;
    });
  }

  Future<ProductResponse> getOrderProductList() async {
    Dio dio = getDio();
    String userId = Preferences.getInt(
      PreferenceKeys.user_id,
    ).toString();
    if ((userId != "null" && userId.isNotEmpty)) {
      dio.options.headers["user_id"] = userId;
    }
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.getOrderProduct().catchError((onError) {
      throw onError;
    });
  }

  Future<EarningResponse> getReferEarningList() async {
    Dio dio = getDio();
    String userId = Preferences.getInt(
      PreferenceKeys.user_id,
    ).toString();
    if ((userId != "null" && userId.isNotEmpty)) {
      dio.options.headers["user_id"] = userId;
    }
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService.getReferEarning().catchError((onError) {
      throw onError;
    });
  }

  Future<SaveUserDeviseResponse> notificationRequest(
      notificationRequest) async {
    Dio dio = getDio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
    final APIService _apiService =
        APIService(dio, baseUrl: ServiceConstants.baseURL);
    return await _apiService
        .saveUserDevise(notificationRequest)
        .catchError((onError) {
      throw onError;
    });
  }
}
