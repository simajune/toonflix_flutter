import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // on<IncrementCounterEvent>(
    //   _incrementCounter,
    // );
    // on<DecrementCounterEvent>(
    //   _decrementCounter,
    // );

    on<CounterEvent>(event, emit) async {
      if (event is IncrementCounterEvent) {
        await _incrementCounter(event, emit);
      } else if (event is DecrementCounterEvent) {
        await _decrementCounter(event, emit);
      }
    }
  }

  Future<void> _incrementCounter(
    event,
    emit,
  ) async {
    await Future.delayed(Duration(seconds: 0));
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _decrementCounter(
    event,
    emit,
  ) async {
    await Future.delayed(Duration(seconds: 0));
    emit(state.copyWith(counter: state.counter - 1));
  }
}
