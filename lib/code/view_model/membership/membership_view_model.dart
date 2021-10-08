import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/notification_model.dart';
import 'package:omkar_trading/code/model/user_login_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class MembershipViewModel extends BaseModel {
  final numberController = TextEditingController();
  final firebaseMessaging = FirebaseMessaging.instance;

  String? fcmTokan;
  String? deviceId;

  Future<void> userLogin(BuildContext context) async {
    state = ViewState.Busy;
    fcmTokan = Preferences.getString(PreferenceKeys.fcmToken);
    deviceId = Preferences.getString(PreferenceKeys.deviceId);

    try {
      UserLoginResponse userLoginResponse =
          await apiRepository.userLogin(numberController.text);
      Preferences.setBool(PreferenceKeys.isLogin, true);
      Preferences.setInt(PreferenceKeys.user_id, userLoginResponse.id!);
      Preferences.setString(PreferenceKeys.name, userLoginResponse.name ?? "");
      Preferences.setInt(
          PreferenceKeys.refer_amount, userLoginResponse.refer_amount ?? 0);

      print("fcmToken ${Preferences.getString(
        PreferenceKeys.fcmToken,
      )}");
      print("deviceId ${Preferences.getString(
        PreferenceKeys.deviceId,
      )}");

      if (fcmTokan?.isEmpty ?? true) {
        if (deviceId?.isEmpty ?? true) {
          await getId();
        }
        await getFCMToken();
        saveUserDives();
      } else {
        saveUserDives();
      }
      numberController.clear();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.ProfileScreen, ModalRoute.withName("/"));
      state = ViewState.Idle;
    } catch (error) {
      state = ViewState.Idle;
      switch (error.runtimeType) {
        case DioError:
          Utils.handleError(error as DioError);
          break;
        default:
      }
    }
  }

  Future<void> saveUserDives() async {
    state = ViewState.Busy;
    print("fcmToken //////${Preferences.getString(
      PreferenceKeys.fcmToken,
    )}");
    print("deviceId/////// ${Preferences.getString(
      PreferenceKeys.deviceId,
    )}");
    NotificationRequest notificationRequest = NotificationRequest(
      fcm_key: Preferences.getString(PreferenceKeys.fcmToken),
      os: "A",
      devise_id: Preferences.getString(PreferenceKeys.deviceId),
      id: Preferences.getInt(PreferenceKeys.user_id).toString(),
    );
    try {
      SaveUserDeviseResponse userDeviseResponse =
          await apiRepository.notificationRequest(notificationRequest);
      print("status -> ${userDeviseResponse.status}");
    } catch (error) {
      state = ViewState.Idle;
      switch (error.runtimeType) {
        case DioError:
          Utils.handleError(error as DioError);
          break;
        default:
      }
    }
  }

  getFCMToken() async {
    final token = await firebaseMessaging.getToken();
    await Preferences.setString(PreferenceKeys.fcmToken, token.toString());
  }

  Future<String> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      Preferences.setString(
          PreferenceKeys.deviceId, androidDeviceInfo.androidId.toString());
      print("androidDeviceInfo ${androidDeviceInfo.androidId.toString()}");
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}
