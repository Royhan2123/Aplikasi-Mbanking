import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                carouselController: controller,
                items: [
                  Image.asset("assets/onBoarding1.png"),
                  Image.asset("assets/onBoarding2.png"),
                  Image.asset("assets/onBoarding3.png"),
                ],
                options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      title[currentIndex],
                      textAlign: TextAlign.center,
                      style: blackStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      descripsi[currentIndex],
                      style: greyStyle.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: currentIndex == 2 ? 38 : 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
