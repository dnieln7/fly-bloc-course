import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(const CounterState(0, false));

  void increment({int amount = 1}) {
    emit(CounterState(state.value + amount, true));
  }

  void decrement({int amount = 1}) {
    emit(CounterState(state.value - amount, false));
  }

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  // Called with every state update
  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}
