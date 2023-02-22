import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.context!.width * 0.7,
          height: Get.context!.width * 0.7,
          child: Lottie.asset("assets/lottie/phamarcisthand.json"),
        ),
      ),
    );
  }
}
