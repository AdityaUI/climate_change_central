
import 'package:climate_change_central/Models/user_info.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:climate_change_central/Models/emmission_entry.dart';


class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String entryTable = 'entry_table';
  String colId = 'id';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'appdb.db';

    // Open/create the database at a given path
    var entrysDatabase = await openDatabase(path, version: 3, onCreate: _createDb);
    return entrysDatabase;
  }


  int id;
  String rn;
  String ln;
  int sqrft;
  double lat;
  double lng;

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE emmission_entry_table(id INTEGER PRIMARY KEY AUTOINCREMENT, value INTEGER, '
        'timestamp TEXT)');

    await db.execute('CREATE TABLE user_info_table(id INTEGER PRIMARY KEY AUTOINCREMENT, rn TEXT, '
        'ln TEXT, sqrft INTEGER, lat TEXT, lng TEXT)');

  }

  // Fetch Operation: Get all entry objects from database
  Future<List<Map<String, dynamic>>> getEmmissionEntryMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $entryTable order by $colPriority ASC');
    var result = await db.query(entryTable, orderBy: '$colId ASC');
    return result;
  }

  // Insert Operation: Insert a EmmissionEntry object to database
  Future<int> insertEmmissionEntry(EmmissionEntry entry) async {
    Database db = await this.database;
    var result = await db.insert(entryTable, entry.toMap());
    print(result);
    return result;
  }

  // Update Operation: Update a EmmissionEntry object and save it to database
  Future<int> updateEmmissionEntry(EmmissionEntry entry) async {
    var db = await this.database;
    var result = await db.update(entryTable, entry.toMap(), where: '$colId = ?', whereArgs: [entry.id]);
    return result;
  }

  // Delete Operation: Delete a EmmissionEntry object from database
  Future<int> deleteEmmissionEntry(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $entryTable WHERE $colId = $id');
    return result;
  }

  // Get number of EmmissionEntry objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $entryTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'EmmissionEntry List' [ List<EmmissionEntry> ]
  Future<List<EmmissionEntry>> getEmmissionEntryList() async {

    var entryMapList = await getEmmissionEntryMapList(); // Get 'Map List' from database
    int count = entryMapList.length;         // Count the number of map entries in db table

    List<EmmissionEntry> entryList = List<EmmissionEntry>();
    // For loop to create a 'EmmissionEntry List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      entryList.add(EmmissionEntry.fromMap(entryMapList[i]));
    }

    return entryList;
  }

  // Fetch Operation: Get all entry objects from database
  Future<List<Map<String, dynamic>>> getUserInfoMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $entryTable order by $colPriority ASC');
    var result = await db.query(entryTable, orderBy: '$colId ASC');
    return result;
  }

  // Insert Operation: Insert a UserInfo object to database
  Future<int> insertUserInfo(UserInfo entry) async {
    Database db = await this.database;
    var result = await db.insert(entryTable, entry.toMap());
    print(result);
    return result;
  }

  // Update Operation: Update a UserInfo object and save it to database
  Future<int> updateUserInfo(UserInfo entry) async {
    var db = await this.database;
    var result = await db.update(entryTable, entry.toMap(), where: '$colId = ?', whereArgs: [entry.id]);
    return result;
  }

  // Delete Operation: Delete a UserInfo object from database
  Future<int> deleteUserInfo(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $entryTable WHERE $colId = $id');
    return result;
  }

  // Get number of UserInfo objects in database
  Future<int> getUserInfoCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $entryTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'UserInfo List' [ List<UserInfo> ]
  Future<List<UserInfo>> getUserInfoList() async {

    var entryMapList = await getUserInfoMapList(); // Get 'Map List' from database
    int count = entryMapList.length;         // Count the number of map entries in db table

    List<UserInfo> entryList = List<UserInfo>();
    // For loop to create a 'UserInfo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      entryList.add(UserInfo.fromMap(entryMapList[i]));
    }

    return entryList;
  }

}