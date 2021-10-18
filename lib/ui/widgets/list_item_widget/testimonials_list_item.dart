import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/testimonials_model.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/ui/widgets/common_widgets.dart';
import 'package:omkar_trading/ui/widgets/rating_bar.dart';

class TestimonialsListItem extends StatefulWidget {
  TestimonialsData? testimonialsData;

  TestimonialsListItem({this.testimonialsData});

  @override
  _TestimonialsListItemState createState() => _TestimonialsListItemState();
}

class _TestimonialsListItemState extends State<TestimonialsListItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  networkImage(widget.testimonialsData?.imageUrl ?? ""),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.testimonialsData?.name ?? "",
                              style: Utils.boldTextStyle(
                                  color: AppColors.black,
                                  fontSize: AppDimens.large_font),
                            ),
                            RatingBarWidget(
                              itemSize: 15.0,
                              rating: widget.testimonialsData?.rate
                                  ?.toDouble(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Product: ${widget.testimonialsData?.productData?.name ?? ""}",
                          style: Utils.boldTextStyle(
                              color: AppColors.gray,
                              fontSize: AppDimens.medium_font),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(widget.testimonialsData?.message ?? "",
                              style: Utils.boldTextStyle(
                                  height: 1.3,
                                  color: AppColors.gray,
                                  fontSize: AppDimens.large_font)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Image.asset(
            ImageAssets.ic_double,
            height: 80,
            width: 80,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
