import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/dashboard/complain_dialog_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/message_text_field.dart';
import 'package:omkar_trading/ui/widgets/submit_button.dart';

class ComplainDialog extends StatefulWidget {
  const ComplainDialog({Key? key}) : super(key: key);

  @override
  _ComplainDialogState createState() => _ComplainDialogState();
}

class _ComplainDialogState extends State<ComplainDialog> {
  ComplainsDialogViewModel? model;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    model?.messageController.clear();
    model?.reasonController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: BaseView<ComplainsDialogViewModel>(
        onModelReady: (model) async {
          this.model = model;
        },
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          "New Complain",
                          style: Utils.boldTextStyleHeader(
                              fontSize: AppDimens.extra_large_font),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            model.imageFileList.clear();
                            model.imageList.clear();
                          },
                          child: Image.asset(
                            ImageAssets.ic_close,
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Picture of ther problem",
                      style:
                          Utils.boldTextStyle(fontSize: AppDimens.medium_font),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: Utils.width(context, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addButtonWidget(),
                          SizedBox(
                            width: 15,
                          ),
                          model.imageFileList.length == 0
                              ? Container()
                              : Expanded(
                                  child: Container(
                                    height: Utils.width(context, 15),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: model.imageFileList.length,
                                      itemBuilder: (context, index) {
                                        return imageListItem(
                                            model.imageFileList[index], index);
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppString.reason,
                      style: Utils.boldTextStyle(
                          fontSize: AppDimens.medium_font,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    MessageTextField(
                      hintText: AppString.write_your_message,
                      controller: model.messageController,
                      title: AppString.message,
                      textInputType: TextInputType.text,
                      validator: (value) => Utils.validateEmptyText(
                          context, value, AppString.please_enter_message),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        model.complainRequest(context);
                      },
                      child: SubmitButton(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  textFormField() {
    return Center(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: model?.reasonController,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) => Utils.validateEmptyText(
            context, value, AppString.please_enter_reason),
        style: Utils.boldTextStyle(
            color: AppColors.black,
            fontSize: AppDimens.medium_font,
            fontWeight: FontWeight.w500),
        maxLines: 1,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: AppString.reason,
          hintStyle: Utils.regularTextStyle(
            color: AppColors.gray,
            fontSize: AppDimens.default_font,
          ),
          errorStyle: Utils.regularTextStyle(color: AppColors.red),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.bright_gray, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.bright_gray, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.bright_gray, width: 1),
          ),
          filled: false,
          // fillColor: AppColors.light_grey,
          contentPadding: EdgeInsets.fromLTRB(
            10,
            10,
            5,
            15,
          ),
        ),
      ),
    );
  }

  imageListItem(File file, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          Container(
            height: Utils.width(context, 15),
            width: Utils.width(context, 15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppColors.primary_color.withOpacity(0.20),
                    blurRadius: 10.0,
                    spreadRadius: 1.0),
              ],
              color: AppColors.secondary_color,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(file),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                model!.imageFileList.removeAt(index);
              });
            },
            child: Container(
              width: Utils.width(context, 15),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray),
                      // color: AppColors.,
                      image: DecorationImage(
                          image: AssetImage(ImageAssets.ic_close)),
                      shape: BoxShape.circle),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  addButtonWidget() {
    return InkWell(
      onTap: () {
        model!.imagePick();
      },
      child: Container(
        height: Utils.width(context, 15),
        width: Utils.width(context, 15),
        decoration: BoxDecoration(
            color: AppColors.secondary_color,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: AppColors.gray, width: 2.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.ic_add1,
              height: 30,
              width: 30,
              color: AppColors.gray,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              AppString.add,
              style: Utils.boldTextStyle(
                  fontSize: AppDimens.medium_font, color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
