import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/testimonials_model.dart';
import 'package:omkar_trading/code/routing/routers.dart';
import 'package:omkar_trading/code/view_model/dashboard/testimonials_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/app_bar.dart';
import 'package:omkar_trading/ui/widgets/list_item_widget/testimonials_list_item.dart';
import 'package:omkar_trading/ui/widgets/search_text_field.dart';

class TestimonialsScreen extends StatefulWidget {
  const TestimonialsScreen({Key? key}) : super(key: key);

  @override
  _TestimonialsScreenState createState() => _TestimonialsScreenState();
}

class _TestimonialsScreenState extends State<TestimonialsScreen> {
  TestimonialsTabViewModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model?.searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TestimonialsTabViewModel>(onModelReady: (model) async {
      this.model = model;
      await model.getAllData();
    }, builder: (context, model, child) {
      return Scaffold(
        backgroundColor: AppColors.secondary_color,
        body: SafeArea(child: mainLayout()),
      );
    });
  }

  mainLayout() {
    return Column(
      children: [
        CommonAppBar(
          title: AppString.testimonials,
          textValue: "",
          rightIcon: ImageAssets.ic_group,
          onPressed: () {
            Navigator.pushNamed(context, Routes.ProfileScreen);
          },
        ),
        Row(
          children: [
            Expanded(
              child: SearchTextField(
                controller: model?.searchController,
                textAlign: TextAlign.start,
                autofocus: false,
                hintText: AppString.search,
                topContentPadding: 10,
                leftContentPadding: 10,
                rightContentPadding: 10,
                onChanged: (value) {
                  model?.onSearchTextChanged(value);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, right: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primary_color,
              ),
              child: Image.asset(
                ImageAssets.ic_filter,
                height: 13,
                width: 13,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: model?.getSearchTestimonialsList?.length != 0 ||
                  model?.searchController != null &&
                      model!.searchController!.text.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: model?.getSearchTestimonialsList?.length,
                  itemBuilder: (context, index) {
                    TestimonialsData models =
                        model!.getSearchTestimonialsList![index];
                    return TestimonialsListItem(
                      testimonialsData: models,
                    );
                  })
              : model?.getTestimonialsList!.length == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary_color,
                      ),
                    )
                  : AnimationLimiter(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: model?.getTestimonialsList?.length,
                          itemBuilder: (context, index) {
                            TestimonialsData models =
                                model!.getTestimonialsList![index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: TestimonialsListItem(
                                    testimonialsData: models,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
        ),
      ],
    );
  }
}
