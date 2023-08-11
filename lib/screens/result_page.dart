import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/Reuseable_Card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.title,required this.result,required this.interpretation});
  final String result;
  final String interpretation;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator '),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(20.0),
            alignment: AlignmentDirectional.bottomStart,
            child: Text('Your Result',style: ktittleTextStyle,),
          )),
          Expanded(

            child: ResusableCard(
              colour: kactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,style: kresultTextStyle,),
                Text(result,style: kBMITextStyle,),
                Text(interpretation,style: kbodyTextStyle,textAlign: TextAlign.center,)
              ],
            ),
          ),
          flex: 5,
          ),
          BottomButton(onTap: (){Navigator.pop(context);}, bottomTittle: 'Recalculate')
        ],
      ),

    );
  }
}
