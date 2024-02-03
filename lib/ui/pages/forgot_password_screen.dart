import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          body(),
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 250,
            height: 250,
            margin: const EdgeInsets.only(top: 150),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/forgotPasswordLogo.png"),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(
          height: 55,
        ),
        Text(
          "Enter Your OTP Code",
          style: blackStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Enter the OTP code send to :",
          style: blackStyle.copyWith(
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "name@example.com",
          style: greyStyle.copyWith(
            fontSize: 17,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 55,
              width: 55,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLines: 1,
                controller: firstController,
                onChanged: (text) {
                  if (text.length == 1) {
                    FocusScope.of(context).requestFocus(secondFocusNode);
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                ],
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLines: 1,
                controller: secondController,
                onChanged: (text) {
                  if (text.length == 1) {
                    FocusScope.of(context).requestFocus(thirdFocusNode);
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                ],
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLines: 1,
                controller: thirdController,
                onChanged: (text) {
                  if (text.length == 1) {
                    FocusScope.of(context).requestFocus(fourthFocusNode);
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                ],
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLines: 1,
                controller: fourthController,
                onChanged: (text) {
                  // Handle submission if needed
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
