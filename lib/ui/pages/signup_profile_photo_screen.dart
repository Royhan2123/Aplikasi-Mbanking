import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_mbanking/bloc/auth_bloc.dart';
import 'package:aplikasi_mbanking/models/register_models.dart';
import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/ui/pages/singup_profile_verify_screen.dart';
import 'package:aplikasi_mbanking/widget/shared_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      imageQuality: 720,
    );

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    } else {
      // ignore: avoid_print
      print("Gagal mengambil gambar");
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
          inputImage(),
          inputPin(),
        ],
      ),
    );
  }

  Widget inputImage() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSucces) {
          return Center(
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
                          state.user.name.toString(),
                          style: blackStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget inputPin() {
    return Column(
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
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSucces) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpProfileVerifyScreen(
                      data: widget.data.copyWith(
                        pin: txtPin.text,
                        profilePicture: selectedImage == null
                            ? null
                            // ignore: prefer_interpolation_to_compose_strings
                            : 'data:image/png;base64,' +
                                base64Encode(
                                  File(selectedImage!.path).readAsBytesSync(),
                                ),
                      ),
                    ),
                  ),
                );
              } else if (state is AuthFailed) {
                showCustomSnackbar(
                  context,
                  state.e,
                );
              }
            },
            builder: (context, state) {
              return ElevatedButton(
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
                      const SnackBar(
                        content: Text(
                          "Tolong Masukkan Pin Anda",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    context.read<AuthBloc>().add(
                          AuthRegister(
                            widget.data.copyWith(
                              pin: txtPin.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  // ignore: prefer_interpolation_to_compose_strings
                                  : 'data:image/png;base64,' +
                                      base64Encode(
                                        File(selectedImage!.path)
                                            .readAsBytesSync(),
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
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
