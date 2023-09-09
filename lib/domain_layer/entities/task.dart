import 'dart:convert';
import 'package:flutter_sql_riverpod_example_v2/domain_layer/valueobjects/entity_base.dart';

/*
 * Needs to be here else the domainlayer will have a dependency on the infrastructure layer 
 */
class TaskTable {
  TaskTable._();

  static const String tblName = 'tblTask';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnNote = 'note';
  static const String columnDate = 'date';
  static const String columnTime = 'time';
  static const String columnCompleted = 'completed';
  static const String columnCreatedOn = 'created_on';
}

class Task extends EntityBase {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String time;
  final bool completed;

  Task({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.time,
    required this.completed,
    super.createdOn,
  });

  Task copyWith({
    int? id,
    String? title,
    String? note,
    String? date,
    String? time,
    bool? completed,
    String? createdOn,
  }) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        date: date ?? this.date,
        time: time ?? this.time,
        completed: completed ?? this.completed,
        createdOn: createdOn ?? DateTime.now().toString());
  }

  Map<String, dynamic> toMap() {
    return {
      TaskTable.columnId: id,
      TaskTable.columnTitle: title,
      TaskTable.columnNote: note,
      TaskTable.columnDate: date,
      TaskTable.columnTime: time,
      TaskTable.columnCompleted: completed ? 1 : 0,
      TaskTable.columnCreatedOn: createdOn,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    print('---->>>>> $map'); // TODO

    return Task(
      id: map[TaskTable.columnId],
      title: map[TaskTable.columnTitle] ?? '',
      note: map[TaskTable.columnNote] ?? '',
      date: map[TaskTable.columnDate] ?? '',
      time: map[TaskTable.columnTime] ?? '',
      completed: map[TaskTable.columnCreatedOn] == 1 ? true : false,
      createdOn: map[TaskTable.columnCreatedOn],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, note: $note, date: $date, time: $time, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.note == note &&
        other.date == date &&
        other.time == time &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        note.hashCode ^
        date.hashCode ^
        time.hashCode ^
        completed.hashCode;
  }
}
