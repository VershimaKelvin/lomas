import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{


  //making DatabaseHelper a Singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase()async{
    Directory directory = await getApplicationDocumentsDirectory();
    //String path = join();

  }

}