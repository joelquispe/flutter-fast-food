import 'package:hive/hive.dart';

class HiveManager {
  static Box? mainBox;

  static init() async {
    await Hive.openBox("ecommerceFood");
    mainBox = Hive.box("ecommerceFood");
  
  }
}
