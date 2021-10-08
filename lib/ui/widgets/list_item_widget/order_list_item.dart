import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/service_constants.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class MyOrderListItem extends StatefulWidget {
  ProductData? model;

  MyOrderListItem({this.model});

  @override
  _MyOrderListItemState createState() => _MyOrderListItemState();
}

class _MyOrderListItemState extends State<MyOrderListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: Utils.width(context, 15),
            width: Utils.width(context, 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: CachedNetworkImage(
                imageUrl:
                    ServiceConstants.productionURL + widget.model!.imageUrl![0],
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model?.name ?? "",
                  style: Utils.boldTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimens.medium_font),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.model?.description ?? "",
                  style: Utils.regularTextStyle(
                    fontSize: AppDimens.default_font,
                    color: AppColors.light_gray,
                  ),
                ),
                Text(
                  widget.model?.price ?? "",
                  style: Utils.boldTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimens.medium_font),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
