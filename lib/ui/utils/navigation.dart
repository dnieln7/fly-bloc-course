import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Navigation {
  static Future<Object?> push<T extends Cubit>(
      BuildContext context, T cubit, Widget destination) {
    return Navigator.push<Object?>(
      context,
      MaterialPageRoute(
        builder: (ctx) => BlocProvider.value(
          value: cubit,
          child: destination,
        ),
      ),
    );
  }

  static Future<Object?> pushPath(context, String path) {
    return Navigator.pushNamed<Object?>(context, path);
  }

  static Future<Object?> replace<T extends Cubit>(
      BuildContext context, T cubit, Widget destination) {
    return Navigator.pushReplacement<Object?, Object?>(
      context,
      MaterialPageRoute(builder: (ctx) => destination),
    );
  }

  static Future<Object?> replacePath(BuildContext context, String path) {
    return Navigator.pushReplacementNamed<Object?, Object?>(context, path);
  }

  static void popToBottom(context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}

// class Navigation {
//   static Future<Object?> push(BuildContext context, Widget destination) {
//     return Navigator.push<Object?>(
//       context,
//       MaterialPageRoute(builder: (ctx) => destination),
//     );
//   }
//
//   static Future<Object?> pushPath(context, String path) {
//     return Navigator.pushNamed<Object?>(context, path);
//   }
//
//   static Future<Object?> replace(BuildContext context, Widget destination) {
//     return Navigator.pushReplacement<Object?, Object?>(
//       context,
//       MaterialPageRoute(builder: (ctx) => destination),
//     );
//   }
//
//   static Future<Object?> replacePath(BuildContext context, String path) {
//     return Navigator.pushReplacementNamed<Object?, Object?>(context, path);
//   }
//
//   static void popToBottom(context) {
//     Navigator.popUntil(context, (route) => route.isFirst);
//   }
//
//   static void popToBottomAndReplace(BuildContext context, Widget destination) {
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (ctx) => destination),
//     );
//   }
//
//   static void popToBottomAndReplacePath(BuildContext context, String path) {
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacementNamed(context, path);
//   }
// }
