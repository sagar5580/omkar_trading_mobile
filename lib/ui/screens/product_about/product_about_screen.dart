import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/product_about/product_about_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/app_bar.dart';
import 'package:omkar_trading/ui/widgets/common_widgets.dart';
import 'package:omkar_trading/ui/widgets/image_slider.dart';
import 'package:omkar_trading/ui/widgets/rating_bar.dart';

class ProductAboutScreen extends StatefulWidget {
  ProductData? productData;

  ProductAboutScreen({this.productData});

  @override
  _ProductAboutScreenState createState() => _ProductAboutScreenState();
}

class _ProductAboutScreenState extends State<ProductAboutScreen> {
  ProductAboutViewModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductAboutViewModel>(onModelReady: (model) {
      this.model = model;
      model.id = widget.productData?.id.toString();
      model.getAllData();
    }, builder: (context, model, child) {
      return Scaffold(
        backgroundColor: AppColors.secondary_color,
        body: SafeArea(
          child: mainLayout(),
        ),
      );
    });
  }

  mainLayout() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          CommonAppBar(
            title: "",
            rightIcon: ImageAssets.ic_group,
            textValue: "",
            onPressed: () {
              if (Preferences.getBool(PreferenceKeys.isLogin, false)) {
                Navigator.pushNamed(context, Routes.ProfileScreen);
              } else {
                Navigator.pushReplacementNamed(
                    context, Routes.MembershipScreen);
              }
            },
          ),
          model?.isLoading == false
              ? Container(
                  height: Utils.height(context, 100),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary_color,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: Utils.height(context, 53),
                      color: AppColors.secondary_color,
                      child: ImageSlider(model?.productData),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary_color.withOpacity(0.50),
                            blurRadius: 20.0,
                          )
                        ],
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    model?.productData?.name ?? "",
                                    style: Utils.boldTextStyle(
                                        fontSize: AppDimens.extra_large_font,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     RatingBarWidget(
                                //       itemSize: 20.0,
                                //       rating: 3.0,
                                //     ),
                                //     SizedBox(
                                //       height: 5,
                                //     ),
                                //     Text(
                                //       "(235 total)",
                                //       style: Utils.regularTextStyle(
                                //         color: AppColors.gray,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                            // Text(
                            //   "Color: Black",
                            //   style:
                            //       Utils.regularTextStyle(color: AppColors.gray),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "₹ ${model?.productData?.price.toString() ?? ""}",
                              style: Utils.boldTextStyle(
                                  fontSize: AppDimens.extra_large_font,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            descriptionWidget(),
                            SizedBox(
                              height: 15,
                            ),
                            reviewWidget(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  bool select = false;
  bool selectReview = false;

  descriptionWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bright_gray,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  select = !select;
                });
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        AppString.product_description,
                        style: Utils.boldTextStyle(
                            fontSize: AppDimens.large_font,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                    ),
                    Icon(
                      select
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 50,
                      color: AppColors.gray,
                    )
                  ],
                ),
              ),
            ),
            AnimatedSizeAndFade(
                child: select == true
                    ? Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          model?.productData?.description ?? "",
                          style: Utils.regularTextStyle(
                              fontSize: AppDimens.large_font,
                              color: AppColors.black),
                        ),
                      )
                    : Container())
          ],
        ),
      ),
    );
  }

  reviewWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bright_gray,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectReview = !selectReview;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      AppString.customer_review,
                      style: Utils.boldTextStyle(
                          fontSize: AppDimens.large_font,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                  ),
                  Icon(
                    selectReview
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 50,
                    color: AppColors.gray,
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model?.productData!.testimonials!.length,
              itemBuilder: (context, index) {
                return AnimatedSizeAndFade(
                  child: selectReview == true
                      ? Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    networkImage(model?.productData!
                                            .testimonials?[index].imageUrl ??
                                        ""),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            model
                                                    ?.productData!
                                                    .testimonials?[index]
                                                    .name ??
                                                "",
                                            style: Utils.boldTextStyle(
                                                color: AppColors.black,
                                                fontSize: AppDimens.large_font),
                                          ),
                                          RatingBarWidget(
                                            itemSize: 15.0,
                                            rating: model?.productData!
                                                .testimonials?[index].rate
                                                ?.toDouble(),
                                          ),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Text(
                                      model?.productData!.testimonials?[index]
                                              .message ??
                                          "",
                                      style: Utils.boldTextStyle(
                                          height: 1.3,
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppDimens.medium_font)),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
