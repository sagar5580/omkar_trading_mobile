import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/user_login_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/toasts.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class MembershipViewModel extends BaseModel {
  final numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> userLogin(BuildContext context) async {
    state = ViewState.Busy;
    try {
      UserLoginResponse userLoginResponse =
          await apiRepository.userLogin(numberController.text);
      Preferences.setBool(PreferenceKeys.isLogin, true);
      Preferences.setInt(PreferenceKeys.user_id, userLoginResponse.id!);
      Preferences.setString(
          PreferenceKeys.member_ship_no, userLoginResponse.member_ship_no!);
      Preferences.setString(PreferenceKeys.name, userLoginResponse.name ?? "");
      Preferences.setInt(
          PreferenceKeys.refer_amount, userLoginResponse.refer_amount ?? 0);
      numberController.clear();
      Navigator.pushReplacementNamed(
          context, Routes.ProfileScreen);
      state = ViewState.Idle;
    } catch (error) {
      state = ViewState.Idle;
      Toasts.showToast(AppString.inValid_membership_no);
      print("userLogin ${error.toString()}");
    }
  }
}
