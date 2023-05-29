import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:app1/models/post_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/event_model.dart';

class DatabaseHelper {
  static final nombreBD = 'TECBOOKBD';
  static final versionBD = 12;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathBD = join(folder.path, nombreBD);
    return await openDatabase(
      pathBD,
      version: versionBD,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    String query = '''
      CREATE TABLE tblPost (
        idPost INTEGER PRIMARY KEY,
        dscPost VARCHAR(200),
        datePost DATE
      );''';
    await db.execute(query);
    String query2 = '''
      CREATE TABLE tblEvents (
        idEvents INTEGER PRIMARY KEY,
        dscEvents VARCHAR(200),
        dateEvents DATE,
        finished INTEGER
      );
    ''';
    await db.execute(query2);
    String query3 = '''
      CREATE TABLE tblPopularFav (
        backdrop_path TEXT,
        id INTEGER,
        original_language TEXT,
        original_title TEXT,
        overview TEXT,
        popularity REAL,
        poster_path TEXT,
        release_date TEXT,
        title TEXT,
        vote_average REAL,
        vote_count INTEGER
      );
    ''';
    await db.execute(query3);
    print('cree algo');
  }

  Future<int> INSERTAR(String table, Map<String, dynamic> map) async {
    var conexion = await database;
    return await conexion.insert(table, map);
  }

  // Future<int> ACTUALIZAR(String table, Map<String, dynamic> map) async {
  //   var conexion = await database;
  //   return await conexion
  //       .update(table, map, where: 'idPost = ?', whereArgs: [map['idPost']]);
  // }

  // Future<int> ELIMINAR(String table, int id) async {
  //   var conexion = await database;
  //   return await conexion.delete(table, where: 'idPost = ?', whereArgs: [id]);
  // }

  Future<List<PostModel>> GETALLPOST() async {
    var conexion = await database;
    var result = await conexion.query('tblPost');
    return result.map((post) => PostModel.fromMap(post)).toList();
  }

  Future<List<EventModel>> getEventsForDay(String fecha) async {
    var conexion = await database;
    var query = "SELECT * FROM tblEvents where dateEvents=?";
    var result = await conexion.rawQuery(query, [fecha]);
    List<EventModel> events = [];
    if (result != null && result.isNotEmpty) {
      events = result.map((event) => EventModel.fromMap(event)).toList();
    }
    return events;
  }

  Future<List<EventModel>> getAllEventos() async {
    var conexion = await database;
    var result = await conexion.query('tblEvents');
    return result.map((event) => EventModel.fromMap(event)).toList();
  }

  Future<int> ELIMINAR(String tblName, int id, String idColumnName) async {
    var conexion = await database;
    return await conexion.delete(
      tblName,
      where: '$idColumnName = ?',
      whereArgs: [id],
    );
  }

  Future<int> ACTUALIZAR(
      String tblName, Map<String, dynamic> data, String idColumnName) async {
    var conexion = await database;
    return await conexion.update(
      tblName,
      data,
      where: '$idColumnName = ?',
      whereArgs: [data[idColumnName]],
    );
  }
}
