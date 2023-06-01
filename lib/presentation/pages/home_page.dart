import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/presentation/widgets/section_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return SectionApp(
      child: const Center(child: Text('Home Page')),
    );
  }
}
