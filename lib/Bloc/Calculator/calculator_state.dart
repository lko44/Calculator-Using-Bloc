class CalculatorState {
  final double result;

  CalculatorState({required this.result});

  factory CalculatorState.initial() {
    return CalculatorState(result: 0);
  }

  CalculatorState copyWith({double? result}) {
    return CalculatorState(
      result: result ?? this.result,
    );
  }
}