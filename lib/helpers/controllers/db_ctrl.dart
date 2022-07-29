import 'package:get/get.dart';
import 'package:my_cart/database/daos/product_dao.dart';
import 'package:my_cart/database/database.dart';

class DbCtrl extends GetxController {
  AppDatabase? appDatabase;
  iniDatabase() async {
    appDatabase ??=
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  ProductDao get productDao => appDatabase!.productDao;
}
