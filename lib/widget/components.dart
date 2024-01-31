import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';

class GetStartBtn extends StatefulWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  State<GetStartBtn> createState() => _GetStartBtnState();
}

class _GetStartBtnState extends State<GetStartBtn> {
  bool isLoading = false;

  loadingHandler() {
    setState(
      () {
        isLoading = true;
        Future.delayed(
          const Duration(seconds: 2),
        ).then(
          (value) {
            isLoading = false;
            Navigator.pushNamedAndRemoveUntil(
                context, "/loginScreen", (route) => false);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        animationDuration: const Duration(seconds: 3),
        foregroundColor: Colors.purple,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: const Size(250, 45),
      ),
      onPressed: () {
        loadingHandler();
      },
      child: Center(
        child: isLoading
            ? const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              )
            : Text(
                "Get Started now",
                style: whiteStyle.copyWith(fontSize: 15),
              ),
      ),
    );
  }
}

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          animationDuration: const Duration(seconds: 3),
          foregroundColor: Colors.purple,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minimumSize: const Size(250, 45),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          "Skip",
          style: whiteStyle.copyWith(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
