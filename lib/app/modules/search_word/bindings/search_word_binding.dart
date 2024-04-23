import 'package:get/get.dart';

import '../controllers/search_word_controller.dart';

class SearchWordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchWordController>(
      () => SearchWordController(),
    );
  }
}
