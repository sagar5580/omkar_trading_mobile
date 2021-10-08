import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/product_earning_model.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/my_profile/my_profile_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/app_bar.dart';
import 'package:omkar_trading/ui/widgets/list_item_widget/earning_list_item.dart';
import 'package:omkar_trading/ui/widgets/list_item_widget/order_list_item.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  MyProfileViewModel? model;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<MyProfileViewModel>(onModelReady: (model) {
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
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          CommonAppBar(
            title: AppString.my_profile,
            textValue: Preferences.getInt(
              PreferenceKeys.refer_amount,
            ).toString(),
            rightIcon: ImageAssets.ic_logout,
            onPressed: () {
              model?.logout(context);
            },
          ),
          profileWidget(),
          customTabView(),
          Expanded(
              child: PageView.builder(
                  onPageChanged: (int indexs) {
                    setState(() {
                      index = indexs;
                    });
                  },
                  itemCount: 2,
                  itemBuilder: (context, i) {
                    return index == 0 ? orderWidget() : earningWidget();
                  }))
        ],
      ),
    );
  }

  profileWidget() {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              ImageAssets.ic_profile,
              width: Utils.width(context, 10),
              height: Utils.width(context, 10),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Preferences.getString(PreferenceKeys.name).toString(),
                      style: Utils.boldTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimens.medium_font),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "ID: ${Preferences.getInt(
                        PreferenceKeys.user_id,
                      )}",
                      style: Utils.regularTextStyle(),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              height: Utils.width(context, 8.0),
              width: Utils.width(context, 20.0),
              decoration: BoxDecoration(
                color: AppColors.primary_color,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Center(
                child: Text(
                  Preferences.getInt(
                    PreferenceKeys.refer_amount,
                  ).toString(),
                  maxLines: 1,
                  style: Utils.mediumTextStyle(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  customTabView() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          height: Utils.width(context, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(
                      () {
                        index = 0;
                      },
                    );
                  },
                  child: Container(
                    height: Utils.width(context, 10),
                    decoration: BoxDecoration(
                      color:
                          index == 0 ? AppColors.black : AppColors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(19),
                        topLeft: Radius.circular(19),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppString.my_orders,
                        style: Utils.mediumTextStyle(
                          color: index == 0 ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    height: Utils.width(context, 10),
                    decoration: BoxDecoration(
                      color:
                          index == 1 ? AppColors.black : AppColors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(19),
                        topRight: Radius.circular(19),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppString.my_earnings,
                        style: Utils.mediumTextStyle(
                          color: index == 1 ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  orderWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          model!.getOrderProductList!.length == 0
              ? Container()
              : Text(
                  "${model!.getOrderProductList!.length.toString()} ${"Items"}"
                  "",
                  style: Utils.boldTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimens.medium_font),
                ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: model!.getOrderProductList!.length == 0
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary_color,
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: model!.getOrderProductList!.length,
                    itemBuilder: (context, index) {
                      ProductData models = model!.getOrderProductList![index];
                      return MyOrderListItem(
                        model: models,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  earningWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: model!.getEarningDataList!.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary_color,
                  ),
                )
              : ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model!.getEarningDataList!.length,
                  itemBuilder: (context, index) {
                    EarningData models = model!.getEarningDataList![index];
                    return EarningListItem(
                      model: models,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
