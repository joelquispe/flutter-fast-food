import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercesmall/src/common/constants/data.dart';
import 'package:ecommercesmall/src/common/utils/flutterToast.util.dart';
import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_back_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/checkout/widgets/card_item_checkout.widget.dart';
import 'package:ecommercesmall/src/ui/screens/checkout/widgets/checkout_price_total.widget.dart.dart';
import 'package:ecommercesmall/src/ui/global_widgets/product_card_checkout.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isDiscount = false;
  String methodPaymentSelected = "";
  String cuponSelected = "";
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      bottomBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: CustomButtonWidget(text: "Pagar", onTap: () {}),
      ),
      appBarTitle: "Finalizar pedido",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detalles de Entrega",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardItemCheckoutWidget(
              body: Column(
                children: [
                  ListTile(
                    onTap: () {
                      context.push(Routes.addresses);
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.map_sharp,
                      size: 22,
                    ),
                    title: Text(
                      "Jiron peru 123",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.motorcycle),
                    title: Text(
                      "Delivery 15 min",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Métodos de pago",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardItemCheckoutWidget(
              body: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () async {
                      final result = await context.push(Routes.methodsPayments);
                      if (result != null) {
                        debugPrint(result.toString());
                        methodPaymentSelected = methodPaymentsData.firstWhere((element) => element.id == result).name;
                      }
                    },
                    leading: const Icon(Icons.payment),
                    title: Text(
                      methodPaymentSelected.isEmpty ? "Elegir método de pago" : methodPaymentSelected,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () async {
                      final result = await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          final tfCouponController = TextEditingController();
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomTextFieldWidget(
                                    label: "Cupón",
                                    hintText: "YOECODEIBK",
                                    controller: tfCouponController,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomButtonWidget(
                                    text: "Canjear",
                                    onTap: () {
                                      final isExistCoupon = couponsData.any((element) => element.code == tfCouponController.text);
                                      if (isExistCoupon) {
                                        final coupon = couponsData.firstWhere((element) => element.code == tfCouponController.text);
                                        if (!coupon.isActive) {
                                          showToastUtil("El cupon ha expirado");
                                          return;
                                        }
                                        Navigator.pop(context, tfCouponController.text);
                                        return;
                                      }
                                      showToastUtil("El cupon es invalido");
                                      // show toast
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  CustomBackButtonWidget(
                                    text: "Cancelar",
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      if (result != null) {
                        setState(() {
                          cuponSelected = result;
                        });
                      }
                    },
                    leading: const Icon(
                      FontAwesomeIcons.ticket,
                    ),
                    title: Text(
                      cuponSelected.isEmpty ? "Agregar cupón" : cuponSelected,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Mis productos",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardItemCheckoutWidget(
              body: SizedBox(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    ProductCardCheckoutWidget(),
                    ProductCardCheckoutWidget(),
                    ProductCardCheckoutWidget(),
                    ProductCardCheckoutWidget(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Resumen de pedido",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardItemCheckoutWidget(body: CheckoutPriceTotalWidget()),
          ],
        ),
      ),
    );
  }
}





