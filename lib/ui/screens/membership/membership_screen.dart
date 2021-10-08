import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/membership/membership_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/sumit_button.dart';

class MembershipScreen extends StatefulWidget {
  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  MembershipViewModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<MembershipViewModel>(
      onModelReady: (model) async {
        this.model = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      ImageAssets.ic_arrow_back,
                      height: 25,
                      width: 25,
                      color: AppColors.white,
                    ),
                  ),
                  Image.asset(
                    ImageAssets.ic_logo,
                    height: 100,
                    width: 150,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      AppString.enter_membership_number,
                      style: Utils.boldTextStyleHeader(
                          fontSize: 35.0, color: AppColors.white, height: 1.2),
                    ),
                  ),
                  textField(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  textField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 10, right: 10),
          height: 60,
          decoration: BoxDecoration(
            border:
                Border.all(color: AppColors.white.withOpacity(0.20), width: 1),
            borderRadius: BorderRadius.circular(40),
            color: AppColors.white.withOpacity(0.20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: model?.numberController,
              textAlignVertical: TextAlignVertical.center,
              style: Utils.regularTextStyle(
                color: AppColors.white,
                fontSize: AppDimens.medium_font,
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: AppString.enter_membership_number_hint,
                hintStyle: Utils.regularTextStyle(
                  color: AppColors.white,
                  fontSize: AppDimens.large_font,
                ),
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Image.asset(
                    ImageAssets.ic_person,
                    height: 20.0,
                    width: 20.0,
                    color: AppColors.white,
                  ),
                ),
                errorStyle: Utils.regularTextStyle(color: AppColors.red),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: false,
                // fillColor: AppColors.light_grey,
                contentPadding: EdgeInsets.fromLTRB(
                  10,
                  10,
                  10,
                  10,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        InkWell(
            onTap: () {
              model!.userLogin(context);
            },
            child: SubmitButton()),
      ],
    );
  }
}
