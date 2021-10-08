import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/service_constants.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class ImageSlider extends StatefulWidget {
  List<String>? imageUrl;

  ImageSlider(this.imageUrl);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.width(context, 50),
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imageUrl!.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index % (widget.imageUrl!.length);
              });
            },
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: ServiceConstants.productionURL + widget.imageUrl![index],
                height: 100.0,
                width: 100.0,
                fit: BoxFit.fitWidth,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
                children: List.generate(widget.imageUrl!.length, (i) {
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
    );
  }
}
