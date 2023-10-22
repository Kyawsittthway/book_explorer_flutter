// database.dart

// required package imports
import 'dart:async';
import 'package:book_explorer/data/local/dao/user_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../model/user_vo.dart';


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [UserVO])
abstract class AppDatabase extends FloorDatabase {
  UserDao get personDao;
}