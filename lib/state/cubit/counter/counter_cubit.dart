import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0, false));

  void increment({int amount = 1}) {
    emit(CounterState(state.value + amount, true));
  }

  void decrement({int amount = 1}) {
    emit(CounterState(state.value - amount, false));
  }
}
