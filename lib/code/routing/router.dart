import 'package:flutter/material.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/ui/screens/complain/complain_screen.dart';
import 'package:omkar_trading/ui/screens/contactus/contactus_screen.dart';
import 'package:omkar_trading/ui/screens/home/home_screen.dart';
import 'package:omkar_trading/ui/screens/membership/membership_screen.dart';
import 'package:omkar_trading/ui/screens/product_about/product_about_screen.dart';
import 'package:omkar_trading/ui/screens/profile/profile_screen.dart';
import 'package:omkar_trading/ui/screens/splash/splash_screen.dart';
import 'package:omkar_trading/ui/screens/testimonials/testimonials_screen.dart';
import 'package:omkar_trading/ui/screens/dashboard/dashboard_screen.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SplashScreen:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: settings);
      case Routes.Dashboard:
        return MaterialPageRoute(
            builder: (context) => DashboardScreen(), settings: settings);
      case Routes.HomeScreen:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(), settings: settings);
      case Routes.TestimonialsScreen:
        return MaterialPageRoute(
            builder: (context) => TestimonialsScreen(), settings: settings);
      case Routes.ComplainScreen:
        return MaterialPageRoute(
            builder: (context) => ComplainScreen(), settings: settings);
      case Routes.ContactusScreen:
        return MaterialPageRoute(
            builder: (context) => ContactusScreen(), settings: settings);
      case Routes.ProductAboutScreen:
        return MaterialPageRoute(
            builder: (context) => ProductAboutScreen(
                  productData: (settings.arguments as Map)["product_list"]
                      as ProductData,
                ),
            settings: settings);
      case Routes.ProfileScreen:
        return MaterialPageRoute(
            builder: (context) => ProfileScreen(), settings: settings);
      case Routes.MembershipScreen:
        return MaterialPageRoute(
            builder: (context) => MembershipScreen(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}
