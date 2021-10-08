import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:omkar_trading/code/constants/app_string.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/constants/image_assets.dart';
import 'package:omkar_trading/code/model/complains_model.dart';
import 'package:omkar_trading/code/view_model/dashboard/complains_tab_view_model.dart';
import 'package:omkar_trading/ui/screens/base_view.dart';
import 'package:omkar_trading/ui/widgets/app_bar.dart';
import 'package:omkar_trading/ui/widgets/complain_dialog.dart';
import 'package:omkar_trading/ui/widgets/list_item_widget/complain_list_item.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({Key? key}) : super(key: key);

  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  ComplainsTabViewModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model?.searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ComplainsTabViewModel>(onModelReady: (model) async {
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
          title: AppString.complain,
          rightIcon: ImageAssets.ic_add,
          textValue: "",
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ComplainDialog();
                }).then((value) {
              model!.getAllData();
            });
          },
        ),
        Expanded(
          child: model!.getComplainsList!.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary_color,
                  ),
                )
              : AnimationLimiter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: model!.getComplainsList!.length,
                    itemBuilder: (context, index) {
                      ComplainsData models = model!.getComplainsList![index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: ComplainListItem(model: models),
                        ),
                      );
                    },
                  ),
                ),
        )
      ],
    );
  }
}
