import 'dart:io';
import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfilePhotoScreen extends StatefulWidget {
  const SignUpProfilePhotoScreen({super.key});

  @override
  State<SignUpProfilePhotoScreen> createState() =>
      _SignUpProfilePhotoScreenState();
}

class _SignUpProfilePhotoScreenState extends State<SignUpProfilePhotoScreen> {
  final txtPin = TextEditingController(
    text: "",
  );
  XFile? selectedImage;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    } else {
      // ignore: avoid_print
      print("Gagal mengambil gambar");
    }
  }

  bool validate() {
    if (txtPin.text.length < 6) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Input Your Photo',
          style: blackStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 12,
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          selectImage();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 45),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightGrey,
                          image: selectedImage == null
                              ? null
                              : DecorationImage(
                                  image: FileImage(
                                    File(selectedImage!.path),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Icon(
                                  Icons.image,
                                  color: grey,
                                  size: 50,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Royhan",
                      style: blackStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Set your pin",
                    style: blackStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: txtPin,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "enter your pin 6 digit",
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.number,
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
                      onPressed: () {
                        if (validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Tolong Masukkan Pin Anda",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Navigator.pushNamed(
                              context, "/signUpProfileVerifyScreen");
                        }
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
