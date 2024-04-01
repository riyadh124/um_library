import 'package:get/get.dart';

import '../controllers/search_book_controller.dart';

class SearchBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchBookController>(
      () => SearchBookController(),
    );
  }
}
