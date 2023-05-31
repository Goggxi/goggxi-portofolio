import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/presentations/widgets/section_app.dart';

class DesktopWebPage extends StatelessWidget {
  const DesktopWebPage({super.key});

  static const String routeName = '/desktop-web';

  @override
  Widget build(BuildContext context) {
    return SectionApp(
      child: Container(
        color: Colors.orangeAccent,
      ),
    );
  }
}
