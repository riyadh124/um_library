import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:um_library/app/env/colors.dart';
import 'package:um_library/app/modules/register/views/widgets/widget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              iconTheme: IconThemeData(color: Colors.white),
            ),
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
