part of 'counter_bloc.dart';

class CounterState {
  final int counter;

  CounterState({
    required this.counter,
  });

  @override
  List<Object> get props => [counter];

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  @override
  String toString() {
    return 'CounterState(counter: $counter';
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
