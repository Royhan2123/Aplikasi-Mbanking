class CarouItemsModel {
  final String img;
  final String title;
  final String subTitle;

  CarouItemsModel({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<CarouItemsModel> listOfItem = [
  CarouItemsModel(
    img: "assets/images/onBoarding1.png",
    title: "To Build a Better Country",
    subTitle: "Our system is helping yo to\nachieve a better goal",
  ),
  CarouItemsModel(
    img: "assets/images/onBoarding2.png",
    title: "To Build a Good Portfolio",
    subTitle: "We provide tips for you so that\nyou can adapt easier",
  ),
  CarouItemsModel(
    img: "assets/images/onBoarding3.png",
    title: "Start To Feel a New Life",
    subTitle:
        "Start exploring the m-banking application\nand send your friends money",
  ),
];
