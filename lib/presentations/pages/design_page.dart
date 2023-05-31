import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/presentations/widgets/section_app.dart';

class DesignPage extends StatelessWidget {
  const DesignPage({super.key});

  static const String routeName = '/design';

  @override
  Widget build(BuildContext context) {
    return SectionApp(
      child: Container(
        color: Colors.redAccent,
      ),
    );
  }
}
