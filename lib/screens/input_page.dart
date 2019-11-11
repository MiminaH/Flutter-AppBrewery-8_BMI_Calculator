import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_fluter/components/reusable_card.dart';
import 'package:bmi_calculator_fluter/components/icon_content.dart';
import 'package:bmi_calculator_fluter/constants.dart';
import 'package:bmi_calculator_fluter/screens/results_page.dart';
import 'package:bmi_calculator_fluter/components/bottom_button.dart';
import 'package:bmi_calculator_fluter/components/round_icon_button.dart';
import 'package:bmi_calculator_fluter/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BMI CALCULATOR'), centerTitle: true),
        body: Column(
            // use crossAxisAlignment to avoid Containers shrinking to their children's sizes.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(children: <Widget>[
                Expanded(
                    child: new ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild:
                            new IconContent(FontAwesomeIcons.mars, 'MALE'),
                        // passing an Anonymous Function that has setState()
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        })),
                Expanded(
                    child: new ReusableCard(
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild:
                            new IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        }))
              ])),
              Expanded(
                  child: new ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment
                                    .baseline, // to align 'cm' to be on same baseline as Number
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(height.toString(),
                                      style: kNumberTextStyle),
                                  Text(' cm', style: kLabelTextStyle)
                                ]),
                            SliderTheme(
                              // .of(context).copyWith() allows adjusting only desired properties of SliderTheme
                              data: SliderTheme.of(context).copyWith(
                                thumbColor: kThumbColor,
                                activeTrackColor: kSliderActiveColor,
                                inactiveTrackColor: kSliderInactiveColor,
                                overlayColor: kThumbOverlayColor,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0, // could define these as constants
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.toInt();
                                  });
                                },
                              ),
                            )
                          ]))),
              Expanded(
                  child: Row(children: <Widget>[
                Expanded(
                    child: new ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('WEIGHT', style: kLabelTextStyle),
                              Text(weight.toString(), style: kNumberTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          weight--;
                                          print(weight.toString());
                                        });
                                      }),
                                  SizedBox(width: 10.0),
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                ],
                              )
                            ]))),
                Expanded(
                    child: new ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('AGE', style: kLabelTextStyle),
                              Text(age.toString(), style: kNumberTextStyle),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            age--;
                                          });
                                        }),
                                    SizedBox(width: 10.0),
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            age++;
                                          });
                                        })
                                  ])
                            ])))
              ])),
              BottomButton(
                  buttonTitle: 'CALCULATE',
                  onTap: () {
                    CalculatorBrain calc = CalculatorBrain(height, weight);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                  bmiResult: calc.calculateBMI(),
                                  resultText: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  })
            ]));
  }
}

/* Dart Ternary Operator
   Condition ? DoThisIfTrue : DoThisIfFalse

   INSTEAD of if/else
   bool angelaIsAwesome = true;
   angelaIsAwesome ? print('That\'s great!') : print('Oh not.');

   ASSIGNING values
   int age = 12;
   bool canBuyAlcohol = age > 21 ? true : false;
*/

/* Code substituted by Ternary Operator:

Color maleCardColor = inactiveCardColor;
Color femaleCardColor = inactiveCardColor;
  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }

    if (selectedGender == Gender.female) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  } */

/* FUNCTIONS as Objects
  void main(){
    int result = calculator(5, 8, add);
  }

  // passing a Function as a parameter
  int calculator(int n1, int n2, Function calculation){
    return calculation(n1, n2);
  }
  // assigning a Function as a Value
  Function calculator = (int n1, int n2, Function calculation){
    return calculation(n1, n2);
  };

  int add(int n1, int n2){ return n1+n2; }

  int multiply(int n1, int n2){ return n1*n2; }
 */
