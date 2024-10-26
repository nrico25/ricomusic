// ignore_for_file: prefer_conditional_assignment

import 'package:get/get.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Likecontroller extends GetxController{
  static Database? _db;
  // list data yang digunakan untuk menampun hasil database, .obs diguanakan di UI
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
          CREATE TABLE tasks(
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
  // Insert Task
  Future<int> addTask(ModelListview task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  // Retrieve Tasks
  Future<void> loadTasks() async {
    var dbClient = await db; // nyambungin
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(queryResult.map((data) => ModelListview.fromMap(data)).toList());
  }

   Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }

  Rx<bool> getLikedById(int id) {
  // Assuming tasks is a list of models with properties `id` and `isLiked`
  for (var model in tasks) {
    if (model.id == id) {
      return true.obs; // Return the isLiked status if id matches
    }
  }
  return false.obs; // Return false if no matching id is found
}

  
}
