import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sql_riverpod_example_v2/presentation_layer/shared/providers/tasks_provider.dart';

class TasksList extends ConsumerWidget {
  final bool isCompleted;
  const TasksList(this.isCompleted, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTasks =
        ref.watch(tasksFilterByCompletedProvider(isCompleted));
    var color = _randomColor();

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: color.$1,
            child: Text(
              task.id.toString(),
              style: TextStyle(color: color.$2 ? Colors.white : Colors.black),
            ),
          ),
          title: Text(
            task.title,
            style: TextStyle(
                decoration: task.completed ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(task.date),
          trailing: Consumer(
            builder: (context, ref, child) {
              return Checkbox(
                value: task.completed,
                onChanged: (value) {
                  // TODO toggle task value + update in db
                },
              );
            },
          ),
          onLongPress: () async {
            await showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(); // TODO return task details
              },
            );
          },
        );
      },
    );
  }

  // random int between
  int _rib(int min, int max) {
    Random random = Random();
    return random.nextInt(max - min + 1) + min;
  }

  (Color, bool) _randomColor() {
    var color =
        Color.fromARGB(_rib(0, 255), _rib(0, 255), _rib(0, 255), _rib(0, 255));
    var r = color.red;
    var g = color.green;
    var b = color.blue;
    var luma = 0.2126 * r + 0.7152 * g + 0.0722 * b;
    var isDark = luma < 128 ? true : false;

    return (color, isDark);
  }
}
