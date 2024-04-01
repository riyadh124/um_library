import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:um_library/app/env/colors.dart';
import 'package:um_library/app/modules/updateProfile/views/update_profile_view.dart';
import 'package:um_library/app/widgets/button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFEFEFE),
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (c) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 30,
                            backgroundColor: primaryColor,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  "assets/images/student.png",
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${profileController.box.read("userData")["name"]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "${profileController.box.read("userData")["nim"]}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No KTP / No KTM",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${profileController.box.read("userData")["ktm"]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "No Telepon",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${profileController.box.read("userData")["no_telepon"]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${profileController.box.read("userData")["email"]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SecondaryButton(
                            text: "Edit Profile",
                            onTap: () {
                              Get.to(UpdateProfileView());
                            }),
                        SizedBox(
                          height: 8,
                        ),
                        PrimaryButton(
                            text: "Keluar",
                            onTap: () {
                              profileController.logout();
                            })
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
