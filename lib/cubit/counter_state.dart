class CounterState {
  final int counterA;
  final int counterB;

  CounterState({
    required this.counterA,
    required this.counterB,
  });
}

class incrementState extends CounterState {
  incrementState({
    required super.counterA,
    required super.counterB,
  });
}

class decrementState extends CounterState {
  decrementState({
    required super.counterA,
    required super.counterB,
  });
}
