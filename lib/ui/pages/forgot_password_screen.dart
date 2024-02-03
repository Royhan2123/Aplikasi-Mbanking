import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();

  @override
  void dispose() {
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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
        const SizedBox(
          height: 20,
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
                focusNode: firstFocusNode,
                onFieldSubmitted: (term) {
                  _fieldFocusChange(context, firstFocusNode, secondFocusNode);
                },
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLines: 1,
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
                focusNode: secondFocusNode,
                onFieldSubmitted: (term) {
                  _fieldFocusChange(context, secondFocusNode, thirdFocusNode);
                },
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLines: 1,
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
                focusNode: thirdFocusNode,
                onFieldSubmitted: (term) {
                  _fieldFocusChange(context, thirdFocusNode, fourthFocusNode);
                },
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLines: 1,
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
                focusNode: fourthFocusNode,
                
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              animationDuration: const Duration(seconds: 3),
              backgroundColor: blues,
              minimumSize: const Size(
                200,
                35,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              foregroundColor: primary,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/forgotPasswordSucces",
              );
            },
            child: const Text(
              "Verify",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
