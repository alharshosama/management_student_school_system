/*

// //
// // import '../Data/db_helper.dart';
// // import '../Models/LoginsystemModel.dart';
// //
// // class StudentRepository{
// //   Future<List<LoginsystemModel>> getAll()async{
// //     try{
// //       await Future.delayed(Duration(seconds: 1));
// //       var res = await DbHelper().getAll(DbTables.Logins);
// //       List<LoginsystemModel> list= [];
// //       if(res !=null){
// //         for( var item in res){
// //           list.add(LoginsystemModel.fromJson(item));
// //         }
// //       }
// //       return list;
// //     }
// //     catch(e){
// //       rethrow;
// //
// //     }
// //   }
// //
// //   Future<int> add(Map<String,dynamic>obj)async{
// //     try{
// //       await Future.delayed(Duration(seconds: 1));
// //       //throw Exception();
// //       var res = await DbHelper().add(DbTables.Logins,obj);
// //       return res;
// //
// //     }
// //     catch(e){
// //       return 0;
// //     }
// //   }
// //   Future<int> update(Map<String,dynamic>obj)async{
// //     try{
// //       // await Future.delayed(Duration(seconds: 1));
// //       //throw Exception();
// //       var res = await DbHelper().update(DbTables.Logins,obj);
// //
// //       return res;
// //
// //     }
// //     catch(e){
// //       print('dbhelper is ${e}');
// //       return 0;
// //     }
// //   }
// //   Future<int> delete(int id)async {
// //     try {
// //       await Future.delayed(Duration(seconds: 1));
// //       //throw Exception();
// //       var res = await DbHelper().delete(DbTables.Logins, id);
// //       return res;
// //     }
// //     catch (e) {
// //       return 0;
// //     }
// //   }
// //   }
//
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// class LoginRepository {
//   static final LoginRepository _instance = LoginRepository._internal();
//
//   factory LoginRepository() => _instance;

 // static Database? _database;

  // LoginRepository._internal();

  class DbHelper{
  static DbHelper? dbHelper;
  static Database? _database;

  DbHelper._createInstance();
  factory DbHelper() {
  dbHelper ??= DbHelper._createInstance();
  return dbHelper as DbHelper;
  }

  Future<Database> _initializeDatabase() async {
  int dbVersion =1;
  final dbFolder = await getExternalStorageDirectory();
  final dbPath = p.join(dbFolder!.path, "Database");
  Directory dbFolderDir = await Directory(dbPath).create(recursive: true);

  final file = File(p.join(dbFolderDir.path, 'House.db'));
  var testDb = await openDatabase(
  file.path,
  version: dbVersion,
  onCreate: _createDatabaseV1,
  onDowngrade: onDatabaseDowngradeDelete
  );
  return testDb;
  }

  Future<void> _createDatabase(Database db, int version) async {
  await db.execute(
  'CREATE TABLE Login(id INTEGER PRIMARY KEY, username TEXT, password INTEGER)');
  }

  Future<String?> authenticateUser(String username, String password) async {
  final db = await database;
  final result = await db.query('Logins',
  where: 'username = ? AND password = ?', whereArgs: [username, password]);
  if (result.isNotEmpty) {
  return result.first['username'] as String?;
  }
  return null;
  }
  }
}
*/
