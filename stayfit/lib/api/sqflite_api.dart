import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfDb {
  static String _databaseName = "HACKFIT_DB";

  static int _databaseVersion = 1;

  String chatTable = "chat_table";
  String message = "message";
  String isBot = "is_bot";

  SqfDb._privateConstructor();
  static final SqfDb instance = SqfDb._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $chatTable (
            $message text,
            $isBot integer
          )
          ''');
  }

  Future<int> insertMessage({required Map<String, dynamic> messageMap}) async {
    Database db = await instance.database;
    int id = await db.insert(chatTable, messageMap);
    return id;
  }

  Future<List<Map<String, dynamic>>> getChats() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT * FROM $chatTable');
    print("-------------------");
    print(result);
    print("-------------------");
    return result;
  }
}
