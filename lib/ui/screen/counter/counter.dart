import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_bloc_course/state/cubit/counter/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Incremented!')));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Decremented!')));
          }
        },
        child: Row(
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
                child: const Text('+')),
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
