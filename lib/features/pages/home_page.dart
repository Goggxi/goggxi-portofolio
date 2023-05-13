import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/features/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.primary(context),
    );
  }
}
