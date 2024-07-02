import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_mbanking/models/register_models.dart';
import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/ui/pages/singup_profile_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfilePhotoScreen extends StatefulWidget {
  final RegisterModels data;
  const SignUpProfilePhotoScreen({
    super.key,
    required this.data,
  });

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
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
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
      body: ListView(
        children: [
          Center(
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
                            setState(
                              () {
                                selectImage();
                              },
                            );
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
                          widget.data.name.toString(),
                          style: blackStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
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
                          contentPadding: const EdgeInsets.all(12),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          animationDuration: const Duration(
                            seconds: 3,
                          ),
                          backgroundColor: blues,
                          minimumSize: const Size(
                            350,
                            35,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          foregroundColor: primary,
                        ),
                        onPressed: () {
                          if (txtPin.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Field PIN harus diisi',
                                ),
                                backgroundColor: redColor,
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpProfileVerifyScreen(
                                  data: widget.data.copyWith(
                                    profilePicture: selectedImage == null
                                        ? null
                                        // ignore: prefer_interpolation_to_compose_strings
                                        : 'data:image/png;base64,' +
                                            base64Encode(
                                              File(selectedImage!.path)
                                                  .readAsBytesSync(),
                                            ),
                                    pin: txtPin.text,
                                  ),
                                ),
                              ),
                            );
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
