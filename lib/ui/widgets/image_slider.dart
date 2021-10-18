import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/service_constants.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class ImageSlider extends StatefulWidget {
  ProductData? productData;

  ImageSlider(this.productData);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Utils.height(context, 40.0),
          child: Stack(
            children: [
              PageView.builder(
                itemCount: widget.productData?.imageUrl!.length,
                controller: pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex =
                        index % (widget.productData!.imageUrl!.length);
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.FullScreenImage,
                          arguments: widget.productData!.imageUrl![index]);
                    },
                    child: CachedNetworkImage(
                      imageUrl: ServiceConstants.productionURL +
                          widget.productData!.imageUrl![index],
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.fitWidth,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                          ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        widget.productData!.imageUrl!.length, (i) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == i
                                ? AppColors.black
                                : AppColors.gray),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.productData?.imageUrl?.length == null
            ? Container()
            : Container(
          height: Utils.height(context, 13),
          width: double.infinity,
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.productData?.imageUrl!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      pageController.animateToPage(
                          index, duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20,bottom: 10),
                    width: Utils.height(context, 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.primary_color,
                            width: currentIndex == index ? 2 : 0)),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        imageUrl: ServiceConstants.productionURL +
                            widget.productData!.imageUrl![index],
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                            ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
