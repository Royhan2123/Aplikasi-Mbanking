import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_mbanking/bloc/auth_bloc.dart';
import 'package:aplikasi_mbanking/models/register_models.dart';
import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:aplikasi_mbanking/ui/pages/halaman_bottom.dart';
import 'package:aplikasi_mbanking/widget/shared_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfileVerifyScreen extends StatefulWidget {
  final RegisterModels data;
  const SignUpProfileVerifyScreen({
    super.key,
    required this.data,
  });

  @override
  State<SignUpProfileVerifyScreen> createState() =>
      _SignUpProfileVerifyScreenState();
}

class _SignUpProfileVerifyScreenState extends State<SignUpProfileVerifyScreen> {
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
    if (selectedImage == null) {
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
          'Verify Your Account',
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
                  Text(
                    "Input your identification card",
                    style: blackStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
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
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSucces) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HalamanBottom(),
                            ),
                            (route) => false,
                          );
                        } else if (state is AuthFailed) {
                          showCustomSnackbar(
                            context,
                            state.e,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
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
                                    "Tolong Masukkan Gambar Anda",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              context.read<AuthBloc>().add(
                                    AuthRegister(
                                      widget.data.copyWith(
                                        ktp:
                                            'data:image/png;base64,${base64Encode(
                                          File(selectedImage!.path)
                                              .readAsBytesSync(),
                                        )}',
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
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HalamanBottom(),
                          ),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: greyStyle.copyWith(
                            fontSize: 19, fontWeight: FontWeight.w600),
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
