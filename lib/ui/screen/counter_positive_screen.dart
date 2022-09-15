import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/cubit/counter/counter_cubit.dart';

class CounterPositiveScreen extends StatelessWidget {
  static const path = '/counter/positive';

  const CounterPositiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter positive')),
      body: Column(
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                state.value.toString(),
                textAlign: TextAlign.center,
              );
            },
          ),
          ElevatedButton(
            onPressed: BlocProvider.of<CounterCubit>(context).increment,
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}
