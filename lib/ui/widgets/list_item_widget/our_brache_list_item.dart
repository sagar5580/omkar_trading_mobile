import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/our_branche_model.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class OurBranchesListItem extends StatefulWidget {
  OurBranchesData? model;

  OurBranchesListItem({this.model});

  @override
  _OurBranchesListItemState createState() => _OurBranchesListItemState();
}

class _OurBranchesListItemState extends State<OurBranchesListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 1, right: 1, bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.gray.withOpacity(0.10),
              blurRadius: 5.0,
              spreadRadius: 1.0),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
                ImageAssets.ic_branches,
                widget.model?.name ?? "",
                Utils.boldTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimens.medium_font),
                1),
            textWidget(
                ImageAssets.ic_call,
                "Ph: ${widget.model?.contact ?? ""}",
                Utils.mediumTextStyle(
                    color: AppColors.light_gray,
                    fontSize: AppDimens.default_font),
                1),
            textWidget(
                ImageAssets.ic_location,
                widget.model?.address ?? "",
                Utils.mediumTextStyle(
                    color: AppColors.black,
                    fontSize: AppDimens.default_font,
                    height: 1.5),
                2),
            Container(
              margin: EdgeInsets.only(
                top: 5,
                left: 65,
              ),
              child: Text("City : ${widget.model?.city ?? ""}",
                  style: Utils.mediumTextStyle(
                      color: AppColors.black,
                      fontSize: AppDimens.default_font,
                      height: 1.5)),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5,
                left: 65,
              ),
              child: Text("State : ${widget.model?.state ?? ""}",
                  style: Utils.mediumTextStyle(
                      color: AppColors.black,
                      fontSize: AppDimens.default_font,
                      height: 1.5)),
            ),
          ],
        ),
      ),
    );
  }

  textWidget(String icon, String name, TextStyle style, int maxLines) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 25,
        right: 25,
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 20,
            width: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              name,
              style: style,
              maxLines: maxLines,
            ),
          )
        ],
      ),
    );
  }
}
