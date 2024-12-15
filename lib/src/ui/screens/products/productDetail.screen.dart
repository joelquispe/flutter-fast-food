import 'package:ecommercesmall/src/common/utils/flutterToast.util.dart';
import 'package:ecommercesmall/src/core/models/cartItem.model.dart';
import 'package:ecommercesmall/src/core/models/option_item_model.dart';
import 'package:ecommercesmall/src/core/models/product.model.dart';
import 'package:ecommercesmall/src/ui/providers/cart.provider.dart';
import 'package:ecommercesmall/src/ui/providers/product.provider.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_divider.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_product_recommended.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/products/widgets/option_item_multiple_widget.dart';
import 'package:ecommercesmall/src/ui/screens/products/widgets/option_item_quantity_widget.dart';
import 'package:ecommercesmall/src/ui/screens/products/widgets/option_item_single_widget.dart';
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
  String optionSelected = "1";
  int groupValue = 0;

  List<OptionItemModel> optionsMultiple = [
    OptionItemModel(name: "Mayonesa", value: "1", isSelected: false),
    OptionItemModel(name: "Mostaza", value: "2", isSelected: false),
    OptionItemModel(name: "Ketchup", value: "3", isSelected: false),
  ];

  List<OptionItemModel> optionsQuantity = [
    OptionItemModel(name: "Tradicional", value: "1", isSelected: false),
    OptionItemModel(name: "Crispi", value: "2", isSelected: false),
  ];

  List<OptionItemModel> optionsSingle = [
    OptionItemModel(name: "Tradicional", value: "1", isSelected: false, extraPrice: 5),
    OptionItemModel(name: "Carne Brava", value: "2", isSelected: false,extraPrice: 10),
  ];

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    getProduct();
  }

  getProduct() {
    product = productProvider.products.firstWhere((element) => element.idProduct == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return MainLayout(
      appBarTitle: product.name,
      isPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.image,
              height: 30.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.description,
                        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey.shade700, fontSize: 16.sp),
                      ),
                      CustomDividerWidget(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cremas",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final element = optionsMultiple[index];
                              return OptionItemMultipleWidget(
                                name: element.name,
                                value: element.value == "1",
                                onChanged: (value) {},
                              );
                            },
                            separatorBuilder: (context, index) {
                              return CustomDividerWidget();
                            },
                            itemCount: optionsMultiple.length,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pollo",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final element = optionsQuantity[index];
                              return OptionItemQuantityWidget(
                                groupValue: optionSelected,
                                name: element.name,
                                value: element.value == "1",
                                onChanged: (value) {},
                              );
                            },
                            separatorBuilder: (context, index) {
                              return CustomDividerWidget();
                            },
                            itemCount: optionsQuantity.length,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Carne",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final element = optionsSingle[index];
                              return OptionItemSingleWidget(
                                groupValue: optionSelected,
                                name: element.name,
                                extraPrice: element.extraPrice,
                                value: element.value == "1",
                                onChanged: (value) {},
                              );
                            },
                            separatorBuilder: (context, index) {
                              return CustomDividerWidget();
                            },
                            itemCount: optionsSingle.length,
                          ),
                        ],
                      ),
                      CustomDividerWidget(
                        height: 20,
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return CustomProductRecommendedWidget();
                          },
                        ),
                      ),
                      CustomDividerWidget(
                        height: 20,
                      )
                    ],
                  ),
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
                              CartItem cartItem = CartItem(
                                item: product,
                                quantity: quantity,
                              );
                              bool isAddItem = cartProvider.addItem(cartItem);
                              if (isAddItem) {
                                showToastUtil(
                                  "Se agrego al carrito",
                                );
                                context.pop();
                              } else {
                                showToastUtil(
                                  "El producto ya esta agregado",
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
          ],
        ),
      ),
    );
  }
}
