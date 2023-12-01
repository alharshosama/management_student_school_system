import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
class DbTables{
  static const String Login = "Login";
  static const String Students = "Students";
  static const String Courses = "Courses";
  static const String Teachers = "Teachers";
  static const String Grades = "Grades";
  static const String Events = "Events";
  static const String Users = "Users";
  static const String Messages = "Messages";
  static const String Gates = "Gates";
  static const String StudAffairs = "StudAffairs";
  static const String Reports = "Reports";
  static const String Accounts = "Accounts";
  static const String Bus = "Bus";
  static const String House = "House";
  static const String Controls = "Controls";
  static const String Personnel = "Personnel";
  static const String Managers = "Managers";



}
String _loginTbl = 'CREATE TABLE ${DbTables.Login} (Id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT NULL)';
String _studentTbl = 'CREATE TABLE ${DbTables.Students} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Level TEXT NULL)';
String _courseTbl = 'CREATE TABLE ${DbTables.Courses} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Details TEXT NULL)';
String _teacherTbl = 'CREATE TABLE ${DbTables.Teachers} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Salary REAL, Details TEXT NULL)';
String _gradeTbl = 'CREATE TABLE ${DbTables.Grades} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Subject TEXT, Grades INTEGER NULL)';
String _eventTbl = 'CREATE TABLE ${DbTables.Events} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Date TEXT NULL)';
String _userTbl = 'CREATE TABLE ${DbTables.Users} (Id INTEGER PRIMARY KEY AUTOINCREMENT, User TEXT, Permissions TEXT NULL)';
String _messageTbl = 'CREATE TABLE ${DbTables.Messages} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Message TEXT, Time TEXT NULL)';
String _gateTbl = 'CREATE TABLE ${DbTables.Gates} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Responsible TEXT, Reception TEXT, Gate TEXT  NULL)';
String _studaffairsTbl = 'CREATE TABLE ${DbTables.StudAffairs} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Admission TEXT, Register TEXT, Scheduling TEXT,Cards TEXT, Absence_and_Attendance TEXT, Communication_with_Parents TEXT NULL)';
String _reportTbl = 'CREATE TABLE ${DbTables.Reports} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Performance TEXT, Attendance_and_absence_report TEXT, Discipline_and_conduct_report TEXT,Personal_development_report TEXT, Home_linkage_report TEXT, Test_reports_andevaluation TEXT NULL)';
String _accountTbl = 'CREATE TABLE ${DbTables.Accounts} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Email TEXT,Password INTEGER NULL)';
String _busTbl = 'CREATE TABLE ${DbTables.Bus} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Driver TEXT, Bus TEXT,PhoneNumber TEXT NULL)';
String _houseTbl = 'CREATE TABLE ${DbTables.House} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Item TEXT, Quantity TEXT NULL)';
String _controlTbl = 'CREATE TABLE ${DbTables.Controls} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Principal TEXT,Vice_Principal TEXT NULL)';
String _personnelTbl = 'CREATE TABLE ${DbTables.Personnel} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Position TEXT NULL)';
String _managerTbl = 'CREATE TABLE ${DbTables.Managers} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT,Email TEXT ,Password REAL,Positions TEXT NULL)';









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

  void _createDatabaseV1(Database db, int version) async {
    try {
      await db.execute(_studentTbl);
      await db.execute(_courseTbl);
      await db.execute(_teacherTbl);
      await db.execute(_gradeTbl);
      await db.execute(_eventTbl);
      await db.execute(_userTbl);
      await db.execute(_messageTbl);
      await db.execute(_gateTbl);
      await db.execute(_studaffairsTbl);
      await db.execute(_reportTbl);
      await db.execute(_accountTbl);
      await db.execute(_busTbl);
      await db.execute(_houseTbl);
      await db.execute(_controlTbl);
      await db.execute(_personnelTbl);
      await db.execute(_managerTbl);
      await db.execute(_loginTbl);

    }
    catch(e){
      print("CreateExp:- "+ e.toString());
      rethrow;
    }
  }

  Future<Database> get database async {
    _database ??= await _initializeDatabase();
    return _database as Database;
  }

  Future<List<Map<String, dynamic>>?> getAll(String tbl) async{
    try {
      Database db = await database;
      var res = await db.query(tbl);
      return res;
    } on Exception catch (e) {
      print("Exception in getAll: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getById(String tableName, int id, {String pkName = "Id"}) async{
    try {
      Database db = await database;
      var result= await db.query(tableName,where: "$pkName = ?", whereArgs: [id]);
      return result.isNotEmpty ? result.first : null;
    } on Exception catch (e) {
      print("Exception in getById: ${e}");
      return null;
    }

  }

  Future<int> add(String tbl, Map<String, dynamic> obj)async{
    try {
      Database db = await database;
      var res = await db.insert(tbl, obj, conflictAlgorithm: ConflictAlgorithm.ignore );
      return res;
    } on Exception catch (e) {
      print("EXP in Insert : ${e}");
      return 0;
    }
  }

  Future<int> update(String tbl, Map<String, dynamic> obj, {String pkName = 'Id'})async{
    print("obj:$obj");

    try {
      Database db = await database;
      var pkValue = obj[pkName];
      if(pkValue != null) {
        print("Yes");

        var res = await db.update(tbl, obj, where: '$pkName = ?', whereArgs: [pkValue], conflictAlgorithm: ConflictAlgorithm.ignore);
        return res;
      }
      return 0;
    } on Exception catch (e) {
      print("EXP in update : ${e}");
      return 0;
    }
  }

  Future<int> delete(String tbl,Object pkValue, {String pkName = 'Id'})async{
    try {
      Database db = await database;
      if(pkValue != null){
        var res = await db.delete(tbl, where: '$pkName = ?', whereArgs: [pkValue]);
        return res;
      }
      return 0;
    } on Exception catch (e) {
      print("EXP in delete : ${e}");
      return 0;
    }
  }
  Future<String?> authenticateUser(String username, String password) async {
    final db = await database;
    final result = await db.query('Login',
        where: 'username = ? AND password = ?', whereArgs: [username, password]);

    if (result.isNotEmpty) {

      return result[0]['UserName'] as String?;

    }
   else{
      return null;
    }
  }

}

