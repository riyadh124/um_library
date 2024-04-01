import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:um_library/app/modules/login/views/login_view.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  GetStorage box = GetStorage();

  void logout() {
    box.remove("token");
    box.remove("userData");
    Get.offAll(LoginView());
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
