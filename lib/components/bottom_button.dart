import 'package:flutter/material.dart';
import 'package:bmi_calculator_fluter/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.onTap});

  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            // have width as big as screen
            width: double.infinity,
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            height: kBottomContainerHeight,
            child:
                Center(child: Text(buttonTitle, style: kLargeButtonTextStyle))),
        onTap: onTap);
  }
}
