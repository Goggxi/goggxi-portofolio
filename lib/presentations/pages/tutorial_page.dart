import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/presentations/widgets/section_app.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  static const String routeName = '/tutorial';

  @override
  Widget build(BuildContext context) {
    return SectionApp(
      child: Container(
        color: Colors.greenAccent,
      ),
    );
  }
}
