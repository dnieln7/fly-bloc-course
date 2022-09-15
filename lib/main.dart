import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_bloc_course/state/cubit/counter/counter_cubit.dart';
import 'package:fly_bloc_course/ui/router/app_router.dart';
import 'package:fly_bloc_course/ui/screen/counter_screen.dart';

void main() {
  runApp(FlyBloc());
}

class FlyBloc extends StatelessWidget {
  FlyBloc({Key? key}) : super(key: key);

  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Fly Bloc Course',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            accentColor: Colors.yellowAccent,
          ),
        ),
        initialRoute: CounterScreen.path,
        onGenerateRoute: _router.onGenerateRoute,
      ),
    );
  }
}
