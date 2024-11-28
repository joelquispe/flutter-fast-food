import 'package:ecommercesmall/src/common/constants/const.dart';
import 'package:ecommercesmall/src/common/utils/flutterToast.util.dart';
import 'package:ecommercesmall/src/config/hiveManager.config.dart';
import 'package:ecommercesmall/src/core/models/cartItem.model.dart';
import 'package:ecommercesmall/src/core/models/product.model.dart';
import 'package:ecommercesmall/src/ui/providers/cart.provider.dart';
import 'package:ecommercesmall/src/ui/providers/product.provider.dart';
import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_card_item.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late CartProvider cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  addItemCart(Product product) {
    CartItem cartItem = CartItem(item: product, quantity: 1);
    bool isAddItem = cartProvider.addItem(cartItem);
    if (isAddItem) {
      HiveManager.mainBox!.put(HIVE_KEYS_CART, cartProvider.cart.toMap());
      showToastUtil(
        "Se agrego al carrito",
      );
    } else {
      showToastUtil(
        "El producto ya esta agregado",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return MainLayout(
      appBarTitle: "Productos",
        body: Column(
      children: [
        CustomTextFieldWidget(
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: "Buscar....",
          onChanged: (value) {
            productProvider.onSearchProducts(value);
          },
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: productProvider.filterProducts.length,
            separatorBuilder: (context, index) {
              return Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                height: 1,
              );
            },
            itemBuilder: (context, index) {
              Product product = productProvider.filterProducts[index];
              return CustomCardItem(
                product: product,
                onTapItem: () {
                  context.push(
                    "${Routes.detailProduct}/${product.idProduct}",
                  );
                },
                onAddCart: () {
                  addItemCart(product);
                },
              );
            },
          ),
        ),
      ],
    ));
  }
}
