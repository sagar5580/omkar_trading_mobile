import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/shared_preference/preference_key_constants.dart';
import 'package:omkar_trading/code/shared_preference/preference_manager.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/dashboard/dashboard_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/screens/complain/complain_screen.dart';
import 'package:omkar_trading/ui/screens/contactus/contactus_screen.dart';
import 'package:omkar_trading/ui/screens/home/home_screen.dart';
import 'package:omkar_trading/ui/screens/testimonials/testimonials_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  DashboardViewModel? model;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    TestimonialsScreen(),
    ComplainScreen(),
    ContactusScreen(),
  ];
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(onModelReady: (model) {
      this.model = model;
      if (Preferences.getBool(PreferenceKeys.isFirstTime, false)) {
      } else {
        model.getAllData();
      }
    }, builder: (context, model, child) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: navigationBarItem(
                        ImageAssets.ic_home, AppString.home, 0),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: navigationBarItem(
                        ImageAssets.ic_testimonials, AppString.testimonials, 1),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: navigationBarItem(
                        ImageAssets.ic_complain, AppString.complain, 2),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    child: navigationBarItem(
                        ImageAssets.ic_contactus, AppString.contactus, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  navigationBarItem(String icon, String name, int index) {
    return AnimatedContainer(
      width: _selectedIndex == index ? 150.0 : 50.0,
      height: _selectedIndex == index ? 40.0 : 40.0,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
          color: _selectedIndex == index
              ? AppColors.primary_color.withOpacity(0.20)
              : AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              icon,
              height: 25,
              width: 25,
              color: _selectedIndex == index
                  ? AppColors.bar_text
                  : AppColors.black.withOpacity(0.70),
            ),
            _selectedIndex == index
                ? Flexible(
                    child: Text(
                      name,
                      maxLines: 1,
                      style: Utils.regularTextStyle(color: AppColors.bar_text),
                    ),
                  )
                : Container(),
            SizedBox(
              width: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
