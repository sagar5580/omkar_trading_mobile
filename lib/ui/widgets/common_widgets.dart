import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/service_constants.dart';

Widget networkImage(String imageUrl) => Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primary_color,
              blurRadius: 5.0,
            ),
          ],
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
              color: AppColors.primary_color, width: 3) // inner circle color
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(300.0)),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: ServiceConstants.productionURL + imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
