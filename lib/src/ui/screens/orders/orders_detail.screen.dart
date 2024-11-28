import 'package:easy_stepper/easy_stepper.dart';
import 'package:ecommercesmall/src/common/constants/data.dart';
import 'package:ecommercesmall/src/common/utils/show_modal_bottom_sheet.util.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_back_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_divider.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/checkout/widgets/checkout_price_total.widget.dart.dart';
import 'package:ecommercesmall/src/ui/global_widgets/product_card_checkout.widget.dart';
import 'package:ecommercesmall/src/ui/screens/orders/widgets/custom_list_tile_option_cancel_order.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersDetailScreen extends StatefulWidget {
  final String id;
  const OrdersDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<OrdersDetailScreen> createState() => _OrdersDetailScreenState();
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  int activeStep = 2;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBarTitle: "Detalle de Orden",
        body: Column(
          children: [
            Column(
              children: [
                EasyStepper(
                  activeStep: activeStep,
                  activeStepTextColor: Colors.black87,
                  finishedStepTextColor: const Color.fromRGBO(0, 0, 0, 0.867),
                  internalPadding: 0,
                  padding: EdgeInsets.zero,
                  showLoadingAnimation: false,
                  stepRadius: 8,
                  lineStyle: LineStyle(lineType: LineType.normal, lineSpace: 0, lineLength: 60),
                  fitWidth: true,
                  showStepBorder: false,
                  steps: [
                    ...statesData.map(
                      (element) {
                        return EasyStep(
                          customStep: SizedBox(
                            width: double.infinity,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: activeStep >= element.position ? Colors.orange : Colors.white,
                              ),
                            ),
                          ),
                          customTitle: Text(
                            element.name,
                            softWrap: false,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          topTitle: element.id % 2 == 0 ? true : false,
                        );
                      },
                    ),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),
              ],
            ),
            CustomDividerWidget(),
            Column(
              children: [
                CustomListTileWidget(
                  leadingIcon: Icons.person,
                  title: "Shagy",
                  subtitle: "Nro° de Orden 102023",
                  onTap: () {},
                ),
              ],
            ),
            CustomDividerWidget(),
            Column(
              children: [
                SizedBox(
                  height: 220,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: const [
                      ProductCardCheckoutWidget(),
                      ProductCardCheckoutWidget(),
                      ProductCardCheckoutWidget(),
                      ProductCardCheckoutWidget(),
                    ],
                  ),
                )
              ],
            ),
            CustomDividerWidget(),
            CheckoutPriceTotalWidget(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CustomButtonWidget(
                    backgroundColor: Colors.red.shade800,
                    text: "Cancelar Pedido",
                    onTap: () {
                      // logic cancel order
                      showModalBottomSheetUtil(
                        context,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomListTileOptionCancelOrderWidget(
                              title: "Cambie de opinión",
                              onTap: () {
                                context.pop();
                              },
                            ),
                            CustomListTileOptionCancelOrderWidget(
                              title: "El motorizado ha tardado mucho tiempo",
                              onTap: () {},
                            ),
                            CustomListTileOptionCancelOrderWidget(
                              title: "Me equivoque en los productos seleccionados",
                              onTap: () {},
                            ),
                            CustomListTileOptionCancelOrderWidget(
                              title: "Ya no quiero comprar",
                              onTap: () {},
                            ),
                            CustomListTileOptionCancelOrderWidget(
                              title: "Otros",
                              onTap: () {},
                            ),
                            CustomBackButtonWidget(
                              text: "Cerrar",
                            )
                          ],
                        ),
                      );
                    }),
                CustomBackButtonWidget(
                  text: "Regresar",
                ),
              ],
            )
          ],
        ));
  }
}
