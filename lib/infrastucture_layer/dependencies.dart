import 'package:flutter_sql_riverpod_example_v2/application_layer/interfaces/itask_dao.dart';
import 'package:flutter_sql_riverpod_example_v2/infrastucture_layer/daos/task_dao.dart';
import 'package:flutter_sql_riverpod_example_v2/infrastucture_layer/db_base.dart';
import 'package:flutter_sql_riverpod_example_v2/infrastucture_layer/interfaces/idb_base.dart';
import 'package:riverpod/riverpod.dart';

final dbBaseProvider = Provider<IDbBase>((ref) => DbBase());
final taskDaoProvider = Provider<ITaskDao>((ref) => TaskDao(ref: ref));
