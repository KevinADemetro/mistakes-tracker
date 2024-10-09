import 'package:mistakes_tracker/entity/Mistake.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'mistakes_tracker.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE mistakes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            quantity INTEGER NOT NULL, 
            date TEXT NOT NULL
          ) 
        ''');
      },
    );
  }

  Future<void> insertMistake(Mistake mistake) async {
    final db = await database;
    await db.insert('mistakes', mistake.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Mistake>> getMistakes() async {
    final db = await database;
    final List<Map<String, dynamic>> mistakeMaps = await db.query('mistakes');
    return List.generate(mistakeMaps.length, (i) {
      return Mistake.fromMap(mistakeMaps[i]);
    });
  }

  Future<void> updateMistakesInBatch(List<Mistake> mistakes) async {
    final db = await database;
    Batch batch = db.batch();
    for (Mistake mistake in mistakes) {
      batch.update(
        'mistakes',
        {'quantity': mistake.quantity},
        where: 'id = ?',
        whereArgs: [mistake.id],
      );
    }
    await batch.commit(noResult: true);
  }
}
