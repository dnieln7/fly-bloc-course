import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_bloc_course/state/cubit/counter/counter_cubit.dart';
import 'package:fly_bloc_course/ui/screen/counter/counter.dart';

void main() {
  runApp(const FlyBloc());
}

class FlyBloc extends StatelessWidget {
  const FlyBloc({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Fly Bloc Course',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            accentColor: Colors.yellowAccent,
          ),
        ),
        home: const CounterScreen(),
      ),
    );
  }
}
