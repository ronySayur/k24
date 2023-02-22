import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:k24/app/controllers/auth_controller.dart';
import 'package:k24/utils/splash_screen.dart';

import 'app/controllers/page_index_controller_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(PageIndexController(), permanent: true);
  Get.put(AuthController(), permanent: true);
  runApp(myapp());
}

class myapp extends StatelessWidget {
  myapp({super.key});
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(() => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "K24 Test",
                builder: EasyLoading.init(),
                getPages: AppPages.routes,
                initialRoute:
                    auth.isSkipIntro.isTrue ? Routes.HOME : Routes.INTRO,
              ));
        }
        return FutureBuilder(
          future: auth.firstInitialized(),
          builder: (context, snapshot) => const SplashScreen(),
        );
      },
    );
  }
}
