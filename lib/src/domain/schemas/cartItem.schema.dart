import 'package:realm/realm.dart';

import 'package:ecommercesmall/src/domain/schemas/product.schema.dart';


@RealmModel()
class $CartItemSchema {
  late $ProductSchema? item;
  late int quantity;
}
