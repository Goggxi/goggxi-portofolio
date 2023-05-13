import 'package:flutter/material.dart';

const double _kAppBarHeight = 80;
const double _kPadding = 20;

class AppHeader {
  static PreferredSizeWidget primary(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(_kAppBarHeight),
      child: _AppBarPrimary(),
    );
  }
}

class _AppBarPrimary extends StatelessWidget {
  const _AppBarPrimary();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: _kAppBarHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 100) {
            return const SizedBox();
          }

          if (constraints.maxWidth > 1200) {
            return _buildDesktopMenu();
          } else if (constraints.maxWidth > 800) {
            return _buildTabletMenu();
          } else {
            return _buildMobileMenu();
          }
        },
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo-light.png',
          width: 50,
          height: 50,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _Menu.menus.length,
              (index) => TextButton(
                onPressed: () {},
                child: Text(_Menu.menus[index].title),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PopupMenuButton<_Menu>(
          icon: const Icon(Icons.menu),
          onSelected: (value) {},
          itemBuilder: (context) {
            return _Menu.menus.map((menu) {
              return PopupMenuItem(value: menu, child: Text(menu.title));
            }).toList();
          },
        ),
      ],
    );
  }

  Widget _buildTabletMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _Menu {
  String title;
  String path;

  _Menu({required this.title, required this.path});

  static List<_Menu> get menus => [
        _Menu(title: 'About', path: '/'),
        _Menu(title: 'Project', path: '/project'),
        _Menu(title: 'Blog', path: '/blog'),
      ];
}
