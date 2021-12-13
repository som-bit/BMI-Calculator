import 'dart:math';

import 'package:flutter/material.dart';

class Calculator_Brain {
  Calculator_Brain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OVER WEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDER WEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher then normal body weight. Exercise more';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight. Good!';
    } else {
      return 'You have lower then normal body weight. Eat more';
    }
  }
}
