// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  int height;
  int weight;
  bool isMale;
  ResultPage(
      {super.key,
      required this.height,
      required this.weight,
      required this.isMale});

  @override
  Widget build(BuildContext context) {
    double bmiCalc = weight / pow(height / 100, 2);
    String result = "";
    switch (bmiCalc) {
      case < 16:
        result = "Severe Thinness";
        break;
      case > 16 && < 18.5:
        result = "Underweight";
        break;
      case > 18.5 && < 25:
        result = "Normal";
        break;
      case > 25 && < 30:
        result = "Overweight";
        break;
      case > 30:
        result = "Obese";
        break;
      default:
    }
    return Scaffold(
        backgroundColor: isMale
            ? Color.fromARGB(255, 54, 135, 201)
            : Color.fromARGB(255, 178, 38, 176),
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your BMI Is:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Text(
                bmiCalc.toStringAsFixed(1),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Text(
                result,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_circle_left,
                    size: 40,
                    color: Colors.white,
                  ))
            ],
          )),
        ));
  }
}
