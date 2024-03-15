import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtUserName,
                  cursorColor: blackColor,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Full name",
                  style: blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtFullName,
                  cursorColor: blackColor,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Email Addres",
                  style: blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtEmail,
                  cursorColor: blackColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Password",
                  style: blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtPassword,
                  cursorColor: blackColor,
                  obscureText: obsucureText,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsucureText = !obsucureText;
                          });
                        },
                        icon: Icon(
                          obsucureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: obscureText ? grey : blac,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        animationDuration: const Duration(seconds: 2),
                        shape: const StadiumBorder(),
                        minimumSize: const Size(300, 45),
                        foregroundColor: blues,
                        backgroundColor: primary,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Update Now",
                        style: whiteStyle.copyWith(fontSize: 13),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
