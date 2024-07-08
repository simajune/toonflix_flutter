part of 'counter_bloc.dart';

class CounterState {
  final int counter;

  CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  List<Object> get props => [counter];

  @override
  String toString() {
    return 'CounterState{counter: $counter}';
  }

  CounterState copyWith({int? counter}) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
