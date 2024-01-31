import 'package:animate_do/animate_do.dart';
import 'package:aplikasi_mbanking/models/item_models.dart';
import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

// CarouselController controller = CarouselController();
  // List<String> title = [
  //   "To Build a Better Country",
  //   "To Build a Good Portfolio",
  //   "Start To Feel a New Life"
  // ];

  // List<String> descripsi = [
  //   "Our system is helping yo to achieve a better goal",
  //   "We provide tips for you so that you can adapt easier",
  //   "Our system is helping yo to achieve a better goal"
  // ];

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
                        /// IMG
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                          width: size.width,
                          height: size.height / 2.5,
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

              // CarouselSlider(
              //   carouselController: controller,
              //   items: [
              //     Image.asset("assets/onBoarding1.png"),
              //     Image.asset("assets/onBoarding2.png"),
              //     Image.asset("assets/onBoarding3.png"),
              //   ],
              //   options: CarouselOptions(
              //     height: 200,
              //     viewportFraction: 1,
              //     enableInfiniteScroll: false,
              //     onPageChanged: (index, reason) {
              //       setState(() {
              //         currentIndex = index;
              //       });
              //     },
              //   ),
              // ),
              // const SizedBox(
              //   height: 130,
              // ),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              //   decoration: BoxDecoration(
              //     boxShadow: const [
              //       BoxShadow(
              //         color: Colors.grey,
              //         blurRadius: 20,
              //       ),
              //     ],
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Column(
              //     children: [
              //       Text(
              //         title[currentIndex],
              //         textAlign: TextAlign.center,
              //         style: blackStyle.copyWith(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 26,
              //       ),
              //       Text(
              //         descripsi[currentIndex],
              //         style: greyStyle.copyWith(
              //           fontSize: 16,
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //       SizedBox(
              //         height: currentIndex == 2 ? 50 : 50,
              //       ),
              //       Row(
              //         children: [
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: currentIndex == 0
              //                     ? const Color.fromARGB(255, 100, 106, 255)
              //                     : Colors.grey,
              //                 shape: BoxShape.circle),
              //             width: 15,
              //             height: 15,
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           ),
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: currentIndex == 1
              //                     ? const Color.fromARGB(255, 100, 106, 255)
              //                     : Colors.grey,
              //                 shape: BoxShape.circle),
              //             width: 15,
              //             height: 15,
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           ),
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: currentIndex == 2
              //                     ? const Color.fromARGB(255, 100, 106, 255)
              //                     : Colors.grey,
              //                 shape: BoxShape.circle),
              //             width: 15,
              //             height: 15,
              //           ),
              //           const Expanded(
              //             child: Column(),
              //           ),
              //           ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               minimumSize: const Size(120, 35),
              //             ),
              //             onPressed: () {
              //               setState(() {
              //                 controller.nextPage();
              //               });
              //             },
              //             child: Text(
              //               currentIndex == 2 ? "Get Started" : "Continue",
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
