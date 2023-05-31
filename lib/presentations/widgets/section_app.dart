import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/presentations/widgets/sidebar.dart';

class SectionApp extends StatelessWidget {
  const SectionApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [const SidebarApp(), Expanded(child: child)],
      ),
    );
  }
}
