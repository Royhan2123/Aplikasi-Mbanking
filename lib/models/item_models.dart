class ItemsModel {
  final String img;
  final String title;
  final String subTitle;

  ItemsModel({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<ItemsModel> listOfItem = [
  ItemsModel(
    img: "assets/onBoarding1.png",
    title: "To Build a Better Country",
    subTitle: "Our system is helping yo to\nachieve a better goal",
  ),
  ItemsModel(
    img: "assets/onBoarding2.png",
    title: "To Build a Good Portfolio",
    subTitle: "We provide tips for you so that\nyou can adapt easier",
  ),
  ItemsModel(
    img: "assets/onBoarding3.png",
    title: "Start To Feel a New Life",
    subTitle:
        "Start exploring the m-banking application\nand send your friends money",
  ),
];
