import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;
}

// extension NavigatorExtension on BuildContext {
//   void popPage<T extends Object?>([T? result]) => Navigator.pop(this, result);

//   Future<T?> pushPage<T extends Object?>(Widget page) => Navigator.push(
//         this,
//         MaterialPageRoute(builder: (_) => page),
//       );

//   Future<T?> pushNamed<T extends Object?>(
//     String screenName, {
//     Object? arguments,
//   }) async =>
//       Navigator.of(this).pushNamed<T>(
//         screenName,
//         arguments: arguments,
//       );

//   Future<T?> pushPageAndRemoveUntil<T extends Object?>(
//     Widget page, {
//     RoutePredicate? predicate,
//   }) async =>
//       Navigator.of(this).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => page),
//         predicate ?? (_) => false,
//       );

//   Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
//     String screenName, {
//     Object? arguments,
//   }) async =>
//       Navigator.of(this).pushNamedAndRemoveUntil(
//         screenName,
//         (route) => false,
//         arguments: arguments,
//       );
// }

