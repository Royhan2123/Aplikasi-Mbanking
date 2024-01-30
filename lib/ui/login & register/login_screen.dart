import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          headher(),
          bodys(),
        ],
      ),
    );
  }

  Widget headher() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's sign you in",
              style:
                  blueStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome back\nYou've been missed",
              style:
                  blueStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w100),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget bodys() {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TextFormField()],
      ),
    );
  }
}
