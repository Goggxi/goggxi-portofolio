// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/l10n/gen/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/configs/routes.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Goggxi',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        textTheme: GoogleFonts.sourceSansProTextTheme(),
      ),
      locale: const Locale('id'),
      localizationsDelegates: Lang.localizationsDelegates,
      supportedLocales: Lang.supportedLocales,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
    );
  }
}
