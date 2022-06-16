import 'package:flutter/material.dart';
import 'input_page.dart';
import '../constants.dart';
import '../components/acard.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget{

  ResultsPage({required this.interpretation,required this.bmiResult,required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          ),
          Expanded(
            flex: 5,
            child: ACard(
              colour:acardColor,
              cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                  ),
                ],
              )
            ),
          ),
          BottonButton(
            buttonTitle: 'RE-CALCULATE',
              onTap: (){
              Navigator.pop(context);
              })
        ],
      ),
    );
  }
  }
