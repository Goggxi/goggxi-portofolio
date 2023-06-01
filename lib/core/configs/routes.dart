import 'package:go_router/go_router.dart';
import 'package:goggxi_portofolio/presentation/pages/design_page.dart';
import 'package:goggxi_portofolio/presentation/pages/desktop_web_page.dart';
import 'package:goggxi_portofolio/presentation/pages/home_page.dart';
import 'package:goggxi_portofolio/presentation/pages/mobile_apps_page.dart';
import 'package:goggxi_portofolio/presentation/pages/tutorial_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: HomePage.routeName,
      path: HomePage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        name: state.location,
        child: const HomePage(),
        transitionsBuilder: (_, __, ___, child) => child,
      ),
    ),
    GoRoute(
      name: MobileAppsPage.routeName,
      path: MobileAppsPage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        name: state.location,
        child: const MobileAppsPage(),
        transitionsBuilder: (_, __, ___, child) => child,
      ),
    ),
    GoRoute(
      name: DesktopWebPage.routeName,
      path: DesktopWebPage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        name: state.location,
        child: const DesktopWebPage(),
        transitionsBuilder: (_, __, ___, child) => child,
      ),
    ),
    GoRoute(
      name: DesignPage.routeName,
      path: DesignPage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        name: state.location,
        child: const DesignPage(),
        transitionsBuilder: (_, __, ___, child) => child,
      ),
    ),
    GoRoute(
      name: TutorialPage.routeName,
      path: TutorialPage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        name: state.location,
        child: const TutorialPage(),
        transitionsBuilder: (_, __, ___, child) => child,
      ),
    ),
  ],
);
