import 'package:flutter_sql_riverpod_example_v2/application_layer/interfaces/itask_dao.dart';
import 'package:flutter_sql_riverpod_example_v2/domain_layer/entities/task.dart';
import 'package:flutter_sql_riverpod_example_v2/infrastucture_layer/dependencies.dart';
import 'package:flutter_sql_riverpod_example_v2/infrastucture_layer/interfaces/idb_base.dart';
import 'package:riverpod/riverpod.dart';

class TaskDao implements ITaskDao {
  final Ref ref;
  IDbBase? _dbBase;

  TaskDao({required this.ref}) {
    _dbBase = ref.read(dbBaseProvider);
  }

  @override
  Future<int> addTask(Task task) async {
    final db = await _dbBase!.database;
    final result = await db.insert(TaskTable.tblName, task.toMap());

    return result;
  }

  @override
  Future<List<Task>> getAll() async {
    final db = await _dbBase!.database;
    final tasksMap = await db.query(TaskTable.tblName);

    return tasksMap.map((e) => Task.fromMap(e)).toList();
  }
}
