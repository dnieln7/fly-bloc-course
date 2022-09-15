import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_bloc_course/state/cubit/counter/counter_cubit.dart';
import 'package:fly_bloc_course/ui/screen/counter_negative_screen.dart';
import 'package:fly_bloc_course/ui/screen/counter_positive_screen.dart';
import 'package:fly_bloc_course/ui/screen/counter_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route<Object?>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CounterScreen.path:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const CounterScreen(),
          ),
        );
      case CounterPositiveScreen.path:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const CounterPositiveScreen(),
          ),
        );
      case CounterNegativeScreen.path:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const CounterNegativeScreen(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
