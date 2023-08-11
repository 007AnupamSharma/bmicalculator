import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/components/Icon_Content.dart';
import 'package:bmicalculator/components/Reuseable_Card.dart';
import 'package:bmicalculator/constants.dart';
import 'result_page.dart';
import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/components/round_icon_button.dart';
import 'package:bmicalculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ResusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male
                    ? kactiveCardColor
                    : kinactiveCardColor,
                cardChild:
                    IconContent(label: "Male", icon: FontAwesomeIcons.mars),
              )),
              Expanded(
                  child: ResusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female
                    ? kactiveCardColor
                    : kinactiveCardColor,
                cardChild:
                    IconContent(label: "Female", icon: FontAwesomeIcons.venus),
              )),
            ],
          )),
          Expanded(
            child: ResusableCard(
              colour: kinactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Height', style: klabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: ktextTextStyle),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor:  Color(0x29EB1555),
                      overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ResusableCard(colour: kinactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight', style: klabelTextStyle,),
                    Text(weight.toString(),style: ktextTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){setState(() {
                          weight = weight-1;
                        });},),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                          setState(() {
                            weight = weight+1;
                          });
                        },)
                      ],
                    )
                  ],
                ),)),
                Expanded(child: ResusableCard(colour: kinactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age', style: klabelTextStyle,),
                    Text(age.toString(),style: ktextTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){setState(() {
                          age--;
                        });},),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                          setState(() {
                            age++;
                          });
                        },)
                      ],
                    )
                  ],
                ),),
                ),
              ],
            ),
          ),
          BottomButton(
            bottomTittle: 'Calculate',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){ return ResultPage(
                result: calc.calculateBMI(),
                title: calc.getResult(),
                interpretation: calc.getInterpretation(),
              );}));
            },
          ),
        ],
      ),
    );
  }
}

