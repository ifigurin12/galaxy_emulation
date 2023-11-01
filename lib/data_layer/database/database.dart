import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static late Database _database;

  // Таблица с картами
  final String _tableName = 'planet_table';
  final String _planetId = 'id';
  final String _planetSize = 'planetSize';
  final String _planetRemoteness = 'planetRemoteness';
  final String _planetSpeed = 'planetSpeed';
  final String _planetColor = 'planetColor';

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}galaxy.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE $_tableName(
    $_planetId INTEGER  PRIMARY KEY AUTOINCREMENT,
    $_planetSize INTEGER NOT NULL,
    $_planetRemoteness INTEGER NOT NULL,
    $_planetSpeed DOUBLE NOT NULL,
    $_planetColor INTEGER NOT NULL
  )''',
    );
    await db.rawInsert('''INSERT INTO 
    $_tableName($_planetSize, $_planetRemoteness, $_planetSpeed, $_planetColor) 
    VALUES(?, ?, ?, ?)''', [
      Random().nextInt(3),
      Random().nextInt(3),
      Random().nextDouble() * 10,
      const Color(0xFFE91E63).value,
    ]);
    await db.rawInsert('''INSERT INTO 
    $_tableName($_planetSize, $_planetRemoteness, $_planetSpeed, $_planetColor) 
    VALUES(?, ?, ?, ?)''', [
      Random().nextInt(3),
      Random().nextInt(3),
      Random().nextDouble() * 10,
      const Color(0xFFFF7043).value,
    ]);
    await db.rawInsert('''INSERT INTO 
    $_tableName($_planetSize, $_planetRemoteness, $_planetSpeed, $_planetColor) 
    VALUES(?, ?, ?, ?)''', [
      Random().nextInt(3),
      Random().nextInt(3),
      Random().nextDouble() * 10,
      const Color(0xFF2196F3).value,
    ]);
  }

  Future<int> insertPlanet(Map<String, dynamic> jsonPlanet) async {
    Database db = await database;
    final id = await db.rawInsert('''INSERT INTO 
    $_tableName($_planetSize, $_planetRemoteness, $_planetSpeed, $_planetColor) 
    VALUES(?, ?, ?, ?)''', [
      jsonPlanet['planetSize'],
      jsonPlanet['planetRemoteness'],
      jsonPlanet['planetSpeed'],
      jsonPlanet['planetColor'],
    ]);
    return id;
  }

  Future<void> deleteDatabaseFile() async {
     Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}galaxy.db';

    // Удаляем файл базы данных
    await deleteDatabase(path);
  }

  Future<int> deletePlanet(int id) async {
    Database db = await database;

    return await db.rawDelete(
      '''DELETE FROM  $_tableName WHERE $_planetId = ? ''',
      [id],
    );
  }

  Future<List<Map<String, dynamic>>> getPlanets() async {
    Database db = await database;
    return await db.query(_tableName);
  }
}
