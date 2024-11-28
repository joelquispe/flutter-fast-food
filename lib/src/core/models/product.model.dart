class Product {
  String idProduct;
  String name;
  String description;
  double price;
  String image;

  Product({
    required this.idProduct,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {'idProduct': idProduct, 'name': name, 'description': description, 'price': price, 'image': image};
  }

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      idProduct: map['idProduct'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      image: map['image'],
    );
  }
}
