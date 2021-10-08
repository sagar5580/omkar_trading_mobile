import 'package:flutter/material.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/product_earning_model.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class MyProfileViewModel extends BaseModel {
  List<ProductData>? getOrderProductList = [];
  List<EarningData>? getEarningDataList = [];

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await getOrderProduct();
    await getEarning();
    state = ViewState.Idle;
  }

  Future<void> getOrderProduct() async {
    try {
      ProductResponse productResponse =
          await apiRepository.getOrderProductList();
      getOrderProductList = productResponse.data;
    } catch (error) {
      print('getOrderProduct: $error');
    }
  }

  Future<void> getEarning() async {
    try {
      EarningResponse productEarningModel =
          await apiRepository.getReferEarningList();
      getEarningDataList = productEarningModel.data;
    } catch (error) {
      print('getEarning: $error');
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      apiRepository.userLogout(
          Preferences.getInt(
            PreferenceKeys.user_id,
          ).toString(),
          Preferences.getString(
            PreferenceKeys.deviceId,
          ).toString());
      Preferences.remove(PreferenceKeys.user_id);
      Preferences.remove(PreferenceKeys.isLogin);
      Preferences.remove(PreferenceKeys.name);
      Preferences.remove(PreferenceKeys.fcmToken);
      Preferences.remove(PreferenceKeys.deviceId);
      Preferences.remove(PreferenceKeys.refer_amount);

      Navigator.pushNamedAndRemoveUntil(
          context, Routes.MembershipScreen, ModalRoute.withName("/"));
    } catch (error) {
      print('logout: $error');
    }
  }
}
