import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'gymbuddies.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE contacts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT
          )
        ''');
        db.execute('''
          CREATE TABLE upcoming_trainings(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            training TEXT
          )
        ''');
        db.execute('''
          CREATE TABLE recent_trainings(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            training TEXT
          )
        ''');
      },
    );
  }

  Future<void> clearUpcomingTrainings() async {
    final db = await database;
    await db.delete('upcoming_trainings');
  }

  Future<void> clearRecentTrainings() async {
    final db = await database;
    await db.delete('recent_trainings');
  }

  Future<void> insertUpcomingTraining(String training) async {
    final db = await database;
    await db.insert('upcoming_trainings', {'training': training});
  }

  Future<void> insertRecentTraining(String training) async {
    final db = await database;
    await db.insert('recent_trainings', {'training': training});
  }

  Future<List<String>> getTrainings(String tableName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (int i) {
      return maps[i]['training'] as String;
    });
  }
  Future<void> insertContact(String name, String email) async {
    final db = await database;
    await db.insert('contacts', {'name': name, 'email': email});
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    final db = await database;
    return await db.query('contacts');
  }
  
  Future<void> clearContacts() async {
    final db = await database;
    await db.delete('contacts');
  }
}
