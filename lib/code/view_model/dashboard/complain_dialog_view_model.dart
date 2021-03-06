import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/complains_model.dart';
import 'package:omkar_trading/code/utils/toasts.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class ComplainsDialogViewModel extends BaseModel {
  final formKey = GlobalKey<FormState>();
  final reasonController = TextEditingController();
  final messageController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final memberIdController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<MultipartFile> imageList = [];

  List<File> imageFileList = [];

  Future<void> complainRequest(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      state = ViewState.Busy;
      try {
        var formData = FormData.fromMap({
          "complain[subject]": reasonController.text,
          "complain[message]": messageController.text,
          "complain[username]": usernameController.text,
          "complain[phone]": phoneController.text,
          "complain[membership_no]": memberIdController.text,
          "complain[images][]": imageList,
        });
        ComplainsData complainsData =
            await apiRepository.complainRequest(formData);
        print("message${complainsData.message}");
        Toasts.showToast(complainsData.message);
        imageFileList.clear();
        imageList.clear();
        Navigator.pop(context);
        state = ViewState.Idle;
      } catch (onError) {
        state = ViewState.Idle;
        Toasts.showToast("Please Select image");
        print(" complainRequest $onError");
      }
      state = ViewState.Idle;
    }
  }

  void imagePick() async {
    state = ViewState.Busy;
    try {
      final pickedFile = await _picker.pickMultiImage(
        imageQuality: 50,
      );
      pickedFile!.forEach((element) async {
        imageList.add(
            await MultipartFile.fromFile(element.path, filename: element.name));
        imageFileList.add(File(element.path));
        state = ViewState.Idle;
      });
    } catch (e) {
      state = ViewState.Idle;
    }
    state = ViewState.Idle;
  }
}
