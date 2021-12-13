import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'reUsable_card.dart';

class Resultpage extends StatelessWidget {
  Resultpage({this.Result, this.resultText, this.interpretation});
  final String Result;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BMI CALCULATOR'), backgroundColor: Color(0xFF0A0E21)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'YOUR RESULT',
                  style: kTextResultStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: Color(kActiveColor),
              usableCardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kTextResultTwoStyle,
                  ),
                  Text(
                    Result,
                    style: kBMITextResultTwoStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'Back To Calculator',
                  style: kBigButtonStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              height: kBottomContinerHeight,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
