import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/acard.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>{
  Gender selectedGender=Gender.male;
  int height=180;
  int weight=60;
  int age=20;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
          children: [
            Expanded(
                child: ACard(
                  onPress: (){
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
                  colour:selectedGender==Gender.male?acardColor:inActiveColor,
                  cardChild:IconContent(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',
            ),
            ),

            ),
            Expanded(
              child: ACard(
                onPress: (){
                setState(() {
                  selectedGender=Gender.female;
                });
              },
                colour:selectedGender==Gender.female?acardColor:inActiveColor,
                cardChild:IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              ),),
            ),
        ],
      )),
          Expanded(child: ACard(colour: acardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: kNumberTextStyle,
                  ),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                    RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                    setState(() {
                      height=newValue.round();
                    });
                  },
                ),
              )
            ],
          ),)),
          Expanded(child: Row(
            children: [
              Expanded(child: ACard(colour: acardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                        setState(() {
                          weight--;
                        });
                      },),
                  SizedBox(
                    width: 10.0,
                  ),
                      RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                        setState(() {
                          weight++;
                        });
                      },)
                ],
    ),
  ],
              ),),),
              Expanded(child: ACard(colour: acardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AGE',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                        setState(() {
                          age--;
                        });
                      },),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                        setState(() {
                          age++;
                        });
                      },),
                    ],
                  )
                ],

              ),)),
            ],
          )),
          BottonButton(buttonTitle: 'CALCULATE',onTap: (){
            CaculatorBrain calc=CaculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },
          ),
        ],
      ),
    );
  }
}



