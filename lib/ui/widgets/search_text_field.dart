import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  bool obscureText;
  bool autofocus;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction textInputAction;
  final int maxLines;
  VoidCallback? onPressed;
  double leftContentPadding;
  double topContentPadding;
  double rightContentPadding;
  double bottomContentPadding;
  FocusNode? focusNode;
  String? hintText;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;

  SearchTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.autofocus = false,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.maxLines = 1,
      this.onPressed,
      this.bottomContentPadding = 10,
      this.leftContentPadding = 5,
      this.rightContentPadding = 5,
      this.topContentPadding = 18,
      this.focusNode,
      this.hintText = "",
      this.textAlign = TextAlign.start,
      this.onChanged})
      : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
      height: 50,
      decoration: BoxDecoration(
        // border: Border.all(color: AppColors.bright_gray, width: 2),
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: TextFormField(
        autofocus: widget.autofocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        validator: widget.validator,
        textAlignVertical: TextAlignVertical.center,
        style: Utils.regularTextStyle(
          color: AppColors.black,
          fontSize: AppDimens.medium_font,
        ),
        maxLines: widget.maxLines,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Utils.regularTextStyle(
            color: AppColors.black,
            fontSize: AppDimens.large_font,
          ),
          prefixIcon: Image.asset(
            ImageAssets.ic_search,
            height: 25,
            width: 25,
          ),
          errorStyle: Utils.regularTextStyle(color: AppColors.red),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: false,
          // fillColor: AppColors.light_grey,
          contentPadding: EdgeInsets.fromLTRB(
            widget.leftContentPadding,
            widget.topContentPadding,
            widget.rightContentPadding,
            widget.bottomContentPadding,
          ),
        ),
      ),
    );
  }
}
