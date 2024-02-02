
import 'package:aplikasi_mbanking/ui/login%20&%20register/login_screen.dart';
import 'package:aplikasi_mbanking/ui/login%20&%20register/register_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/on_boarding_screen.dart';
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
          "/onBoardingScreen": (context) => const OnBoardingScreen(),
          "/loginScreen": (context) => const LoginScreen(),
          "/registerScreen": (context) => const RegisterScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
