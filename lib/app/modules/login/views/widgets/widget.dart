import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_library/app/env/colors.dart';
import 'package:um_library/app/modules/login/controllers/login_controller.dart';
import 'package:um_library/app/modules/register/views/register_view.dart';
import 'package:um_library/app/services/authService.dart';
import 'package:um_library/app/widgets/button.dart';

LoginController loginController = Get.put(LoginController());

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
      'Masuk',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    buildGreyText("Silahkan Masukan Data Login"),
    const SizedBox(height: 40),
    buildGreyText('Email'),
    TextField(
      controller: loginController.emailController,
      decoration: const InputDecoration(),
    ),
    const SizedBox(height: 10),
    buildGreyText('Password'),
    Obx(
      () => TextField(
        controller: loginController.passwordController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => loginController.isPassword.value =
                !loginController.isPassword.value,
            icon: loginController.isPassword.value
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.visibility_off),
          ),
        ),
        obscureText: loginController.isPassword.value,
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
              text: "Masuk",
              onTap: () {
                authService().login(context);
              })),
      SizedBox(
        width: 8,
      ),
      Expanded(
          child: SecondaryButton(
              text: "Daftar",
              onTap: () {
                Get.to(RegisterView());
              }))
    ],
  );
}
