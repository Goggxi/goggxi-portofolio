import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:goggxi_portofolio/core/utils/extensions/context.dart';
import 'package:goggxi_portofolio/core/utils/extensions/padding.dart';
import 'package:goggxi_portofolio/presentations/pages/design_page.dart';
import 'package:goggxi_portofolio/presentations/pages/desktop_web_page.dart';
import 'package:goggxi_portofolio/presentations/pages/home_page.dart';
import 'package:goggxi_portofolio/presentations/pages/mobile_apps_page.dart';
import 'package:goggxi_portofolio/presentations/pages/tutorial_page.dart';

class SidebarApp extends StatelessWidget {
  const SidebarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)?.settings.name ?? '';
    bool isSelected(String path) => routeName == path;
    return Container(
      width: context.width * 0.2,
      height: context.height,
      constraints: const BoxConstraints(
        minWidth: 280,
      ),
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'GOGGXI',
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ).paddingOnly(left: 26, top: 50, bottom: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _Menu.menus.length,
              (index) {
                final menu = _Menu.menus[index];
                return TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor:
                        isSelected(menu.path) ? Colors.white : Colors.grey[400],
                    textStyle: context.textTheme.titleMedium?.copyWith(
                      fontWeight: isSelected(menu.path)
                          ? FontWeight.bold
                          : FontWeight.w200,
                    ),
                  ),
                  onPressed: () {
                    if (isSelected(menu.path)) return;
                    context.goNamed(menu.path);
                  },
                  child: Text(menu.title),
                ).paddingOnly(left: 20, bottom: 10);
              },
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _Action.actions
                .map(
                  (action) => IconButton(
                    onPressed: () {},
                    icon: Icon(action.icon),
                    color: Colors.grey[400],
                    iconSize: 18,
                    visualDensity: VisualDensity.compact,
                  ),
                )
                .toList(),
          ).paddingOnly(bottom: 20),
        ],
      ),
    );
  }
}

class _Menu {
  final String title;
  final String path;

  _Menu({
    required this.title,
    required this.path,
  });

  static List<_Menu> get menus => [
        _Menu(title: 'Home', path: HomePage.routeName),
        _Menu(title: 'Mobile Apps', path: MobileAppsPage.routeName),
        _Menu(title: 'Desktop & Web', path: DesktopWebPage.routeName),
        _Menu(title: 'Design', path: DesignPage.routeName),
        _Menu(title: 'Tutorial', path: TutorialPage.routeName),
      ];
}

class _Action {
  final String title;
  final IconData icon;
  final String path;

  _Action({
    required this.title,
    required this.icon,
    required this.path,
  });

  static List<_Action> get actions => [
        _Action(title: 'Youtube', icon: FontAwesomeIcons.youtube, path: ''),
        _Action(title: 'Facebook', icon: FontAwesomeIcons.facebook, path: ''),
        _Action(title: 'Instagram', icon: FontAwesomeIcons.instagram, path: ''),
        _Action(title: 'Linkedin', icon: FontAwesomeIcons.linkedin, path: ''),
        _Action(title: 'Twitter', icon: FontAwesomeIcons.twitter, path: ''),
        _Action(title: 'Github', icon: FontAwesomeIcons.github, path: ''),
      ];
}
