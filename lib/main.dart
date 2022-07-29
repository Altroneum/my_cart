import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cart/helpers/controllers/db_ctrl.dart';
import 'package:my_cart/screens/login.dart';
import 'package:my_cart/screens/splash.dart';

void main() {
  runApp(MyApp());
  Future.delayed(const Duration(seconds: 4), (() => Get.to(const Login())));
}

class InitBinding implements Bindings {
  @override
  void dependencies() {
    DbCtrl dbCtrl = Get.put(DbCtrl());
    dbCtrl.iniDatabase();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBinding(),
      debugShowCheckedModeBanner: false,
      title: 'My Cart',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }
}
