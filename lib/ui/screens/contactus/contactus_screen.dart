import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/our_branche_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/dashboard/contactus_tab_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/app_bar.dart';
import 'package:omkar_trading/ui/widgets/list_item_widget/our_brache_list_item.dart';
import 'package:omkar_trading/ui/widgets/message_text_field.dart';
import 'package:omkar_trading/ui/widgets/sumit_button.dart';
import 'package:omkar_trading/ui/widgets/text_field_widget.dart';

class ContactusScreen extends StatefulWidget {
  const ContactusScreen({Key? key}) : super(key: key);

  @override
  _ContactusScreenState createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  ContactusTabViewModel? model;

  bool toggle = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    model?.nameController.clear();
    model?.emailController.clear();
    model?.phoneController.clear();
    model?.messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ContactusTabViewModel>(onModelReady: (model) {
      this.model = model;
      model.getAllData();
    }, builder: (context, model, child) {
      return Scaffold(
        backgroundColor: AppColors.secondary_color,
        body: SafeArea(child: mainLayout()),
      );
    });
  }

  mainLayout() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Form(
        key: model?.formKey,
        child: Column(
          children: [
            CommonAppBar(
              title: AppString.contactus,
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
            ), //
            TextFieldWidget(
              hintText: AppString.your_name,
              controller: model?.nameController,
              bgColor: AppColors.white,
              brColor: AppColors.bright_gray,
              title: AppString.your_name,
              textInputType: TextInputType.text,
              prefixIcon: ImageAssets.ic_person,
              validator: (value) => Utils.validateEmptyText(
                  context, value, AppString.please_enter_name),
            ),
            TextFieldWidget(
              hintText: AppString.email,
              controller: model?.emailController,
              bgColor: AppColors.primary_color.withOpacity(0.17),
              brColor: AppColors.primary_color,
              title: AppString.email,
              textInputType: TextInputType.emailAddress,
              prefixIcon: ImageAssets.ic_email,
              validator: (value) => Utils.emailValidation(value, context),
            ),
            TextFieldWidget(
              hintText: AppString.phone,
              controller: model?.phoneController,
              bgColor: AppColors.white,
              onChanged: (value) {
                if (value.length >= 10) {
                  setState(() {
                    model!.phoneController.text = value;
                  });
                }
              },
              brColor: AppColors.bright_gray,
              title: AppString.phone,
              textInputType: TextInputType.number,
              prefixIcon: ImageAssets.ic_call,
              validator: (value) => Utils.validateEmptyText(
                  context, value, AppString.please_enter_phone),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
              child: MessageTextField(
                hintText: AppString.write_your_message,
                controller: model?.messageController,
                title: AppString.message,
                textInputType: TextInputType.text,
                validator: (value) => Utils.validateEmptyText(
                    context, value, AppString.please_enter_message),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  model?.inquiriesRequest(context);
                },
                child: SubmitButton()),
            Container(
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 5),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.our_branches,
                            style: Utils.boldTextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: AppDimens.medium_font),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                toggle = !toggle;
                              });
                            },
                            child: Icon(
                              toggle
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              size: 50,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedSizeAndFade(
                      child: toggle == true
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: model?.getOurBranchesList?.length,
                              itemBuilder: (context, index) {
                                OurBranchesData models =
                                    model!.getOurBranchesList![index];
                                return OurBranchesListItem(model: models);
                              },
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
