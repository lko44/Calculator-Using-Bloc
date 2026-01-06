import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {

    on<AddEvent>((event, emit) {
      emit(CalculatorResult(event.a + event.b));
    });

    on<SubtractEvent>((event, emit) {
      emit(CalculatorResult(event.a - event.b));
    });

    on<MultiplyEvent>((event, emit) {
      emit(CalculatorResult(event.a * event.b));
    });

    on<DivideEvent>((event, emit) {
      if (event.b == 0) {
        emit(CalculatorResult(0));
      } else {
        emit(CalculatorResult(event.a / event.b));
      }
    });

    on<ResetEvent>((event, emit) {
      emit(CalculatorResult(0));
    });
  }
}
