import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'app/controllers/page_index_controller_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(PageIndexController(), permanent: true);
  runApp(
    myapp(),
  );
}

class myapp extends StatelessWidget {
  myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(() => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "K24 Test",
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
                builder: EasyLoading.init(),
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
