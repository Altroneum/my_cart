import 'dart:async';
import 'package:floor/floor.dart';
import 'package:my_cart/database/daos/product_dao.dart';
import 'package:my_cart/models/product_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Product])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
}
