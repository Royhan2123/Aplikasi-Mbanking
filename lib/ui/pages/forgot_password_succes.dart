import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSucces extends StatelessWidget {
  const ForgotPasswordSucces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/forgotPasswordSucces.png"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Password Berhasil Di Ganti 🎉🎉",
              style: blackStyle.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                animationDuration: const Duration(seconds: 3),
                backgroundColor: blues,
                minimumSize: const Size(
                  250,
                  35,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                foregroundColor: primary,
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/loginScreen",
                  (route) => false,
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
