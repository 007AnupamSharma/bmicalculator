

import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({required this.weight,required this.height});

  final int weight;
  final int height;

  double _bmi=0;

  String calculateBMI(){
    _bmi = (weight/ pow(height, 2)) * 10000;
    print('$weight $height  $_bmi');
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi > 25){
      return 'Overweight';
    }
    else if(_bmi >= 18.5){ return 'Normal'; }
    else {return 'Underweight';}
  }

  String getInterpretation(){
    if (_bmi >= 25.0){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }else if(_bmi >= 18.5){
      return 'You have a normal body weight. Good Job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a little more.';
    }
  }
}