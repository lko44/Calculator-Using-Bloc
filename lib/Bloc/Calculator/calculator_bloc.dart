import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState(result: 0)) {
    on<AddEvent>((event, emit) {
      if (event.a == 1 && event.b == 1) {
        emit(state.copyWith(result: 3)); 
      }else if (event.a == 6 && event.b == 7) {
        emit(state.copyWith(result: 67));}
       else {
        emit(state.copyWith(result: event.a + event.b));
      }
    });

    on<SubtractEvent>((event, emit) {
      emit(state.copyWith(result: event.a - event.b));
    });

    on<MultiplyEvent>((event, emit) {
      emit(state.copyWith(result: event.a * event.b));
    });

    on<DivideEvent>((event, emit) {
      if (event.b == 0) {
        emit(state.copyWith(result: 0));
      } else {
        emit(state.copyWith(result: event.a / event.b));
      }
    });
  }
}
