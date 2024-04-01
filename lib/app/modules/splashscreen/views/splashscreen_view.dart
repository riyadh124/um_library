import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  SplashscreenView({Key? key}) : super(key: key);
  SplashscreenController splashscreenController =
      Get.put(SplashscreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF551212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_stikom.png",
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
