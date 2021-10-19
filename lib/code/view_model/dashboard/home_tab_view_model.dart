import 'package:flutter/material.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/pagination_model.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class HomeTabViewModel extends BaseModel {
  List<ProductData>? getProductList = [];
  List<ProductData>? searchProductList = [];
  bool isLoading = false;
  TextEditingController? searchController;
  PaginationResponse? paginationResponse;

  Future<void> getAllData() async {
    await getProduct();
  }

  Future<void> getProduct() async {
    state = ViewState.Busy;
    try {
      isLoading = false;
      ProductResponse productResponse = await apiRepository.getProductList();
      getProductList = productResponse.data;
      paginationResponse = productResponse.paginationResponse;
      print("no page${paginationResponse?.total_pages}");
      searchProductList = List.from(getProductList!);
      isLoading = true;
      state = ViewState.Idle;
    } catch (error) {
      state = ViewState.Idle;
      print('getProduct: $error');
    }
  }

  onSearchTextChanged(String text) async {
    state = ViewState.Busy;
    searchProductList = getProductList!
        .where((element) =>
            element.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    state = ViewState.Idle;
  }

  Future<void> getFilterProduct(BuildContext context, int low, int high) async {
    state = ViewState.Busy;
    try {
      isLoading = false;
      ProductResponse productResponse =
          await apiRepository.getFilterProductList(low, high);
      getProductList = productResponse.data;
      searchProductList = List.from(getProductList!);
      state = ViewState.Idle;
      isLoading = true;
    } catch (error) {
      state = ViewState.Idle;
      print('getFilterProduct: $error');
    }
  }
}
