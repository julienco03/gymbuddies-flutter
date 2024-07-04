import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// final databaseProvider = Provider((ref) => DatabaseHelper());

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
      version: 4,
      onUpgrade: _onUpgrade,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE contacts(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          email TEXT UNIQUE,
          trainings INTEGER DEFAULT 0,
          last_trained TEXT
        )
        ''');
        db.execute('''
          CREATE TABLE upcoming_trainings(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            training TEXT,
            date TEXT,
            training_plan_id INTEGER,
            contact_id INTEGER,
            FOREIGN KEY (training_plan_id) REFERENCES training_plans(id),
            FOREIGN KEY (contact_id) REFERENCES contacts(id)
          )
        ''');
        db.execute('''
          CREATE TABLE recent_trainings(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            training TEXT
          )
        ''');
        db.execute('''
          CREATE TABLE training_plans (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertContact(String name, String email) async {
    final db = await database;
    
    // Check if the contact already exists
    final List<Map<String, dynamic>> result = await db.query(
      'contacts',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isEmpty) {
      await db.insert(
        'contacts',
        {
          'name': name,
          'email': email,
          'trainings': 0,
          'last_trained': null,
        },
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );
    } else {
      throw ContactAlreadyExistsException('Contact with email $email already exists');
    }
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    final db = await database;
    return await db.query('contacts');
  }

  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearUpcomingTrainings() async {
    final db = await database;
    await db.delete('upcoming_trainings');
  }

  Future<void> clearRecentTrainings() async {
    final db = await database;
    await db.delete('recent_trainings');
  }

  Future<void> insertUpcomingTraining(String training, String date, int trainingPlanId, int? contactId) async {
      final db = await database;
      await db.insert(
        'upcoming_trainings',
        {
          'training': training,
          'date': date,
          'training_plan_id': trainingPlanId,
          'contact_id': contactId,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
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

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 4) {
      await db.execute('''
        ALTER TABLE upcoming_trainings ADD COLUMN date TEXT;
      ''');
      await db.execute('''
        ALTER TABLE upcoming_trainings ADD COLUMN training_plan_id INTEGER;
      ''');
      await db.execute('''
        ALTER TABLE upcoming_trainings ADD COLUMN contact_id INTEGER;
      ''');
    }
  }
    
  Future<List<Map<String, dynamic>>> getUpcomingTrainings() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('upcoming_trainings');
    return result.map((row) {
      return {
        'id': row['id'],
        'training': row['training'],
        'date': DateTime.parse(row['date'].toString()),
        'training_plan_id': row['training_plan_id'],
        'contact_id': row['contact_id'],
      };
    }).toList();
  }

  Future<void> deleteUpcomingTraining(int id) async {
    final db = await database;
    await db.delete('upcoming_trainings', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertTrainingPlan(String name, String description) async {
    final db = await database;
    await db.insert(
      'training_plans',
      {'name': name, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getTrainingPlans() async {
    final db = await database;
    return await db.query('training_plans');
  }

    Future<void> deleteTrainingPlan(int id) async {
    final db = await database;
    await db.delete(
      'training_plans',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}

class ContactAlreadyExistsException implements Exception {
  final String message;
  ContactAlreadyExistsException(this.message);

  @override
  String toString() => 'ContactAlreadyExistsException: $message';
}
