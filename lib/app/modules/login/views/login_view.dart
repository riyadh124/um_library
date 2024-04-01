import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:um_library/app/env/colors.dart';
import 'package:um_library/app/modules/login/views/widgets/widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(top: 80, child: buildTop(context)),
                Positioned(bottom: 0, child: buildBottom(context))
              ],
            )));
  }
}
