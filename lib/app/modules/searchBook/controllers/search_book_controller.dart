import 'package:get/get.dart';

class SearchBookController extends GetxController {
  //TODO: Implement SearchBookController

  RxBool isBookExist = false.obs;
  var dataBook;

  setDataBook(data) {
    print("data  : ${data["data"]}");
    dataBook = data["data"];
    print("data book : $dataBook");
    isBookExist.value = true;
    update();
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
