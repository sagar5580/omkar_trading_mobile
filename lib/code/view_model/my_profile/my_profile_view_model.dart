import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/product_earning_model.dart';
import 'package:omkar_trading/code/model/user_login_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';
import 'package:omkar_trading/code/model/order_product_model.dart';

class MyProfileViewModel extends BaseModel {
  List<OrderProductData>? getOrderProductList = [];
  List<EarningData>? getEarningDataList = [];
  UserLoginResponse? userLoginResponse;

  bool isLoading = false;
  bool isLoadingEarning = false;

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await userDetails();
    await getOrderProduct();
    await getEarning();
    state = ViewState.Idle;
  }

  Future<void> getOrderProduct() async {
    try {
      isLoading = false;
      String userId = Preferences.getInt(
        PreferenceKeys.user_id,
      ).toString();
      state = ViewState.Busy;
      OrderProductModel productResponse =
          await apiRepository.getOrderProductList(userId);
      getOrderProductList = productResponse.data;
      state = ViewState.Idle;
      isLoading = true;
    } catch (error) {
      print('getOrderProduct: $error');
    }
  }

  Future<void> getEarning() async {
    try {
      isLoadingEarning = false;
      String userId = Preferences.getInt(
        PreferenceKeys.user_id,
      ).toString();
      state = ViewState.Busy;
      EarningResponse productEarningModel =
          await apiRepository.getReferEarningList(userId);
      getEarningDataList = productEarningModel.data;
      isLoadingEarning = true;
    } catch (error) {
      print('getEarning: $error');
    }
  }

  Future<void> userDetails() async {
    state = ViewState.Busy;
    try {
      String? member_no = Preferences.getString(PreferenceKeys.member_ship_no);
      userLoginResponse = await apiRepository.userLogin(member_no!);
      state = ViewState.Idle;
    } catch (error) {
      state = ViewState.Idle;
      print("userLogin ${error.toString()}");
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      apiRepository.userLogout(Preferences.getInt(
        PreferenceKeys.user_id,
      ).toString());
      Preferences.remove(PreferenceKeys.user_id);
      Preferences.remove(PreferenceKeys.isLogin);
      Preferences.remove(PreferenceKeys.name);
      Preferences.remove(PreferenceKeys.fcmToken);
      Preferences.remove(PreferenceKeys.deviceId);
      Preferences.remove(PreferenceKeys.refer_amount);

      Navigator.pushReplacementNamed(
          context, Routes.MembershipScreen,);
    } catch (error) {
      print('logout: $error');
    }
  }
}
