import 'package:flutter/material.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/complains_model.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class ComplainsTabViewModel extends BaseModel {
  List<ComplainsData>? getComplainsList = [];

  TextEditingController? searchController;
  bool isLoading = false;

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await getComplains();
    state = ViewState.Idle;
  }

  Future<void> getComplains() async {
    try {
      isLoading = false;
      ComplainsResponse complainsResponse =
          await apiRepository.getComplainsList();
      getComplainsList = complainsResponse.data;
      isLoading = true;
    } catch (error) {
      print('getComplains: $error');
    }
  }
}
