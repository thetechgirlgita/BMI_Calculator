import 'constant.dart';
import 'package:flutter/material.dart';

class Input_Page extends StatefulWidget {
  @override
  _Input_PageState createState() => _Input_PageState();
}

class _Input_PageState extends State<Input_Page> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                color: accentHexColor,
                fontWeight: FontWeight.w500,
                fontSize: 30),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 40,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 190,

                        decoration: BoxDecoration(
                          color: mainHexColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: mainHexColor,
                              offset: Offset(4,4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: accentHexColor,
                              offset: Offset(-4,-4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            )

                          ]
                          ),
                    child:
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 50,10, 0),
                          child:
                  TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " Height",
                      hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                  ),),

                Container(
                  width: 150,
                  height: 190,
                  decoration: BoxDecoration(
                      color: mainHexColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: mainHexColor,
                          offset: Offset(-4,-4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: accentHexColor,
                          offset: Offset(4,4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )

                      ]
                  ),
                  child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50,10, 0),
                    child:
                    TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: " Weight",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),

                  ),
                ),
              ],
            ),


            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You\'re over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You\'re under weight";
                  }
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: mainHexColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                  BoxShadow(
                  color: accentHexColor,
                  offset: Offset(2,2),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2,-2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )]),

                child:
                Center(child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                    child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                )))
          ]),
        ));
  }
}

