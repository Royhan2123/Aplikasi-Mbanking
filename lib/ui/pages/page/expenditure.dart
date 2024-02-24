import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';

class Expenditure extends StatefulWidget {
  const Expenditure({super.key});

  @override
  State<Expenditure> createState() => _ExpenditureState();
}

class _ExpenditureState extends State<Expenditure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          20,
        ),
        children: [
          bodys(),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pengeluaran Perbulan",
            style: blackStyle.copyWith(
              fontSize: 15,
            ),
          ),
          Image.asset(
            "assets/images/statistik.png",
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: 360,
          ),
          Text(
            "Pengeluaran Pertahun",
            style: blackStyle.copyWith(
              fontSize: 15,
            ),
          ),
          Container(
            width: 385,
            height: 355,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/statistika.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
