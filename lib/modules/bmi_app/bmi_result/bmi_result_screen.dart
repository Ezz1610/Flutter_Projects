

import 'package:flutter/material.dart';

class bmi_result_screen  extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;
      bmi_result_screen({
       required this.age,
       required this.isMale,
       required this.result
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text(
        "BMI Resulr"),
    ),
    body:
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Gender:${isMale?'Male':'Female'}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,

          ),
        ),
        Text(
          "result:${result}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,

          ),
        ),
        Text(
          "Age:${age}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,

          ),
        ),


      ],
      ),
    ),
    );
  }
}
