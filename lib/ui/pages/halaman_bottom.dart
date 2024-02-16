import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/ui/pages/page/account_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/page/history_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/page/home_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/page/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HalamanBottom extends StatefulWidget {
  const HalamanBottom({super.key});

  @override
  State<HalamanBottom> createState() => _HalamanBottomState();
}

class _HalamanBottomState extends State<HalamanBottom> {
  final controller = PersistentTabController(initialIndex: 0);
  final listBottom = const [
    HomeScreen(),
    SearchScreen(),
    HistoryScreen(),
    AccountScreen(),
  ];

  List<PersistentBottomNavBarItem> bottomBar() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: lightPrimary,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: lightPrimary,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.my_library_add_rounded),
        title: ("History"),
        activeColorPrimary: lightPrimary,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: ("Account"),
        activeColorPrimary: lightPrimary,
        inactiveColorPrimary: grey,
      ),
    ];
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listBottom[currentIndex],
      bottomNavigationBar: PersistentTabView(
        context,
        screens: listBottom,
        items: bottomBar(),
        navBarStyle: NavBarStyle.style3,
        backgroundColor: Colors.white,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutCirc,
        ),
        controller: controller,
      ),
    );
  }
}
