import 'dart:async';

import 'package:app/features/home/data/source/local/dao/user_dao.dart';
import 'package:app/features/home/data/source/local/entity/user_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [UserEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
