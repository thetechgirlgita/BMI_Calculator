import 'package:flutter/material.dart';

import 'Screens/dart/Input_Page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0a3a),
        scaffoldBackgroundColor: Color(0xff01010f),
      ),
      home: Input_Page(),
    );
  }
}