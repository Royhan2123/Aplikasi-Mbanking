
import 'package:aplikasi_mbanking/ui/login%20&%20register/login_screen.dart';
import 'package:aplikasi_mbanking/ui/onBoarding.dart';
import 'package:aplikasi_mbanking/ui/splash_screen.dart';
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
