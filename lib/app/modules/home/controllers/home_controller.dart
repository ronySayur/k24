import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/member.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  GetStorage box = GetStorage();
  var multiple = true.obs;
  var idUser = ''.obs;
  var userData;

  DatabaseManager database = DatabaseManager.instance;

  Future<List<Map<String, dynamic>>> getMember() async {
    Database? db = await database.db;
    List<Map<String, dynamic>> maps = await db.query('member');
    return maps;
  }

  getUser() async {
    Database? db = await database.db;
    userData =
        await db.query("member", where: "id = ?", whereArgs: [idUser.value]);

    box.write('id', userData[0]['id']);
    return userData;
  }

  AnimationController? animationController;
  @override
  void onInit() {
    getUser();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    super.onInit();
  }
}
