import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const _dataBaseName = 'TaskListDB.db';
  static const _dataBaseVersion = 1;

  static const frequencyTable = 'frequency_table';

  static const columnId = '_id';
  static const columnFrequency = 'Frequency';

  late Database _db;

  Future<void> initilzation() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, _dataBaseName);
    _db = await openDatabase(
      path,
      version: _dataBaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database database, int version) async {
    await database.execute('''
    CREATE TABLE $frequencyTable(
    $columnId INTEGER PRIMARY KEY ,
    $columnFrequency TEXT)
    ''');
  }

  Future _onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute('drop table $frequencyTable');
    _onCreate(database, newVersion);
  }

  Future<int> insertData(Map<String, dynamic> row, String tableName) async {
    return await _db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    return await _db.query(tableName);
  }

  Future<int> updataData(Map<String, dynamic> row, String tableName) async {
    int id = row[columnId];
    return await _db.update(
      tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteData(int id, String tableName) async {
    return await _db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  readDataByColumnName(table, colName, colValue) async {
    return await _db
        .query(table, where: '$colName =?', whereArgs: [colValue]);
  }

  readDataById(table, itemId) async{
    return await _db.query(
      table,
      where:'_id=?',
      whereArgs: [itemId,]
    );
  }
}
