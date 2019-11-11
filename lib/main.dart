import 'package:flutter/material.dart';
import 'package:bmi_calculator_fluter/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // customize a Theme using copyWith()
        theme: ThemeData.dark().copyWith(
            // provide Color with Hex-Code (add 0xFF before hex-Code)
            primaryColor: Color(0xFF0A0E21),
            scaffoldBackgroundColor: Color(0xFF0A0E21)),
        home: InputPage());
  }
}

/* Defining ThemeData from scratch
  theme: ThemeData(
    primaryColor: Color(0xFF0A0E21),
    scaffoldBackgroundColor: Color(0xFF0A0E21),
    accentColor: Colors.purple,
    textTheme: TextTheme(body1: TextStyle(color:    Colors.white))),
*/

/* Flutter App Structure
    main.dart contains:
      - details of themes, custom font & colors.
      - App's main Name.
      - directs towards first screen.

    a separate dart file for every subsequent screen
 */
