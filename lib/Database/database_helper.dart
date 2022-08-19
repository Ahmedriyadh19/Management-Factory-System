import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateCons();
  static const String dbName = 'myDatabase.db';
  static bool isDatabaseEx = false;
  static const int version = 1;
  static final DatabaseHelper instance = DatabaseHelper._privateCons();
  static Database? _database;

  static Future<Database?> get database async {
    

    if (_database != null) {
      isDatabaseEx = true;
      return _database;
    } else {
      //  _database = await intiDb();
      return _database;
    }
  }

  static bool isFoundDatabase() {
    if (_database != null) return isDatabaseEx = true;
    return isDatabaseEx;
  }
}
