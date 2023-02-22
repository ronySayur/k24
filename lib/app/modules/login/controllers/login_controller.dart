import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/member.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  DatabaseManager database = DatabaseManager.instance;

  login() async {
    EasyLoading.show(status: 'Tunggu Sebentar');
    if (Username.text.isEmpty || Password.text.isEmpty) {
      Get.snackbar("Error", "Username atau Password tidak boleh kosong",
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error),
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else {
      Database db = await database.db;
      var list =
          await db.query('member', columns: ['id', 'Username', 'Password']);
      print(list);

      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          if (Username.text == list[i]['Username'] &&
              Password.text == list[i]['Password']) {
            EasyLoading.show(
              status: 'Tunggu Sebentar',
            );

            Get.offAllNamed(Routes.HOME, arguments: "${list[i]['id']}");
          } else {
            Get.snackbar("Error", "Username atau Password salah",
                snackPosition: SnackPosition.BOTTOM,
                icon: const Icon(Icons.error),
                colorText: Colors.white,
                backgroundColor: Colors.red);
          }
        }
      } else {
        Get.snackbar("Error", "Username tidak terdaftar",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error),
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }
    }
    EasyLoading.dismiss();
  }
}
