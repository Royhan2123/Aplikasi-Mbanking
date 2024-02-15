import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/ui/pages/page/account_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/page/home_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/page/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HalamanBottom extends StatefulWidget {
  const HalamanBottom({super.key});

  @override
  State<HalamanBottom> createState() => _HalamanBottomState();
}

class _HalamanBottomState extends State<HalamanBottom> {
  final listBottom = const [
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: listBottom,
      ),
      bottomNavigationBar: Container(
        color: blues,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: currentIndex,
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: "Home",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.account_circle_rounded,
                text: "Account",
              ),
            ],
            gap: 8,
            backgroundColor: blues,
            color: lightBlue,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(255, 36, 106, 225),
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
