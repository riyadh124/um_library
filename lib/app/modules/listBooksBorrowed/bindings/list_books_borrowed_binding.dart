import 'package:get/get.dart';

import '../controllers/list_books_borrowed_controller.dart';

class ListBooksBorrowedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListBooksBorrowedController>(
      () => ListBooksBorrowedController(),
    );
  }
}
