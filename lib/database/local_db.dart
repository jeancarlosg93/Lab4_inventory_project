import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database? _database;
  List wholeDataList = [];

  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('localproduct.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Product(
    id INTEGER PRIMARY KEY,
    prdName TEXT NOT NULL
    )
    ''');
  }

  Future addDataLocally({prdName}) async {
    final db = await database;
    await db.insert("Product", {"prdname": prdName});
    print('$prdName added to database successfully');
    return 'added';
  }

  Future<List> readAllData() async {
    final db = await database;
    final allData = await db.query('Product');
    wholeDataList = allData;
    print(wholeDataList);
    return wholeDataList;
  }
}
