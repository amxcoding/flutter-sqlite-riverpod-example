import '../domain_layer/entities/task.dart';
import 'interfaces/idb_base.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbBase implements IDbBase {
  // Begin singleton
  static final DbBase _instance = DbBase._internal();
  DbBase._internal();
  factory DbBase() =>
      _instance; // factory constructors are used to return a single instance
  // End singleton

  static const dbName = 'tasks.db';
  static Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), dbName);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onOpen: _onOpen,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE ${TaskTable.tblName} (
          ${TaskTable.columnId} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${TaskTable.columnTitle} TEXT, 
          ${TaskTable.columnNote} TEXT, 
          ${TaskTable.columnTime} TEXT, 
          ${TaskTable.columnDate} TEXT, 
          ${TaskTable.columnCompleted} INTEGER,
          ${TaskTable.columnCreatedOn} TEXT);""");
  }

  // TODO: remove for testing purposes only
  Future<void> _onOpen(Database db) async {
    // final task = Task(
    //     title: 'Testing title',
    //     note: 'Some long note ...',
    //     date: '09-09-2023',
    //     time: '12.30 pm',
    //     completed: true);
    // final mapedValues = task.toMap();

    // await db.insert(TaskTable.tblName, mapedValues);
  }
}
