import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:um_library/app/services/authService.dart';
import 'package:um_library/app/widgets/button.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  UpdateProfileView({Key? key}) : super(key: key);
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Profile'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                controller: updateProfileController.nimController,
                readOnly: false,
                decoration: const InputDecoration(
                  labelText: 'Nomor Induk Mahasiswa',
                  prefixIcon: Icon(Icons.person),
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: updateProfileController.ktmController,
                readOnly: false,
                decoration: const InputDecoration(
                  labelText: 'No KTM / No KTP',
                  prefixIcon: Icon(Icons.person),
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: updateProfileController.noTeleponController,
                readOnly: false,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  prefixIcon: Icon(Icons.call),
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              PrimaryButton(
                  text: "Simpan",
                  onTap: () {
                    authService().updateUser(
                        context,
                        updateProfileController.nimController.text,
                        updateProfileController.ktmController.text,
                        updateProfileController.noTeleponController.text);
                  })
            ],
          ),
        ));
  }
}
