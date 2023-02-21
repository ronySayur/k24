import 'package:get/get.dart';

import '../controllers/viewmember_controller.dart';

class ViewmemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewmemberController>(
      () => ViewmemberController(),
    );
  }
}
