import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class CommonAppBar extends StatefulWidget {
  final String? title;
  final String? rightIcon;
  VoidCallback? onPressed;
  String? textValue;

  CommonAppBar({this.title, this.rightIcon, this.onPressed, this.textValue});

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            ImageAssets.ic_arrow_back,
            height: 25,
            width: 25,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              widget.title!,
              style: Utils.boldTextStyleHeader(fontSize: 25.0),
            ),
          ),
        ),
        /* widget.textValue != ""
            ? Container(
                margin: EdgeInsets.only(right: 10),
                height: Utils.width(context, 8.0),
                width: Utils.width(context, 20.0),
                decoration: BoxDecoration(
                  color: AppColors.primary_color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.textValue ?? "",
                    maxLines: 1,
                    style: Utils.mediumTextStyle(),
                  ),
                ),
              )
            :*/
        IconButton(
          onPressed: widget.onPressed!,
          icon: Image.asset(
            widget.rightIcon!,
            height: 35,
            width: 35,
          ),
        ),
      ],
    );
  }
}
