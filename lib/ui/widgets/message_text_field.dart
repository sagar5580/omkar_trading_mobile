import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class MessageTextField extends StatefulWidget {
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
  String? title;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  TextInputType? textInputType;

  MessageTextField(
      {Key? key,
      this.title,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.autofocus = false,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.maxLines = 10,
      this.onPressed,
      this.bottomContentPadding = 15,
      this.leftContentPadding = 15,
      this.rightContentPadding = 5,
      this.topContentPadding = 18,
      this.focusNode,
      this.hintText = "",
      this.textAlign = TextAlign.start,
      this.textInputType,
      this.onChanged})
      : super(key: key);

  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            widget.title!,
            style: Utils.boldTextStyle(
                fontSize: AppDimens.medium_font, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          child: TextFormField(
            autofocus: widget.autofocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.textInputType,
            textAlignVertical: TextAlignVertical.center,
            style: Utils.boldTextStyle(
                color: AppColors.black,
                fontSize: AppDimens.medium_font,
                fontWeight: FontWeight.w500),
            maxLines: null,
            textInputAction: widget.textInputAction,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              hintText: widget.hintText,
              hintStyle: Utils.regularTextStyle(
                color: AppColors.gray,
                fontSize: AppDimens.default_font,
              ),
              errorStyle: Utils.regularTextStyle(color: AppColors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.bright_gray, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.bright_gray, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.bright_gray, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(
                widget.leftContentPadding,
                widget.topContentPadding,
                widget.rightContentPadding,
                widget.bottomContentPadding,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
