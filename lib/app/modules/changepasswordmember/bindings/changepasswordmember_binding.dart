import 'package:get/get.dart';

import '../controllers/changepasswordmember_controller.dart';

class ChangepasswordmemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangepasswordmemberController>(
      () => ChangepasswordmemberController(),
    );
  }
}
