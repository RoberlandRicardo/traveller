import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:traveller/app/database/off_authentication/model.dart';

class DatabaseOffAuthentication {
  static Database? _db;

  static Future<Database?> getDb() async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  static Future<Database> initDb() async {
    String? databasePath = await getDatabasesPath();
    if (databasePath == null) databasePath = "";
    String path = join(databasePath, "offAuthentication.db");

    Database db =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      String sql = "";
      tables.forEach((table) {
        sql = "CREATE TABLE IF NOT EXISTS " + table.toString() + " (";
        int index = 0;
        table.values.forEach((value) {
          sql = sql + value.toString();
          if (index < table.values.length - 1) sql = sql + ", ";
        });
      });
      sql = sql + ");";
      await db.execute(sql);
    });

    return db;
  }

  static Future<void> closeDB() async {
    if (_db != null) await _db?.close();
  }
}
