import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:goggxi_portofolio/core/utils/extensions/context.dart';
import 'package:goggxi_portofolio/presentation/widgets/section_app.dart';

class MobileAppsPage extends StatefulWidget {
  const MobileAppsPage({super.key});

  static const String routeName = '/mobile-apps';

  @override
  State<MobileAppsPage> createState() => _MobileAppsPageState();
}

class _MobileAppsPageState extends State<MobileAppsPage> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _visible = ValueNotifier<bool>(false);

  @override
  void initState() {
    _scrollController.addListener(() {
      ScrollDirection direcs = _scrollController.position.userScrollDirection;
      if (direcs == ScrollDirection.forward ||
          direcs == ScrollDirection.reverse) {
        _visible.value = false;
      }
      _scrollController.position.isScrollingNotifier.addListener(() {
        bool on = _scrollController.position.isScrollingNotifier.value;
        bool off = _scrollController.offset > context.width / 2;
        if (on == false) {
          if (direcs == ScrollDirection.forward && off) {
            _visible.value = true;
          } else {
            _visible.value = false;
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionApp(
      child: Scaffold(
        body: GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'App ${index + 1}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            );
          },
        ),
        floatingActionButton: ValueListenableBuilder(
          valueListenable: _visible,
          builder: (_, value, __) {
            return Visibility(
              visible: value,
              child: FloatingActionButton(
                mini: true,
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child: const Icon(Icons.arrow_upward_rounded),
              ),
            );
          },
        ),
      ),
    );
  }
}
