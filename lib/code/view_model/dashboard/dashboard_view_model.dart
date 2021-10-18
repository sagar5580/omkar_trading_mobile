import 'dart:io';

import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/notification_model.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';
import 'package:dio/dio.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DashboardViewModel extends BaseModel {
  final firebaseMessaging = FirebaseMessaging.instance;
  String? fcmTokan;
  String? deviceId;

  Future<void> getAllData() async {
    state = ViewState.Busy;
    fcmTokan = Preferences.getString(PreferenceKeys.fcmToken);
    deviceId = Preferences.getString(PreferenceKeys.deviceId);
    if (fcmTokan?.isEmpty ?? true) {
      if (deviceId?.isEmpty ?? true) {
        await getId();
      }
      await getFCMToken();
      saveUserDives();
    } else {
      saveUserDives();
    }
    state = ViewState.Idle;
  }

  Future<void> saveUserDives() async {
    state = ViewState.Busy;
    NotificationRequest notificationRequest = NotificationRequest(
      fcm_key: Preferences.getString(PreferenceKeys.fcmToken),
      os: "A",
      devise_id: Preferences.getString(PreferenceKeys.deviceId),
    );

    try {
      SaveUserDeviseResponse userDeviseResponse =
          await apiRepository.notificationRequest(notificationRequest);
      print("success");
      Preferences.setBool(PreferenceKeys.isFirstTime, true);
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
