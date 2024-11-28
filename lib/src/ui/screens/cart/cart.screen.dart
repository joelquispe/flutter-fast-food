import 'package:ecommercesmall/src/common/constants/const.dart';
import 'package:ecommercesmall/src/config/hiveManager.config.dart';
import 'package:ecommercesmall/src/core/models/cartItem.model.dart';
import 'package:ecommercesmall/src/ui/providers/cart.provider.dart';
import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_card_item_cart.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/cart/widgets/listTile_price_Cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartLocal();
  }

  getCartLocal() {
    final value = HiveManager.mainBox!.get(HIVE_KEYS_CART);
    
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return MainLayout(
        appBarTitle: "Carrito de compras",
        isPadding: false,
        body: Column(
          children: [
            Expanded(
              child: cartProvider.cart.amount == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 9.w,
                        ),
                        Text(
                          "Carrito vacío",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: cartProvider.cart.items.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      separatorBuilder: (context, index) {
                        return Container(
                          color: Colors.grey.shade300,
                          height: 1,
                        );
                      },
                      itemBuilder: (context, index) {
                        CartItem cartItem = cartProvider.cart.items[index];
                        return CustomCardItemCart(
                          cartItem: cartItem,
                        );
                      },
                    ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                color: fourthColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const ListTilePriceCart(
                    label: "Delivered",
                    value: "10.00",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTilePriceCart(
                    label: "SubTotal",
                    value: cartProvider.cart.total.toString(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTilePriceCart(
                    label: "Total",
                    value: (cartProvider.cart.total + 10).toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonWidget(
                    text: "Ir a pagar",
                    onTap: () {
                      context.push(Routes.checkout);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
