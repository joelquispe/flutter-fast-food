
import 'package:realm/realm.dart';
part 'product.schema.g.dart';

@RealmModel()
class $ProductSchema {
  late String idProduct;
  late String name;
  late String description;
  late double price;
  late String image;
}


