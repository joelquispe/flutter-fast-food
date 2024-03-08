import 'package:ecommercesmall/src/domain/models/cartItem.model.dart';
import 'package:ecommercesmall/src/domain/models/product.model.dart';
import 'package:ecommercesmall/src/domain/providers/cart.provider.dart';
import 'package:ecommercesmall/src/domain/providers/product.provider.dart';
import 'package:ecommercesmall/src/common/helpers/flutterToast.helper.dart';
import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductProvider productProvider;
  late Product product;
  int quantity = 1;
  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    getProduct();
  }

  getProduct() {
    product = productProvider.products.firstWhere((element) => element.idProduct == widget.id);
    print(product.image);
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return MainLayout(
      appBarTitle: product.name,
      isPadding: false,
      body: Column(
        children: [
          Image.network(
            product.image,
            height: 32.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.description,
                        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey.shade700, fontSize: 16.sp),
                      ),
                    ],
                  )),
                  Text(
                    "S/${product.price}",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButtonWidget(
                            text: "Agregar",
                            onTap: () {
                              print(product.idProduct);
                              CartItem cartItem = CartItem(
                                item: product,
                                quantity: quantity,
                              );
                              bool isAddItem = cartProvider.addItem(cartItem);
                              if (isAddItem) {
                                showToastHelper(
                                  "Se agrego al carrito",
                                  secondaryColor,
                                );
                                context.pop();
                              } else {
                                showToastHelper(
                                  "El producto ya esta agregado",
                                  Colors.grey.shade600,
                                );
                              }
                            }),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.minus,
                              ),
                            ),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
