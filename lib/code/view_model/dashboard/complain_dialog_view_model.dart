import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/complains_model.dart';
import 'package:omkar_trading/code/utils/toasts.dart';
import 'package:omkar_trading/code/utils/utils.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';
import 'package:dio/dio.dart';

class ComplainsDialogViewModel extends BaseModel {
  final formKey = GlobalKey<FormState>();
  final reasonController = TextEditingController();
  final messageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<MultipartFile> imageList = [];
  XFile? _imageFile;
  dynamic _pickImageError;

  List<File> imageFileList = [];

  Future<void> complainRequest(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      state = ViewState.Busy;
      try {
        var formData = FormData.fromMap({
          "complain[subject]": reasonController.text,
          "complain[message]": messageController.text,
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
      _pickImageError = e;
    }
    state = ViewState.Idle;
  }
}
