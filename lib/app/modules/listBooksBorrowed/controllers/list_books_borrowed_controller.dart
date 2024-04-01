import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:um_library/app/services/authService.dart';

class ListBooksBorrowedController extends GetxController {
  //TODO: Implement ListBooksBorrowedController

  RxBool isListBooksBorrowedExist = false.obs;
  List listBooksBorrowed = [];

  setDataListBooksBorrowed(data) {
    listBooksBorrowed = data["data"];
    print("listBooksBorrowed : $listBooksBorrowed");
    isListBooksBorrowedExist.value = true;
    update();
  }

  formatDatetime(DateTime date) {
    var formated = DateFormat('dd MMMM, yyyy').format(date);
    return formated.toString();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    authService().getBorrowedBook(Get.context);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
