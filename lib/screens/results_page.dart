import 'package:flutter/material.dart';
import 'package:bmi_calculator_fluter/constants.dart';
import 'package:bmi_calculator_fluter/components/reusable_card.dart';
import 'package:bmi_calculator_fluter/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(15.0),
                      alignment: Alignment.bottomLeft,
                      child: Text('Your results', style: kTitleTextStyle))),
              Expanded(
                  flex: 5,
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(resultText.toUpperCase(),
                                style: kResultTextStyle),
                            Text(bmiResult, style: kBMITextStyle),
                            Text(interpretation,
                                textAlign: TextAlign.center,
                                style: kBodyTextStyle)
                          ]))),
              Expanded(
                  child: BottomButton(
                      buttonTitle: 'RE-CALCULATE',
                      onTap: () {
                        Navigator.pop(context);
                      }))
            ]));
  }
}
