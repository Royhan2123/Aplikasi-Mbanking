import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final TextEditingController txtUserName = TextEditingController(text: "");
  final TextEditingController txtFullName = TextEditingController(text: "");
  final TextEditingController txtEmail = TextEditingController(text: "");
  final TextEditingController txtPassword = TextEditingController(text: "");

  bool obsucureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Edit Photo",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtUserName,
                    cursorColor: black,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
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
                    height: 15,
                  ),
                  Text(
                    "Full name",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtFullName,
                    cursorColor: black,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
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
                    height: 15,
                  ),
                  Text(
                    "Email Addres",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtEmail,
                    cursorColor: black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: grey,
                          ),
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
                    height: 15,
                  ),
                  Text(
                    "Password",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtPassword,
                    cursorColor: black,
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
                            color: obsucureText ? grey : black,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: grey,
                          ),
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
                            backgroundColor: primary),
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
        ),);
  }
}
