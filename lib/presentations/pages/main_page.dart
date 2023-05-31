import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goggxi_portofolio/core/utils/extensions/context.dart';
import 'package:goggxi_portofolio/core/utils/extensions/padding.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _menus = ValueNotifier(_Menu.menus);

  @override
  void dispose() {
    _menus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
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
                ValueListenableBuilder(
                  valueListenable: _menus,
                  builder: (_, menus, __) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        menus.length,
                        (index) {
                          final menu = menus[index];
                          return TextButton(
                            style: TextButton.styleFrom(
                              visualDensity: VisualDensity.compact,
                              foregroundColor: menu.isSelected
                                  ? Colors.white
                                  : Colors.grey[400],
                              textStyle:
                                  context.textTheme.titleMedium?.copyWith(
                                fontWeight: menu.isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w200,
                              ),
                            ),
                            onPressed: () {
                              _menus.value = _menus.value.map((e) {
                                if (e.title == menu.title) {
                                  return _Menu(
                                    title: e.title,
                                    isSelected: true,
                                  );
                                } else {
                                  return _Menu(
                                    title: e.title,
                                    isSelected: false,
                                  );
                                }
                              }).toList();
                            },
                            child: Text(menu.title),
                          ).paddingOnly(left: 20, bottom: 10);
                        },
                      ),
                    );
                  },
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
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Menu {
  final String title;
  bool isSelected;

  _Menu({
    required this.title,
    required this.isSelected,
  });

  static List<_Menu> get menus => [
        _Menu(title: 'Home', isSelected: true),
        _Menu(title: 'Mobile Apps', isSelected: false),
        _Menu(title: 'Desktop & Web', isSelected: false),
        _Menu(title: 'Design', isSelected: false),
        _Menu(title: 'Tutorial', isSelected: false),
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
