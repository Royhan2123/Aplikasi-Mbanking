import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/ui/pages/page/account_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/page/favorit.dart';
import 'package:aplikasi_mbanking/ui/pages/page/home_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/page/search_screen.dart';
import 'package:flutter/material.dart';

class HalamanBottom extends StatefulWidget {
  const HalamanBottom({super.key});

  @override
  State<HalamanBottom> createState() => _HalamanBottomState();
}

class _HalamanBottomState extends State<HalamanBottom> {
  final list = const [
    HomeScreen(),
    SearchScreen(),
    Favorit(),
    AccountScreen(),
  ];
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: list[curentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.cyan,
          unselectedItemColor: grey,
          showSelectedLabels: true,
          currentIndex: curentIndex,
          onTap: (value) => setState(() {
            curentIndex = value;
          }),
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorit",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
