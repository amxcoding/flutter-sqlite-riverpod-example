import '../../domain_layer/entities/task.dart';

abstract interface class ITaskDao {
  Future<List<Task>> getAll();
  Future<int> addTask(Task task);
  // TODO update, delete
}
