import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goggxi_portofolio/core/utils/extensions/context.dart';
import 'package:goggxi_portofolio/core/utils/extensions/padding.dart';
import 'package:goggxi_portofolio/core/utils/resources/images.dart';
import 'package:goggxi_portofolio/data/models/menu.dart';
import 'package:goggxi_portofolio/data/models/action.dart' as a;
import 'package:goggxi_portofolio/presentations/widgets/hover.dart';

String _getTitle(String path) {
  final menu = Menu.menus.firstWhere((menu) => menu.path == path);
  return menu.title == 'Home' ? 'Goggxi' : 'Goggxi - ${menu.title}';
}

class SidebarApp extends StatelessWidget {
  const SidebarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)?.settings.name ?? '';
    bool isSelected(String path) => routeName == path;
    return Title(
      title: _getTitle(routeName),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final isMobile = constraints.maxWidth < 800;
          return Container(
            width: context.width * 0.2,
            height: context.height,
            constraints: const BoxConstraints(
              minWidth: 280,
            ),
            color: Colors.grey[900],
            child: Column(
              crossAxisAlignment:
                  isMobile ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !isMobile,
                  child: InkWell(
                    onTap: () {
                      context.goNamed('/');
                    },
                    child: HoverBuilder(builder: (isHover) {
                      return Row(
                        children: [
                          RotationTransition(
                            turns: AlwaysStoppedAnimation(isHover ? 0.08 : 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                ResImages.logoLight,
                                width: 36,
                                height: 36,
                              ),
                            ),
                          ),
                          Text(
                            ' Goggxi',
                            style: context.textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: isHover ? FontWeight.bold : null,
                            ),
                          ),
                        ],
                      );
                    }),
                  ).paddingOnly(left: 26, top: 50, bottom: 30),
                ),
                Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    Menu.menus.length,
                    (index) {
                      final menu = Menu.menus[index];
                      return TextButton(
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          foregroundColor: isSelected(menu.path)
                              ? Colors.white
                              : Colors.grey[400],
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
                      ).paddingOnly(
                        left: isMobile ? 0 : 20,
                        right: isMobile ? 20 : 0,
                        bottom: 10,
                      );
                    },
                  ),
                ).paddingOnly(top: isMobile ? 40 : 0),
                const Spacer(),
                Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: a.Action.actions
                        .map(
                          (action) => HoverBuilder(builder: (isHover) {
                            return IconButton(
                              onPressed: () {},
                              icon: Icon(
                                action.icon,
                                color: isHover ? Colors.white : null,
                              ),
                              color: Colors.grey[400],
                              iconSize: isHover ? 20 : 18,
                              visualDensity: VisualDensity.compact,
                            );
                          }),
                        )
                        .toList(),
                  ).paddingOnly(bottom: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
