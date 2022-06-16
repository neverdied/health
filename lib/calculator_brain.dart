import 'dart:math';

class CaculatorBrain{
  double _bmi=1;
  CaculatorBrain({required this.height,required this.weight});

  final int height;
  final int weight;


  String calculateBMI(){
    _bmi=weight/pow(height/100.0, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. Trt to excise more.';
    }else if(_bmi>=18.5){
      return 'You have a normal body Weight.Good job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}