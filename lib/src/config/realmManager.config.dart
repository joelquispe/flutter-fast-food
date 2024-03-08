import 'package:ecommercesmall/src/domain/models/cartItem.model.dart';
import 'package:ecommercesmall/src/domain/schemas/product.schema.dart';
import 'package:realm/realm.dart';

class RealmManager {
  static final instance = RealmManager();

  late Realm realm; 

  init() {
    final config = Configuration.local([ProductSchema.schema,]);
    realm = Realm(config);
  }
}
