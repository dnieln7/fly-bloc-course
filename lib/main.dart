import 'package:flutter/material.dart';
import 'package:fly_bloc_course/ui/router/app_router.dart';
import 'package:fly_bloc_course/ui/screen/counter_screen.dart';

void main() {
  runApp(const FlyBloc());
}

class FlyBloc extends StatefulWidget {
  const FlyBloc({Key? key}) : super(key: key);

  @override
  State<FlyBloc> createState() => _FlyBlocState();
}

class _FlyBlocState extends State<FlyBloc> {
  final AppRouter _router = AppRouter();

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
      initialRoute: CounterScreen.path,
      onGenerateRoute: _router.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
