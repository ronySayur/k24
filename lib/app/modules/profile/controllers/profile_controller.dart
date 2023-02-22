import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/member.dart';

class ProfileController extends GetxController {
  GetStorage box = GetStorage();

  var userData;

  DatabaseManager database = DatabaseManager.instance;

  getUser() async {
    var idUser = box.read('id').toString();
    Database? db = await database.db;
    userData =
        await db.query("member", where: "id = ?", whereArgs: [idUser]);

    box.write('id', userData[0]['id']);
    return userData;
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
