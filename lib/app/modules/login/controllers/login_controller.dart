import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/member.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    box.remove('id');
    super.onInit();
  }

  GetStorage box = GetStorage();
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  DatabaseManager database = DatabaseManager.instance;

  login() async {
    if (Username.text.isEmpty || Password.text.isEmpty) {
      Get.snackbar("Error", "Username atau Password tidak boleh kosong",
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error),
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else {
      Database db = await database.db;
      var login = await db.query('member',
          columns: ['id', 'Username', 'Password'],
          where: 'Username=? and Password=?',
          whereArgs: [Username.text, Password.text]);

      print(login);

      if (login.isNotEmpty) {
        EasyLoading.show(
            status: 'Tunggu Sebentar', maskType: EasyLoadingMaskType.black);

        await box.write('id', "${login[0]['id']}");
        Get.offAllNamed(Routes.HOME, arguments: "${login[0]['id']}");
        EasyLoading.dismiss();

        Get.snackbar("Success", "Login Berhasil",
            snackPosition: SnackPosition.TOP,
            icon: const Icon(Icons.check),
            colorText: Colors.white,
            backgroundColor: Colors.green);
      } else {
        Get.snackbar("Error", "Username tidak terdaftar",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error),
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }
    }
  }
}
