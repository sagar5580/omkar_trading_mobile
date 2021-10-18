import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class TextFieldWidget extends StatefulWidget {
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
  String? title;
  int? maxLength;
  Color? bgColor;
  Color? brColor;
  String? prefixIcon;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatters;

  TextFieldWidget(
      {Key? key,
      this.title,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.autofocus = false,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.maxLines = 1,
      this.onPressed,
      this.maxLength,
      this.bottomContentPadding = 5,
      this.leftContentPadding = 5,
      this.rightContentPadding = 5,
      this.topContentPadding = 15,
      this.focusNode,
      this.hintText = "",
      this.textAlign = TextAlign.start,
      this.bgColor,
      this.brColor,
      this.prefixIcon,
      this.textInputType,
      this.inputFormatters,
      this.onChanged})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            widget.title!,
            style: Utils.boldTextStyle(
                fontSize: AppDimens.medium_font, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
          child: Center(
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              autofocus: widget.autofocus,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller,
              validator: widget.validator,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: widget.textInputType,
              style: Utils.boldTextStyle(
                  color: AppColors.black,
                  fontSize: AppDimens.medium_font,
                  fontWeight: FontWeight.w500),
              maxLines: widget.maxLines,
              textInputAction: widget.textInputAction,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              maxLength: widget.maxLength,
              decoration: InputDecoration(
                fillColor: widget.bgColor!,
                counterText: "",
                filled: true,
                hintText: widget.hintText,
                hintStyle: Utils.regularTextStyle(
                  color: AppColors.gray,
                  fontSize: AppDimens.default_font,
                ),
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Image.asset(
                    widget.prefixIcon!,
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
                errorStyle: Utils.regularTextStyle(color: AppColors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: widget.brColor!, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: widget.brColor!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: widget.brColor!, width: 1),
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
        ),
      ],
    );
  }
}
