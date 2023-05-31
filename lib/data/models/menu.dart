import 'package:goggxi_portofolio/presentations/pages/design_page.dart';
import 'package:goggxi_portofolio/presentations/pages/desktop_web_page.dart';
import 'package:goggxi_portofolio/presentations/pages/home_page.dart';
import 'package:goggxi_portofolio/presentations/pages/mobile_apps_page.dart';
import 'package:goggxi_portofolio/presentations/pages/tutorial_page.dart';

class Menu {
  final String title;
  final String path;

  Menu({
    required this.title,
    required this.path,
  });

  static List<Menu> get menus => [
        Menu(title: 'Home', path: HomePage.routeName),
        Menu(title: 'Mobile Apps', path: MobileAppsPage.routeName),
        Menu(title: 'Desktop & Web', path: DesktopWebPage.routeName),
        Menu(title: 'Design', path: DesignPage.routeName),
        Menu(title: 'Tutorial', path: TutorialPage.routeName),
      ];
}
