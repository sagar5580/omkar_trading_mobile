import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/service_constants.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/ui/widgets/rating_bar.dart';

class ProductListItem extends StatelessWidget {
  String? imageUrl;
  String? description;
  String? name;
  String? price;

  ProductListItem({this.name, this.imageUrl, this.description, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: CachedNetworkImage(
                imageUrl: ServiceConstants.productionURL + imageUrl!,
                height: 100.0,
                width: double.infinity,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            name!,
            style: Utils.boldTextStyle(
                color: AppColors.black, fontSize: AppDimens.large_font),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "₹ ${price ?? ""}",
            style: Utils.boldTextStyle(
                color: AppColors.black, fontSize: AppDimens.large_font),
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // RatingBarWidget(
          //   itemSize: 20.0,
          //   rating: 3.0,
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          // Text(
          //   "(235 total)",
          //   style: Utils.regularTextStyle(fontSize: AppDimens.default_font),
          // ),
        ],
      ),
    );
  }
}
