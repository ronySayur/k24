import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/member.dart';

class ChangepasswordmemberController extends GetxController {
  GetStorage box = GetStorage();

  DatabaseManager database = DatabaseManager.instance;

  TextEditingController Password = TextEditingController();
  TextEditingController NewPassword = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  bool isPasswordVisible = true;
  bool isPasswordVisible1 = true;
  bool isPasswordVisible2 = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void togglePasswordVisibility1() {
    isPasswordVisible1 = !isPasswordVisible1;
    update();
  }

  void togglePasswordVisibility2() {
    isPasswordVisible2 = !isPasswordVisible2;
    update();
  }

  changePassword() async {
    if (Password.text.isEmpty ||
        NewPassword.text.isEmpty ||
        ConfirmPassword.text.isEmpty) {
      Get.snackbar("Error", "Password tidak boleh kosong",
          duration: const Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error),
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else {
      if (NewPassword.text == ConfirmPassword.text) {
        Database? db = await database.db;

        await db
            .update("member", {'Password': NewPassword.text},
                where: "id = ?", whereArgs: [box.read('id')])
            .then((value) => Get.back());

        Get.snackbar("Success", "Password berhasil diubah",
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.TOP,
            icon: const Icon(Icons.check),
            colorText: Colors.white,
            backgroundColor: Colors.green);
      } else {
        Get.snackbar("Error", "Konfirmasi Password tidak sama",
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error),
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }
    }
  }
}
