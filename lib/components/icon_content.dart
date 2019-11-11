import 'package:flutter/material.dart';
import 'package:bmi_calculator_fluter/constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.genderIcon, this.genderLabel);

  final IconData genderIcon;
  final String genderLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(genderIcon, size: 80.0),
          SizedBox(height: 15.0),
          Text(genderLabel, style: kLabelTextStyle)
        ]);
  }
}
