import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/app_dimens.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/dashboard/home_tab_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/submit_button.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  double _sliderDiscreteValue = 20000;
  HomeTabViewModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sliderDiscreteValue =
        Preferences.getInt(PreferenceKeys.select_value).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeTabViewModel>(onModelReady: (model) {
      this.model = model;
    }, builder: (context, model, child) {
      return Dialog(
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 20),
          height: Utils.width(context, 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  AppString.select_product_rang,
                  style: Utils.boldTextStyle(
                      color: AppColors.black, fontSize: AppDimens.large_font),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "0",
                          style: Utils.boldTextStyle(
                              color: AppColors.black,
                              fontSize: AppDimens.default_font),
                        ),
                        Text(
                          "1,00,000",
                          style: Utils.boldTextStyle(
                              color: AppColors.black,
                              fontSize: AppDimens.default_font),
                        )
                      ],
                    ),
                  ),
                  Slider(
                    value: _sliderDiscreteValue,
                    min: 0,
                    max: 100000,
                    divisions: 100,
                    label: _sliderDiscreteValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _sliderDiscreteValue = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Preferences.setInt(PreferenceKeys.select_value,
                          _sliderDiscreteValue.toInt());
                      model.getFilterProduct(
                          context, 0, _sliderDiscreteValue.toInt());
                    },
                    child: SubmitButton(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      model.getProduct();
                    },
                    child: SubmitButton(
                      label: 'Reset',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
