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
    prdName TEXT NOT NULL,
    prdQty INTEGER NOT NULL DEFAULT 0,
    prdPrice REAL NOT NULL DEFAULT 0.0
    )
    ''');
  }

  Future addDataLocally({prdName, prdQtY, prdPrice}) async {
    final db = await database;
    await db.insert("Product", {
      "prdName": prdName,
      "prdQty": prdQtY ?? 0,
      "prdPrice": prdPrice ?? 0.0
    });
    print('$prdName, $prdQtY. $prdPrice to database successfully');
    return 'added';
  }

  Future<List> readAllData() async {
    final db = await database;
    final allData = await db.query('Product');
    wholeDataList = allData;
    print(wholeDataList);
    return wholeDataList;
  }

  Future searchProductById({prdId}) async {
    final db = await database;
    final allSearchData = await db.rawQuery(
        'SELECT id, prdName, prdQty, prdPrice FROM Product WHERE id = ?',
        [prdId]);
    print('product found is $allSearchData');
    return allSearchData;
  }

  Future updateProduct({prdId, prdName, prdQty, prdPrice}) async {
    final db = await database;
    int updateId = await db.rawUpdate(
        'UPDATE Product SET prdName=?, prdQty=?,prdPrice=? WHERE id = ?',
        [prdName, prdQty, prdPrice, prdId]);
    print('update is $updateId');
    return updateId;
  }

  Future deleteProduct({prdId}) async {
    final db = await database;
    final deletedproduct =
        await db.rawDelete('DELETE FROM Product WHERE id=?', [prdId]);
    print('DeletedProduct with ID: $prdId');
    return deletedproduct;
  }
}