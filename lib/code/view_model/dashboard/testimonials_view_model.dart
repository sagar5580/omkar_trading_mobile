import 'package:flutter/material.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/testimonials_model.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class TestimonialsTabViewModel extends BaseModel {
  List<TestimonialsData>? getTestimonialsList = [];
  List<TestimonialsData>? getSearchTestimonialsList = [];

  TextEditingController? searchController;

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await getTestimonials();
    state = ViewState.Idle;
  }

  Future<void> getTestimonials() async {
    try {
      TestimonialsResponse testimonialsResponse =
          await apiRepository.getTestimonialsList();
      getTestimonialsList = testimonialsResponse.data;
    } catch (error) {
      print('getTestimonials: $error');
    }
  }

  onSearchTextChanged(String text) async {
    state = ViewState.Busy;
    getSearchTestimonialsList!.clear();
    if (text.isEmpty) {
      return;
    }
    getTestimonialsList!.forEach((userDetail) {
      if (userDetail.name!.contains(text))
        getSearchTestimonialsList!.add(userDetail);
    });
    state = ViewState.Idle;
  }
}
