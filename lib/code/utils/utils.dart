import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/app_fonts.dart';
import 'package:omkar_trading/code/utils/toasts.dart';

class Utils {
  static String? validateEmptyText(
      BuildContext context, String? value, String error) {
    if (value == null || value.isEmpty) {
      return error;
    } else {
      return null;
    }
  }

  static String? validateMobileNo(
      BuildContext context, String? value, String error) {
    {
      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(patttern);
      if (value!.length == 0) {
        return 'Please enter mobile number';
      } else if (!regExp.hasMatch(value)) {
        return 'Please enter valid mobile number';
      }
      return null;
    }
  }

  static emailValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppString.please_enter_email;
    } else if (!EmailValidator.validate(value.trim())) {
      return AppString.invalid_email;
    } else {
      return null;
    }
  }

  static double height(BuildContext context, double value) {
    MediaQueryData queryData = MediaQuery.of(context);
    return queryData.size.height / 100.0 * value;
  }

  static double width(BuildContext context, double value) {
    MediaQueryData queryData = MediaQuery.of(context);
    return queryData.size.width / 100.0 * value;
  }

  static TextStyle regularTextStyle(
          {var fontSize = AppDimens.default_font,
          color = AppColors.black,
          height = 1.0}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        height: height,
        fontFamily: AppFonts.sora,
        fontWeight: FontWeight.w400,
      );

  static mediumTextStyle(
          {fontSize = AppDimens.default_font,
          color = AppColors.black,
          height = 1.0}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: AppFonts.sora,
        height: height,
        fontWeight: FontWeight.w500,
      );

  static boldTextStyle(
          {fontSize = AppDimens.default_font,
          color = AppColors.black,
          height = 1.0,
          fontWeight = FontWeight.w700}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: AppFonts.sora,
        height: height,
        fontWeight: fontWeight,
      );

  static boldTextStyleHeader(
          {fontSize = AppDimens.default_font,
          color = AppColors.black,
          height = 1.0,
          fontWeight = FontWeight.w700}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: AppFonts.crimson,
        height: height,
        fontWeight: fontWeight,
      );

  static handleError(DioError error) {
    String _errorMessage = "";
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.other:
        _errorMessage = "Connection failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        final res = error.response;
        print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
        if (res.data['message'] is String) _errorMessage = res.data['message'];
        // else
        //   _errorMessage =
        //       AppLocalizations.instance!.translate('something_went_wrong');
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
      default:
        _errorMessage = "Server Error , Please try again later";
        break;
    }
    Toasts.showToast(_errorMessage);
  }
}
