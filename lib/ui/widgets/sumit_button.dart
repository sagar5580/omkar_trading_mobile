import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Utils.width(context, 25),
        height: Utils.width(context, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            color: AppColors.primary_color),
        child: Center(
          child: Text(
            "Submit",
            style: Utils.regularTextStyle(fontSize: AppDimens.medium_font),
          ),
        ),
      ),
    );
  }
}
