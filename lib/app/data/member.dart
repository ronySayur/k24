import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._private();

  static DatabaseManager instance = DatabaseManager._private();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
    }
    return _db!;
  }

  Future _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = "${docDir.path}member.db";

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      return await db.execute(
          "CREATE TABLE member(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Nama TEXT, Tanggal_lahir TEXT NOT NULL, Alamat TEXT NOT NULL, Jenis_kelamin TEXT NOT NULL, Username TEXT NOT NULL, Password TEXT NOT NULL)");
    });
  }

  Future closeDB() async {
    var dbClient = await instance.db;
    return dbClient.close();
  }
}
