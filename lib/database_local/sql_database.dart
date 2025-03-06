import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialDb();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "movieV1.0.db");
    Database movieDb = await openDatabase(path,
        onCreate: onCreate,
        onUpgrade: (db, oldVersion, newVersion) {},
        version:
            1);
    return movieDb;
  }

  //----------------------------------------------------------------------------------
  // Create_database
  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "favouriteMovie" (
      "imdbID" TEXT NOT NULL PRIMARY KEY,
      "Title" TEXT NOT NULL,
      "Year" TEXT NOT NULL,
      "Type" TEXT NOT NULL,
      "Poster" TEXT NOT NULL
    )
  ''');
  }

  //----------------------------------------------------------------------------------
  //read_data
  Future<List<Map>> readData({required String sql}) async {
    Database? movieDb = await database;
    List<Map> response = await movieDb!.rawQuery(sql);
    return response;
  }

  //----------------------------------------------------------------------------------
  //insert_data
  Future<int> insertData({required String sql}) async {
    Database? movieDb = await database;
    int response = await movieDb!.rawInsert(
        sql);
    return response;
  }

  //----------------------------------------------------------------------------------
  //delete_data
  Future<int> deleteData({required String sql}) async {
    Database? movieDb = await database;
    int response = await movieDb!.rawDelete(
        sql);
    return response;
  }

  //----------------------------------------------------------------------------------
  //update_data
  Future<int> updateData({required String sql}) async {
    Database? movieDb = await database;
    int response = await movieDb!.rawUpdate(
        sql);
    return response;
  }
}
