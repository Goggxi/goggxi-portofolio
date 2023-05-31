import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/core/utils/extensions/context.dart';
import 'package:goggxi_portofolio/core/utils/resources/images.dart';
import 'package:goggxi_portofolio/presentations/widgets/sidebar.dart';

class SectionApp extends StatelessWidget {
  SectionApp({super.key, required this.child});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth < 172) {
          return const SizedBox();
        }

        if (constraints.maxWidth < 800) {
          return Scaffold(
            key: _key,
            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      ResImages.logoLight,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Text(
                    ' Goggxi',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _key.currentState?.openEndDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
            endDrawer: const SidebarApp(),
            endDrawerEnableOpenDragGesture: false,
            body: child,
          );
        }

        return Scaffold(
          body: Row(
            children: [const SidebarApp(), Expanded(child: child)],
          ),
        );
      },
    );
  }
}
