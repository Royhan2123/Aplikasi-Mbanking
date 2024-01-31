
import 'package:aplikasi_mbanking/ui/login%20&%20register/login_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/on_boarding.dart';
import 'package:aplikasi_mbanking/ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MainActivity(),
  );
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
          "/splashScreen": (context) => const SplashScreen(),
          "/onBoarding": (context) => const OnBoarding(),
          "/loginScreen": (context) => const LoginScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
