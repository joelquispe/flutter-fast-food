import 'package:ecommercesmall/src/core/models/product.model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [
    Product(
        idProduct: "1",
        description: "La mejor hamburguesa de la ciudad",
        name: "Hamburguesa",
        price: 20.00,
        image:
            "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg"),
    Product(
        idProduct: "2",
        name: "Pollo a la brasa",
        description: "El mejor pollo a la brasa de la ciudad",
        price: 35.00,
        image:
            "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg"),
    Product(
        idProduct: "3",
        name: "Chaufa",
        description: "La mejor chaufa de la ciudad",
        price: 15.00,
        image:
            "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg"),
    Product(
        idProduct: "4",
        name: "Porcion de wantan",
        description: "La mejor porcion de wantan de la ciudad",
        price: 8.00,
        image:
            "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg"),
    Product(
        idProduct: "5",
        name: "Lomo saltado",
        description: "El mejor lomo saltado de la ciudad",
        price: 40.00,
        image:
            "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg"),
    Product(
        idProduct: "6",
        name: "Monstrito",
        description: "El mejor monstrito de la ciudad",
        price: 50.00,
        image:
            "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg"),
  ];
  List<Product> filterProducts = [];

  ProductProvider() {
    filterProducts = products;
  }

  onSearchProducts(String value) {
    if (value.isEmpty) {
      filterProducts = products;
    } else {
      String inputText = value.toLowerCase();
      filterProducts = products.where((element) {
        return element.name.toLowerCase().contains(inputText);
      }).toList();
    }

    notifyListeners();
  }
}
