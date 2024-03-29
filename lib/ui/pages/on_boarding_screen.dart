import 'package:animate_do/animate_do.dart';
import 'package:aplikasi_mbanking/models/carou_items_model.dart';
import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget animationDo(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: pageController,
                itemCount: listOfItem.length,
                onPageChanged: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        /// IMG
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                          width: 250,
                          height: 250,
                          child: animationDo(
                            index,
                            100,
                            Image.asset(
                              listOfItem[index].img,
                            ),
                          ),
                        ),

                        /// TITLE TEXT
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: animationDo(
                            index,
                            300,
                            Text(
                              listOfItem[index].title,
                              textAlign: TextAlign.center,
                              style: blackStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),

                        /// SUBTITLE TEXT
                        animationDo(
                          index,
                          500,
                          Text(
                            listOfItem[index].subTitle,
                            textAlign: TextAlign.center,
                            style: greyStyle.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            /// ---------------------------
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// PAGE INDICATOR
                  SmoothPageIndicator(
                    controller: pageController,
                    count: listOfItem.length,
                    effect: ExpandingDotsEffect(
                      spacing: 6.0,
                      radius: 10.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      expansionFactor: 3.8,
                      dotColor: Colors.grey,
                      activeDotColor: lightBlue,
                    ),
                    onDotClicked: (newIndex) {
                      setState(() {
                        currentIndex = newIndex;
                        pageController.animateToPage(newIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      });
                    },
                  ),
                  currentIndex == 2

                      /// GET STARTED BTN
                      ? GetStartBtn(size: size, textTheme: textTheme)

                      /// SKIP BTN
                      : SkipBtn(
                          size: size,
                          textTheme: textTheme,
                          onTap: () {
                            setState(() {
                              pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn);
                            });
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}