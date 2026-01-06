import 'package:flutter/material.dart';

abstract class CalculatorEvent {}

final TextEditingController aController = TextEditingController();
final TextEditingController bController = TextEditingController();

double a() => double.tryParse(aController.text) ?? 0;
double b() => double.tryParse(bController.text) ?? 0;

class AddEvent extends CalculatorEvent {
  final double a;
  final double b;

  AddEvent(this.a, this.b);
}

class SubtractEvent extends CalculatorEvent {
  final double a;
  final double b;

  SubtractEvent(this.a, this.b);
}

class MultiplyEvent extends CalculatorEvent {
  final double a;
  final double b;

  MultiplyEvent(this.a, this.b);
}

class DivideEvent extends CalculatorEvent {
  final double a;
  final double b;

  DivideEvent(this.a, this.b);
}

class ResetEvent extends CalculatorEvent {}
