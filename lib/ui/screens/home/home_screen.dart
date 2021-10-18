import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/dashboard/home_tab_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/app_bar.dart';
import 'package:omkar_trading/ui/widgets/filtter_widget.dart';
import 'package:omkar_trading/ui/widgets/list_item_widget/product_list_item.dart';
import 'package:omkar_trading/ui/widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeTabViewModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeTabViewModel>(onModelReady: (model) async {
      this.model = model;
      await model.getAllData();
    }, builder: (context, model, child) {
      return Scaffold(
        backgroundColor: AppColors.secondary_color,
        body: SafeArea(child: mainLayout()),
      );
    });
  }

  mainLayout() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: [
          CommonAppBar(
            title: AppString.omkar_trading,
            rightIcon: ImageAssets.ic_group,
            textValue: "",
            onPressed: () {
              if (Preferences.getBool(PreferenceKeys.isLogin, false)) {
                Navigator.pushNamed(context, Routes.ProfileScreen);
              } else {
                Navigator.pushNamed(context, Routes.MembershipScreen);
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: SearchTextField(
                    controller: model?.searchController,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    hintText: AppString.search,
                    topContentPadding: 10,
                    leftContentPadding: 10,
                    rightContentPadding: 10,
                    onChanged: (value) {
                      model?.onSearchTextChanged(value);
                    }),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FilterWidget();
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5, right: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primary_color,
                  ),
                  child: Image.asset(
                    ImageAssets.ic_filter,
                    height: 13,
                    width: 13,
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: model?.isLoading == false
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary_color,
                    ),
                  )
                : model?.searchProductList!.length == 0
                    ? Center(
                        child: Text(
                          "No Data Found",
                          style: Utils.boldTextStyle(
                              fontSize: AppDimens.large_font),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: model!.getAllData,
                        child: IntrinsicGridView.vertical(
                            padding: EdgeInsets.only(top: 16, bottom: 12),
                            verticalSpace: 10,
                            horizontalSpace: 10,
                            children: [
                              for (var product
                                  in model?.searchProductList ?? [])
                                _buildWidget(product),
                            ]),
                      ),
          ), // IntrinsicGridView.vertical
        ],
      ),
    );
  }

  Widget _buildWidget(ProductData product) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.primary_color.withOpacity(0.20),
                blurRadius: 10.0,
                spreadRadius: 1.0),
          ],
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.ProductAboutScreen,
              arguments: {"product_list": product});
        },
        child: ProductListItem(
          imageUrl: product.imageUrl?.length == 0 ? "" : product.imageUrl?[0],
          name: product.name,
          price: product.price.toString(),
          description: product.description,
        ),
      ),
    );
  }
}
