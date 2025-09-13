import 'package:flutter/material.dart';

import '../settings/settings.dart';
import '../state/state.dart';
import 'base_layout.dart';

class MobileLayout extends StatelessWidget implements BaseLayout {
  const MobileLayout({
    super.key,
    required this.navigationBuilder,
    required this.addonsBuilder,
    required this.knobsBuilder,
    required this.argsBuilder,
    required this.workbench,
  });

  final Widget Function(BuildContext context) navigationBuilder;
  final List<Widget> Function(BuildContext context) addonsBuilder;
  final List<Widget> Function(BuildContext context) knobsBuilder;
  final List<Widget> Function(BuildContext context) argsBuilder;
  final Widget workbench;

  @override
  Widget build(BuildContext context) {
    final state = WidgetbookState.of(context);
    final h = MediaQuery.sizeOf(context).height;
    final isTiny = h < 320; // tune threshold as you like

    void onTap(int index) {
      showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          switch (index) {
            case 0:
              return navigationBuilder(context);
            case 1:
              return MobileSettingsPanel(name: 'Addons', builder: addonsBuilder);
            case 2:
              return state.isNext
                  ? MobileSettingsPanel(name: 'Args', builder: argsBuilder)
                  : MobileSettingsPanel(name: 'Knobs', builder: knobsBuilder);
            default:
              return const SizedBox.shrink();
          }
        },
      );
    }

    return Scaffold(
      key: ValueKey(state.isNext),
      body: const SafeArea(child: SizedBox.expand(child: Placeholder())), // your workbench
      // Hide bottom bar when vertical space is too small; offer a FAB instead.
      bottomNavigationBar: isTiny ? null : _BottomBar(state: state, onTap: onTap),
      floatingActionButton: isTiny
          ? FloatingActionButton(
        onPressed: () => onTap(0),
        tooltip: 'Menu',
        child: const Icon(Icons.menu),
      )
          : null,
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.state, required this.onTap});
  final WidgetbookState state;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight, // ensure enough height
      child: ClipRect( // avoid yellow/black overflow paint in extreme constraints
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 22,
          items: [
            const BottomNavigationBarItem(
              label: 'Navigation',
              icon: Icon(Icons.list_outlined),
            ),
            const BottomNavigationBarItem(
              label: 'Addons',
              icon: Icon(Icons.dashboard_customize_outlined),
            ),
            BottomNavigationBarItem(
              label: state.isNext ? 'Args' : 'Knobs',
              icon: const Icon(Icons.tune_outlined),
            ),
          ],
          onTap: onTap,
        ),
      ),
    );
  }
}
