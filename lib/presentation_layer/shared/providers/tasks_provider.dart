import 'package:flutter_sql_riverpod_example_v2/domain_layer/entities/task.dart';
import 'package:flutter_sql_riverpod_example_v2/infrastucture_layer/dependencies.dart';
import 'package:riverpod/riverpod.dart';

class TasksListNotifier extends StateNotifier<List<Task>> {
  final Ref ref;

  // initial tasks = []
  TasksListNotifier(this.ref) : super([]) {
    _init();
  }

  void _init() async {
    final taskDao = ref.watch(taskDaoProvider);
    final tasks = await taskDao.getAll();
    state = [...tasks];
  }

  // TODO add other crud operations
}

///
/// Provider for getting all tasks
///
final taskListProvider = StateNotifierProvider<TasksListNotifier, List<Task>>(
  (ref) {
    return TasksListNotifier(ref);
  },
);

///
/// Provider for getting filtered tasks
///
final tasksFilterByCompletedProvider = StateProvider.family<List<Task>, bool>(
  (ref, isCompleted) {
    final tasks = ref.watch(taskListProvider);

    return tasks.where((element) => element.completed == isCompleted).toList();
  },
);
