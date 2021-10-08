import 'package:flutter/material.dart';
import 'package:omkar_trading/code/constants/color_constant.dart';
import 'package:omkar_trading/code/utils/utils.dart';

class DropdwonWidget extends StatefulWidget {
  @override
  _DropdwonWidgetState createState() => _DropdwonWidgetState();
}

class _DropdwonWidgetState extends State<DropdwonWidget> {
  String dropdownValue = 'Build Quality';

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              borderSide: BorderSide(color: AppColors.bright_gray, width: 3.0)),
          contentPadding: EdgeInsets.zero),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.black,
              size: 30,
            ),
            iconSize: 24,
            elevation: 16,
            style: Utils.regularTextStyle(color: AppColors.black),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Build Quality', 'Color Quality']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
