import 'package:ecommercesmall/src/domain/models/product.model.dart';

class StoreModel {
  String idStore;
  String name;
  String logo;
  String description;
  String phone;
  int idCategory;
  List<Product> items;

  StoreModel({
    required this.idStore,
    required this.name,
    required this.logo,
    required this.description,
    required this.phone,
    required this.idCategory,
    required this.items,
  });
}
