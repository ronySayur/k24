import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/member.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  var multiple = true.obs;
  DatabaseManager database = DatabaseManager.instance;

  Future<List<Map<String, dynamic>>> getMember() async {
    Database? db = await database.db;
    List<Map<String, dynamic>> maps = await db.query('member');
    return maps;
  }

  AnimationController? animationController;
  @override
  void onInit() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    super.onInit();
  }
}
