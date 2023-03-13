import 'package:sqflite/sqflite.dart';

import 'expenses.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'expenses';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'my_db.db';
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE $_tableName ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT ,'
              'date INTEGER ,dateAlarm INTEGER,'
              ' group TEXT ,amount INTEGER,isPaid INTEGER,'
              ' walletMoney TEXT,note TEXT)');
        });
      } catch (e) {
        print(e);
      }
    }
  }

  static insertExpenses(Expenses expenses) async {
    return await _db!.insert(_tableName, expenses.toJson());
  }

  static deleteExpenses(Expenses expenses) async {
    return await _db!
        .delete(_tableName, where: 'id = ?', whereArgs: [expenses.id]);
  }

  static queryExpenses() async {
    return await _db!.query(_tableName);
  }

  static updateExpenses(Expenses expenses) async {
    return await _db!.update(_tableName, expenses.toJson());
  }

  static updateRowExpenses(int id) async {
    return await _db!.rawUpdate('''
UPDATE expenses 
SET isPaid = ?
WHERE id = ?
''', [1, id]);
  }
}
