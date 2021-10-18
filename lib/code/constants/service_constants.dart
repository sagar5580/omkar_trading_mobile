class ServiceConstants {
  static const String productionURL = 'https://www.omkartrading.live/';
  // static const String productionURL = 'https://bd42-219-91-142-239.ngrok.io/';

  static const String pointURL = productionURL;
  static const String version = 'v1/';
  static const String baseURL = pointURL + version;

  static const String products = 'products';
  static const String testimonals = 'testimonals';
  static const String complains = 'complains';
  static const String branches = 'branches';
  static const String user = 'user/';
  static const String sessions = 'user/sessions';
  static const String order_products = user + 'order-products';
  static const String refer_earnings = user + 'refer-earnings';
  static const String inquiries = 'inquiries';
  static const String save_user_devise = user + 'save-user-devise';
}
