import 'package:flutter/material.dart';
import 'package:goggxi_portofolio/core/utils/extensions/context.dart';
import 'package:goggxi_portofolio/presentation/pages/design_page.dart';
import 'package:goggxi_portofolio/presentation/pages/desktop_web_page.dart';
import 'package:goggxi_portofolio/presentation/pages/home_page.dart';
import 'package:goggxi_portofolio/presentation/pages/mobile_apps_page.dart';
import 'package:goggxi_portofolio/presentation/pages/tutorial_page.dart';

class Menu {
  final String title;
  final String path;

  Menu({
    required this.title,
    required this.path,
  });

  static List<Menu> menus(BuildContext context) => [
        Menu(title: context.lang.home, path: HomePage.routeName),
        Menu(title: context.lang.mobileApps, path: MobileAppsPage.routeName),
        Menu(title: context.lang.desktopWeb, path: DesktopWebPage.routeName),
        Menu(title: context.lang.design, path: DesignPage.routeName),
        Menu(title: context.lang.tutorial, path: TutorialPage.routeName),
      ];
}
