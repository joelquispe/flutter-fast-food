// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductSchema extends $ProductSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductSchema(
    String idProduct,
    String name,
    String description,
    double price,
    String image,
  ) {
    RealmObjectBase.set(this, 'idProduct', idProduct);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'image', image);
  }

  ProductSchema._();

  @override
  String get idProduct =>
      RealmObjectBase.get<String>(this, 'idProduct') as String;
  @override
  set idProduct(String value) => RealmObjectBase.set(this, 'idProduct', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  Stream<RealmObjectChanges<ProductSchema>> get changes =>
      RealmObjectBase.getChanges<ProductSchema>(this);

  @override
  ProductSchema freeze() => RealmObjectBase.freezeObject<ProductSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProductSchema._);
    return const SchemaObject(
        ObjectType.realmObject, ProductSchema, 'ProductSchema', [
      SchemaProperty('idProduct', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('image', RealmPropertyType.string),
    ]);
  }
}
