import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/model/complains_model.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class ComplainListItem extends StatefulWidget {
  ComplainsData? model;

  ComplainListItem({this.model});

  @override
  _ComplainListItemState createState() => _ComplainListItemState();
}

class _ComplainListItemState extends State<ComplainListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Utils.width(context, 10),
                  decoration: BoxDecoration(
                    color: AppColors.primary_color.withOpacity(0.36),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${"Ticket#"} ${widget.model?.id}",
                      style: Utils.mediumTextStyle(
                          fontSize: AppDimens.medium_font),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Status: ",
                        style: Utils.boldTextStyle(
                            fontSize: AppDimens.medium_font),
                      ),
                      TextSpan(
                        text: widget.model?.status,
                        style: Utils.boldTextStyle(
                            fontSize: AppDimens.medium_font,
                            color: AppColors.red),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model?.subject ?? "",
                  style:
                      Utils.boldTextStyle(fontSize: AppDimens.extra_large_font),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.model?.date ?? "",
                  style: Utils.boldTextStyle(
                      fontSize: AppDimens.medium_font,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
