import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_pages.dart';

class PageIndexController extends GetxController {
  GetStorage box = GetStorage();
  RxInt pageIndex = 0.obs;

  

  void changePage(int i) async {

    pageIndex.value = i;
    switch (i) {
      case 1:
        Get.offAllNamed(Routes.PROFILE, arguments: "${box.read('id')}");
        break;
      default:
        Get.offAllNamed(Routes.HOME, arguments: "${box.read('id')}");
    }
  }
}
