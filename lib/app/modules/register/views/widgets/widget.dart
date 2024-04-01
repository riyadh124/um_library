import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_library/app/modules/register/controllers/register_controller.dart';
import 'package:um_library/app/services/authService.dart';
import 'package:um_library/app/widgets/button.dart';

RegisterController registerController = Get.put(RegisterController());

Widget buildTop(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image(
              image: AssetImage(
                "assets/images/bg.jpg",
              ),
              fit: BoxFit.cover,
            ),
          )
        ],
      ));
}

Widget buildBottom(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: buildForm(context),
        ),
      ));
}

Widget buildForm(context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      'Daftar',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    buildGreyText("Silahkan Masukan Data Registrasi"),
    const SizedBox(height: 40),
    buildGreyText('Nama Lengkap'),
    TextField(
      controller: registerController.nameController,
      decoration: const InputDecoration(),
    ),
    const SizedBox(height: 10),
    buildGreyText('Email'),
    TextField(
      controller: registerController.emailController,
      decoration: const InputDecoration(),
    ),
    const SizedBox(height: 10),
    buildGreyText('Password'),
    Obx(
      () => TextField(
        controller: registerController.passwordController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => registerController.isPassword.value =
                !registerController.isPassword.value,
            icon: registerController.isPassword.value
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.visibility_off),
          ),
        ),
        obscureText: registerController.isPassword.value,
      ),
    ),
    const SizedBox(height: 10),
    buildLoginButton(context),
    const SizedBox(height: 5)
  ]);
}

Widget buildGreyText(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.grey),
  );
}

Widget buildLoginButton(context) {
  return Row(
    children: [
      Expanded(
          child: PrimaryButton(
              text: "Daftar",
              onTap: () {
                authService().register(context);
              })),
    ],
  );
}
