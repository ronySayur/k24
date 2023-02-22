import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  GetStorage box = GetStorage();

  logout() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Apakah anda yakin ingin logout?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      textCancel: "Tidak",
      onConfirm: () {
        box.remove('id');
        Get.offAllNamed('/login');
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
