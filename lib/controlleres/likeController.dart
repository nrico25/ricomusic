import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Likecontroller extends GetxController {
  static Database? _db;
  var tasks = <ModelListview>[].obs;
  var isLiked = false.obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE music(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            artist TEXT,
            streams TEXT,
            imagePath TEXT,
            isLiked INTEGER
          )
        ''');
      },
    );
  }

  Future<int> addTask(ModelListview task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('music', song.toMap());
    loadSongs(); // Refresh the list after adding a song
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(
        queryResult.map((data) => ModelListview.fromMap(data)).toList());
  }

  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('music', where: 'id = ?', whereArgs: [id]);
    loadSongs(); // Refresh the list after deletion
  }

  Rx<bool> getLikedById(int id) {
    for (var model in tasks) {
      if (model.id == id) {
        return true.obs; // Return the isLiked status if id matches
      }
    }
    return false.obs; // Return false if no matching id is found
  }

  Rx<bool> getLikedById(int id) {
    for (var model in tasks) {
      if (model.id == id) {
        return true.obs; // Return the isLiked status if id matches
      }
    }
    return false.obs; // Return false if no matching id is found
  }
}