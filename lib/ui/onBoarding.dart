import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();

  List<String> title = [
    "To Build a Better Country",
    "To Build a Good Portfolio",
    "Start To Feel a New Life"
  ];

  List<String> descripsi = [
    "Our system is helping yo to achieve a better goal",
    "We provide tips for you so that you can adapt easier",
    "Our system is helping yo to achieve a better goal"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
              Container(
                width: 250,
                height: 250,
                margin: const EdgeInsets.only(top: 86),
                decoration: BoxDecoration(
                  image: DecorationImage(image: 
                  AssetImage("assets/onBoarding1.png"),)
                ),
              ),
          ],
        ),
      ),
    );
  }
}
