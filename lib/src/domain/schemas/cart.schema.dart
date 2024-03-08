import 'package:ecommercesmall/src/domain/schemas/cartItem.schema.dart';
import 'package:realm/realm.dart';



@RealmModel()
class _CartSchema {
  late List<$CartItemSchema> items;
  late double total;
}
