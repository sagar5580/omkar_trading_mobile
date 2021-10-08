import 'package:flutter/material.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class HomeTabViewModel extends BaseModel {
  List<ProductData>? getProductList = [];
  List<ProductData>? searchProductList = [];

  TextEditingController? searchController;

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await getProduct();
    state = ViewState.Idle;
  }

  Future<void> getProduct() async {
    try {
      ProductResponse productResponse = await apiRepository.getProductList();
      getProductList = productResponse.data;
    } catch (error) {
      print('getProduct: $error');
    }
  }

  onSearchTextChanged(String text) async {
    state = ViewState.Busy;
    searchProductList!.clear();
    if (text.isEmpty) {
      return;
    }
    getProductList!.forEach((userDetail) {
      if (userDetail.name!.contains(text)) searchProductList!.add(userDetail);
    });
    state = ViewState.Idle;
  }
}
