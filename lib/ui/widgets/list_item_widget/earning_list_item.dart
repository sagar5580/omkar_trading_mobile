import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/model/product_earning_model.dart';

class EarningListItem extends StatefulWidget {
  EarningData? model;

  EarningListItem({this.model});

  @override
  _EarningListItemState createState() => _EarningListItemState();
}

class _EarningListItemState extends State<EarningListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ref: ${widget.model?.refer?.name ?? ""}",
                      style: Utils.boldTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimens.medium_font),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "ID: ${widget.model?.refer?.membership_no ?? ""}",
                      style: Utils.boldTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppDimens.default_font,
                          color: AppColors.light_gray),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product: ${widget.model?.product?.name ?? ""}",
                      style: Utils.boldTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimens.medium_font),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "₹ ${widget.model?.product?.price.toString() ?? ""}",
                      style: Utils.boldTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimens.large_font),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹ ${widget.model!.referAmount.toString()} /-",
                      style: Utils.boldTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimens.medium_font,
                          color: AppColors.green),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
