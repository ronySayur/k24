import 'package:get/get.dart';

import '../controllers/createmember_controller.dart';

class CreatememberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatememberController>(
      () => CreatememberController(),
    );
  }
}
