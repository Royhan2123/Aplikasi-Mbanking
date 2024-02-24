import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/widget/shared_value.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          20,
        ),
        children: [
          headher(),
          bodys(),
        ],
      ),
    );
  }

  Widget headher() {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: blackStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Royhan",
                style: blackStyle.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "How are you today?",
                style: greyStyle.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: grey,
              image: const DecorationImage(
                image: AssetImage("assets/images/avatar.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodys() {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.maxFinite,
            height: 184,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: blues,
                  blurRadius: 15,
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/card_banking.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Royhan",
                  style: whiteStyle.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "**** **** **** 2004",
                  style: whiteStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 6),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Balance",
                  style: whiteStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  formatCurrency(45000000),
                  style: whiteStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
              color: Colors.black,
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/trasnfer.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
