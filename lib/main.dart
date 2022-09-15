import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_bloc_course/state/cubit/counter/counter_cubit.dart';
import 'package:fly_bloc_course/ui/screen/counter_negative_screen.dart';
import 'package:fly_bloc_course/ui/screen/counter_positive_screen.dart';
import 'package:fly_bloc_course/ui/screen/counter_screen.dart';

void main() {
  runApp(const FlyBloc());
}

class FlyBloc extends StatelessWidget {
  const FlyBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fly Bloc Course',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.yellowAccent,
        ),
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const CounterScreen(),
      ),
      routes: {
        CounterPositiveScreen.path: (ctx) => const CounterPositiveScreen(),
        CounterNegativeScreen.path: (ctx) => const CounterNegativeScreen(),
      },
    );
  }
}
