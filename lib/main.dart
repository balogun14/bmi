
import 'package:bmi/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'icon.dart';
import 'constants.dart';
import 'calculatorBrain.dart';

enum Gender {
  male,
  female,
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme : ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveElevatedColor;
  Color femaleCardColour = kInactiveElevatedColor;
  Gender? selectedGender;
  int height = 100;
  int weight =60;
  int age =10;
  void add(weight){
    setState(() {
      weight++;
    });
  }

  void adda(age){
    setState(() {
      age++;
    });
  }

  void suba(age){
    setState(() {
      age--;
    });
  }
  void sub(weight){
    setState(() {
      weight--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveElevatedColor,
        title: Text('BMI CALCULATOR'),
      ),
      body:
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress:() {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveElevatedColor:
                           kInactiveElevatedColor,
                    cardChild: CardChild(
                        icon:  FontAwesomeIcons.mars,
                        label:'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress:() {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveElevatedColor:
                           kInactiveElevatedColor ,
                    cardChild: CardChild(
                        icon:FontAwesomeIcons.venus,
                        label:'Female'
                    ),
                  ),
                ),
              ]
            ),),
          Expanded(
            child: ReusableCard(
              colour: kActiveElevatedColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline:TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kTextStyle,
                      ),
                      Text(
                          'cm',
                        style: kLabelTextStyle ,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEb1555),
                      overlayColor: Color(0x29Eb1555),
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height =newValue.round();

                        });
                        },),
                  )

                ],
              ),
            ),
          ),
    Expanded(
    child: Row(
    children: <Widget>[
    Expanded(
    child: ReusableCard(
      colour: kActiveElevatedColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'WEIGHT',
            style: kLabelTextStyle,
          ),
          Text(
            weight.toString(),
            style: kTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: (){
                  setState(() {
                    weight--;
                  });
                },              ),
              SizedBox(
                width: 10,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: (){
                  setState(() {
                    weight++;
                  });
                },              ),
            ],
          ),

        ],
      ) ,
    ),
    ),
    Expanded(
    child: ReusableCard(
      colour: kActiveElevatedColor,

      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'AGE',
            style: kLabelTextStyle,
          ),
          Text(
            age.toString(),
            style: kTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                onPressed: (){
                  setState(() {
                    age--;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: (){
                    setState(() {
                      age++;
                    });
                  },
              ),
            ],
          ),

        ],
      ) ,
    ),
    ),
            ]),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultPage(
                  bmiResult: calc.calculateBMi(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },
            child: Container(
              color: kContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                  'Calculate',
                  style:kTextStyle,
                ),],
              ),
            ),
          ),
        ]

      ),

    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
        elevation: 6,
        constraints: BoxConstraints.tightFor(
            width:1,
          height: 1,
        ),
      onPressed: (){onPressed();},
      shape:CircleBorder(),
        fillColor: Color(0xFF4C4F44),

    );
  }
}
//onPressed: _incrementCounter,
//         tooltip: 'Increment',




