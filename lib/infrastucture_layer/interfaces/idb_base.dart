import 'package:sqflite/sqflite.dart';

abstract interface class IDbBase {
  Future<Database> get database;
}
