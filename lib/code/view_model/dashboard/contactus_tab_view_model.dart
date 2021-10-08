import 'package:flutter/material.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/inquiries_model.dart';
import 'package:omkar_trading/code/model/our_branche_model.dart';
import 'package:omkar_trading/code/utils/toasts.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';
import 'package:dio/dio.dart';

class ContactusTabViewModel extends BaseModel {
  List<OurBranchesData>? getOurBranchesList = [];

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await getOurBranches();
    state = ViewState.Idle;
  }

  Future<void> getOurBranches() async {
    try {
      OurBranchesResponse ourBranchesResponse =
          await apiRepository.getOurBranchesList();
      getOurBranchesList = ourBranchesResponse.data;
    } catch (error) {
      print('getOurBranches: $error');
    }
  }

  Future<void> inquiriesRequest(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      state = ViewState.Busy;
      try {
        var requestData = {
          "inquiry": {
            "name": nameController.text,
            "email": emailController.text,
            "phone": phoneController.text,
            "message": messageController.text,
          },
        };
        InquiriesResponse inquiriesResponse =
            await apiRepository.inquiriesRequest(requestData);
        print("message${inquiriesResponse.message}");
        Toasts.showToast(inquiriesResponse.message);
        state = ViewState.Idle;
      } catch (onError) {
        state = ViewState.Idle;
        switch (onError.runtimeType) {
          case DioError:
            Utils.handleError(onError as DioError);
            break;
          default:
        }
      }
      state = ViewState.Idle;
    }
  }
}
