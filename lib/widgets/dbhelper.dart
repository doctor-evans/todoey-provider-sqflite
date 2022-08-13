import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todey/models/tasks.dart';

// the new method

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'tasks.db'),
      onCreate: (database, version) async {
        await database.execute(
            ''' CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER) ''');
      },
      version: 1,
    );
  }

  Future<List<Task>> retrieveTaskList() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('tasks');
    return queryResult.map((e) => Task.fromMap(e)).toList();
  }

  Future<int?> insertTask(Task task) async {
    int? result;
    final Database db = await initializeDB();
    result = await db.insert('tasks', task.toMap());
    return result;
  }

  Future<int?> remove(int? id) async {
    final Database db = await initializeDB();
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> update(Task task) async {
    final Database db = await initializeDB();
    return await db
        .update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int?> removeall() async {
    final Database db = await initializeDB();
    return await db.delete('tasks');
  }
}
// the old method

// class DataBaseHelperClass {
//   DataBaseHelperClass._privateContructor();
//   static final DataBaseHelperClass instance = DataBaseHelperClass._privateContructor();
//   static Database? _database;

//   Future <Database> get database async {
//     return _database ??= await _initDatabase();
//   }


//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'tasks.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute(
//       ''' CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT, isDone BOOL) '''
//     );
//   }

  
//   Future<List<Task>> getTasks () async {
//     Database db = await instance.database;
//     var tasks = await db.query('tasks', orderBy: 'name');
//     List<Task> tasklist = tasks.isNotEmpty ? tasks.map((e) => Task.fromMap(e)).toList() : [];
//     return tasklist;
//   }

//   Future <int> add (Task task) async {
//     Database db = await instance.database;
//     return await db.insert('tasks', task.toMap());
//   }

//   Future <int> remove (int id) async {
//     Database db = await instance.database;
//     return await db.delete('tasks', where: 'id = ?', whereArgs:[id]);
//   }
// }