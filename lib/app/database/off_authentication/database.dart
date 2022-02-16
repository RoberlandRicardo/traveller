import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:traveller/app/database/off_authentication/model.dart';

class DatabaseOffAuthentication {
  static Database? _db;

  static Future<Database?> getDb() async {
    if (_db == null) await initDb();
    return _db;
  }

  static Future<Database?> initDb() async {
    String? databasePath = await getDatabasesPath();
    if (databasePath == null) databasePath = "";
    String path = join(databasePath, "offAuthentication.db");

    Database? db = await openDatabase(
      path,
      version: 1,
    ).then((db) async {
      tables.forEach((table) async {
        String sql = "CREATE TABLE IF NOT EXISTS " + table.name + " (";
        int index = 0;
        table.values.forEach((value) {
          sql = sql + value;
          if (index < table.values.length - 1) sql = sql + ", ";
          index++;
        });
        sql = sql + ");";
        await db.execute(sql);
      });

      _db = db;
    });

    return db;
  }

  static Future<void> beginTransaction() async {
    if (_db != null) return _db?.execute("BEGIN TRANSACTION;");
  }

  static Future<void> commit() async {
    if (_db != null) return _db?.execute("COMMIT;");
  }

  static Future<void> closeDB() async {
    if (_db != null) await _db?.close();
  }

  static Future<void> dropDB() async {
    String? databasePath = await getDatabasesPath();
    if (databasePath == null) databasePath = "";
    String path = join(databasePath, "offAuthentication.db");
    deleteDatabase(path);
  }
}
