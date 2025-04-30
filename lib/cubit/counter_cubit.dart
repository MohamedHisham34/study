import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(
          CounterState(
            counterA: 0,
            counterB: 0,
          ),
        );

  incrementA() {
    emit(incrementState(
      counterA: state.counterA + 1,
      counterB: state.counterB,
    ));
  }

  decrementA() {
    emit(incrementState(
      counterA: state.counterA - 1,
      counterB: state.counterB,
    ));
  }

  incrementB() {
    emit(incrementState(
      counterA: state.counterA,
      counterB: state.counterB + 1,
    ));
  }

  decrementB() {
    emit(incrementState(
      counterA: state.counterA,
      counterB: state.counterB - 1,
    ));
  }
}

// Methods 
