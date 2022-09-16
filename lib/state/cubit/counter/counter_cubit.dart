import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../internet/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;

  StreamSubscription? _subscription;

  CounterCubit(this.internetCubit) : super(const CounterState(0, false)) {
    _subscription = internetCubit.stream.listen((internet) {
      if (internet is InternetConnected) {
        emit(CounterState(state.value + 10, true));
      }
      if (internet is InternetDisconnected) {
        emit(CounterState(state.value - 10, false));
      }
    });
  }

  void increment() {
    emit(CounterState(state.value + 1, true));
  }

  void decrement() {
    emit(CounterState(state.value - 1, false));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }
}
