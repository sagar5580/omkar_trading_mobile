import 'package:get_it/get_it.dart';
import 'package:omkar_trading/code/api_service/api_repository.dart';
import 'package:omkar_trading/code/utils/navigation_service.dart';
import 'package:omkar_trading/code/view_model/dashboard/complain_dialog_view_model.dart';
import 'package:omkar_trading/code/view_model/dashboard/complains_tab_view_model.dart';
import 'package:omkar_trading/code/view_model/dashboard/contactus_tab_view_model.dart';
import 'package:omkar_trading/code/view_model/dashboard/home_tab_view_model.dart';
import 'package:omkar_trading/code/view_model/dashboard/testimonials_view_model.dart';
import 'package:omkar_trading/code/view_model/membership/membership_view_model.dart';
import 'package:omkar_trading/code/view_model/my_profile/my_profile_view_model.dart';
import 'package:omkar_trading/code/view_model/network_view_model.dart';
import 'package:omkar_trading/code/view_model/product_about/product_about_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<APIRepository>(APIRepository());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => NetworkViewModel());
  locator.registerLazySingleton(() => HomeTabViewModel());
  locator.registerLazySingleton(() => ProductAboutViewModel());
  locator.registerLazySingleton(() => TestimonialsTabViewModel());
  locator.registerLazySingleton(() => ComplainsTabViewModel());
  locator.registerLazySingleton(() => ComplainsDialogViewModel());
  locator.registerLazySingleton(() => ContactusTabViewModel());
  locator.registerLazySingleton(() => MembershipViewModel());
  locator.registerLazySingleton(() => MyProfileViewModel());
}
