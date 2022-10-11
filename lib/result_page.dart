
import 'package:bmi/bottomButton.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.interpretation, required this.bmiResult,required this.resultText,});
  final String  bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child:
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
                'Your Result',
                  style: kTitleTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
              child: ReusableCard(
                  colour: kInactiveElevatedColo,
                cardChild: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMiTextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,

                    ),
                  ],
                ),
              )
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
