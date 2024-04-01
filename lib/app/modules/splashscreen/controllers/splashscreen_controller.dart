import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:um_library/app/modules/home/views/home_view.dart';
import 'package:um_library/app/modules/login/views/login_view.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration(seconds: 1),
      () async {
        if (box.read("token") == null) {
          Get.off(LoginView());
        } else {
          Get.off(HomeView());
        }
      },
    );
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
