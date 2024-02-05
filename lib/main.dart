
import 'package:aplikasi_mbanking/ui/login%20&%20register/login_screen.dart';
import 'package:aplikasi_mbanking/ui/login%20&%20register/register_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/forgot_password_screen.dart';
import 'package:aplikasi_mbanking/ui/pages/forgot_password_succes.dart';
import 'package:aplikasi_mbanking/ui/pages/signup_profile_photo_screen.dart';
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
          "/forgotPasswordScreen": (context) => const ForgotPasswordScreen(),
          "/forgotPasswordSucces": (context) => const ForgotPasswordSucces(),
          "/signUpProfileScreen": (context) => const SignUpProfilePhotoScreen(),
          "/signupProfilePhotoScreen": (context) => const SignUpProfilePhotoScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
