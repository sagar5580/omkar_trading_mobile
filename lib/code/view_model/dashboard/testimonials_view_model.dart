import 'package:flutter/material.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';
import 'package:omkar_trading/code/model/testimonials_model.dart';
import 'package:omkar_trading/code/view_model/base_model.dart';

class TestimonialsTabViewModel extends BaseModel {
  List<TestimonialsData>? getTestimonialsList = [];
  List<TestimonialsData>? getSearchTestimonialsList = [];

  TextEditingController? searchController;

  bool isLoading = false;

  Future<void> getAllData() async {
    state = ViewState.Busy;
    await getTestimonials();
    state = ViewState.Idle;
  }

  Future<void> getTestimonials() async {
    try {
      isLoading = false;
      TestimonialsResponse testimonialsResponse =
          await apiRepository.getTestimonialsList();
      getTestimonialsList = testimonialsResponse.data;
      getSearchTestimonialsList = List.from(getTestimonialsList!);
      isLoading = true;
    } catch (error) {
      print('getTestimonials: $error');
    }
  }

  onSearchTextChanged(String text) async {
    state = ViewState.Busy;
    getSearchTestimonialsList = getTestimonialsList!
        .where((item) => item.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    state = ViewState.Idle;
  }
}
