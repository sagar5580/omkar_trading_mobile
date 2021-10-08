import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class ProductAboutViewModel extends BaseModel {
  ProductData? productData;

  String? id;
  bool isLoading = false;

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await getProduct();
    state = ViewState.Idle;
  }

  Future<void> getProduct() async {
    try {
      isLoading = false;
      ProductData model = await apiRepository.getProductShow(id!);
      productData = model;
      isLoading = true;
    } catch (error) {
      print('getProduct: $error');
    }
  }
}
