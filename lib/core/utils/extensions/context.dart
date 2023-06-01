import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/l10n/gen/l10n.dart';

extension ThemeExtension on BuildContext {
  Lang get lang => Lang.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;
}
