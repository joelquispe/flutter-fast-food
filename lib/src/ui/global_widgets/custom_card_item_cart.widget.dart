import 'package:ecommercesmall/src/domain/models/cartItem.model.dart';
import 'package:ecommercesmall/src/domain/providers/cart.provider.dart';
import 'package:ecommercesmall/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCardItemCart extends StatelessWidget {
  final CartItem cartItem;
  const CustomCardItemCart({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () {
            context.push("${Routes.detailProduct}/${cartItem.item.idProduct}");
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg",
                    width: 120,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "S/${cartItem.item.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cartProvider.decrementQuantity(cartItem);
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.minus,
                          ),
                        ),
                        Text(
                          cartItem.quantity.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cartProvider.incrementQuantity(cartItem);
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.plus,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
