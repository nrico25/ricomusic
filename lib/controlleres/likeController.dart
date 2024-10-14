import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ricomusic/model/model_listview.dart';

class LikeController extends GetxController {
  static Database? _db;

  // Observable list for all songs
  var songs = <ModelListview>[].obs;

  // Observable list for liked songs
  var likedSongs = <ModelListview>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'music_database.db');

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

  // Load all songs from the database
  Future<void> loadSongs() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('music');
    songs.assignAll(queryResult.map((data) => ModelListview.fromMap(data)).toList());
    // Also load liked songs
    loadLikedSongs();
  }

  // Load only liked songs from the database
  Future<void> loadLikedSongs() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = 
        await dbClient!.query('music', where: 'isLiked = ?', whereArgs: [1]);
    likedSongs.assignAll(queryResult.map((data) => ModelListview.fromMap(data)).toList());
  }

  // Add a new song
  Future<int> addSong(ModelListview song) async {
    var dbClient = await db;
    int result = await dbClient!.insert('music', song.toMap());
    loadSongs(); // Refresh the list after adding a song
    return result;
  }

  // Like a song
  Future<void> likeSong(ModelListview song) async {
    var dbClient = await db;
    song.isLiked = true;
    await dbClient!.update(
      'music',
      song.toMap(),
      where: 'id = ?',
      whereArgs: [song.id],
    );
    loadSongs(); // Refresh the list to update the UI
  }

  // Unlike a song
  Future<void> unlikeSong(ModelListview song) async {
    var dbClient = await db;
    song.isLiked = false;
    await dbClient!.update(
      'music',
      song.toMap(),
      where: 'id = ?',
      whereArgs: [song.id],
    );
    loadSongs(); // Refresh the list to update the UI
  }

  // Delete a song
  Future<void> deleteSong(int id) async {
    var dbClient = await db;
    await dbClient!.delete('music', where: 'id = ?', whereArgs: [id]);
    loadSongs(); // Refresh the list after deletion
  }
}