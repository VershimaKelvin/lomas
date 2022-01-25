import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{



  static const _dbName = 'myDatabase.db';
  static const _dbVersion = 1;
  static const _columnName = "name";
  static const _columnID = 'ID';
  static const _tableName = 'myTable';

  //making DatabaseHelper a Singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase()async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    await openDatabase(path,version: _dbVersion,onCreate: onCreate);

  }

  onCreate(Database db,int version) {
    db.execute(
        '''CREATE TABLE $_tableName(
        $_columnID INTEGER PRIMARY KEY,
        $_columnName TEXT NOT NULL)'''
    ) ;
  }

  Future<int> insert(Map<String,dynamic> row)async{
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }
}
