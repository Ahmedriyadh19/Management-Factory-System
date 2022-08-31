import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateCons();
  static const int version = 1;
  static const String dbName = 'myDatabase.db';
  static String? myDBPath;
  static bool isDatabaseEx = false;
  static bool isDatabaseFile = false;
  static bool isDatabasePath = false;
  static Database? _database;

  DatabaseHelper._privateCons();

  Future<Database?> get database async {
    if (_database != null) {
      isDatabaseEx = true;
      return _database!;
    }
    if (myDBPath != null && myDBPath!.isNotEmpty && isDatabasePath) {
      return _database = await _intiDB(dbName, myDBPath!, 0);
    } else if (myDBPath != null && myDBPath!.isNotEmpty && isDatabaseFile) {
      return _database = await _intiDB(dbName, myDBPath!, 1);
    }
    return null;
  }

  Future<Database> _intiDB(String dbName, String path, int op) async {
    if (op == 0) {
      final dbPath = join(path, dbName);
      return await openDatabase(dbPath, version: version, onCreate: _createDB);
    } else {
      return await openDatabase(myDBPath!);
    }
  }

  Future _createDB(Database db, int versionBD) async {}

  Future close() async {
    final db = await instance.database;
    db!.close();
  }
}
