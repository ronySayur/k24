import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/member.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  var multiple = true.obs;
   var userData;
  DatabaseManager database = DatabaseManager.instance;

  Future<List<Map<String, dynamic>>> getMember() async {
    Database? db = await database.db;
    List<Map<String, dynamic>> maps = await db.query('member');
    return maps;
  }

  getUser(String idUser) async {
    Database? db = await database.db;
    userData = await db.query("member", where: "id = ?", whereArgs: [idUser]);
    update(); 
  }

  AnimationController? animationController;
  @override
  void onInit() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    super.onInit();
  }
}
