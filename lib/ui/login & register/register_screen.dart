import 'package:flutter/material.dart';
import 'package:aplikasi_mbanking/style/color/style_color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsucred = true;
  bool colorGmail = false;
  bool colorPassword = false;
  final txtName = TextEditingController(text: "");
  final txtEmail = TextEditingController(text: "");
  final txtPassword = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Image.asset("assets/images/background.png"),
          loginScreen(),
        ],
      ),
    );
  }

  Widget loginScreen() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        headher(),
        const SizedBox(
          height: 30,
        ),
        bodys(),
        foots(),
      ],
    );
  }

  Widget headher() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 95),
        child: Text(
          "Register Your Account",
          style: blackStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget bodys() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 12,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: blackStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: txtName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(10),
                hintText: "enter your name",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: blues,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: blackStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            Focus(
              onFocusChange: (value) {
                setState(() {
                  colorGmail = value;
                });
              },
              child: TextFormField(
                controller: txtEmail,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "name@example.com",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: blues,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                    color: colorGmail ? blues : Colors.black,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: blackStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            Focus(
              onFocusChange: (value) {
                setState(() {
                  colorPassword = value;
                });
              },
              child: TextFormField(
                controller: txtPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "enter your password",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: blues,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsucred = !obsucred;
                      });
                    },
                    icon: Icon(
                      obsucred ? Icons.visibility_off : Icons.visibility,
                      color: colorPassword ? blues : Colors.black,
                    ),
                  ),
                ),
                obscureText: obsucred,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  animationDuration: const Duration(seconds: 3),
                  backgroundColor: blues,
                  minimumSize: const Size(
                    350,
                    35,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  foregroundColor: primary,
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foots() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "--- or login with ---",
              style: greyStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/x.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/google.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/github.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "already have account?",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/loginScreen",
                    );
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
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
