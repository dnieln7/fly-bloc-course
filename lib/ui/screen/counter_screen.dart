import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_bloc_course/state/cubit/counter/counter_cubit.dart';
import 'package:fly_bloc_course/state/cubit/internet/internet_cubit.dart';
import 'package:fly_bloc_course/ui/screen/counter_negative_screen.dart';
import 'package:fly_bloc_course/ui/screen/counter_positive_screen.dart';
import 'package:fly_bloc_course/ui/utils/navigation.dart';

class CounterScreen extends StatelessWidget {
  static const path = '/counter';

  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented) {
            print('Incremented');
          } else {
            print('Decremented');
          }
        },
        child: Column(
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected) {
                  return Text('Connected to ${state.type}');
                } else if (state is InternetDisconnected) {
                  return const Text('No internet connection');
                } else {
                  return const LinearProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Text('-')),
                Expanded(
                  child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                        state.value.toString(),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).increment,
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CounterPositiveScreen.path),
              child: const Text('To positive'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CounterNegativeScreen.path),
              child: const Text('To negative'),
            ),
          ],
        ),
      ),
    );
  }
}

// Consumer combines listener and builder

// class CounterScreen extends StatelessWidget {
//   const CounterScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: Row(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 BlocProvider.of<CounterCubit>(context).decrement();
//               },
//               child: const Text('-')),
//           Expanded(
//             child: BlocConsumer<CounterCubit, CounterState>(
//               listener: (context, state) {
//                 if (state.wasIncremented) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Incremented!')));
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Decremented!')));
//                 }
//               },
//               builder: (context, state) {
//                 return Text(
//                   state.value.toString(),
//                   textAlign: TextAlign.center,
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//               onPressed: BlocProvider.of<CounterCubit>(context).increment,
//               child: const Text('+')),
//         ],
//       ),
//     );
//   }
// }
