import 'package:flutter/material.dart';
import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({super.key});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Mis Tarjetas",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 20,
              separatorBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade300,
                  height: 1,
                );
              },
              itemBuilder: (context, index) {
                return CustomListTileWidget(
                  leadingIcon: FontAwesomeIcons.creditCard,
                  title: "xxxx-xxxx-xxxx-123$index",
                  subtitle: "Marcos Jose Quispe",
                  onTap: () {
                    context.push("${Routes.cardPayment}/edit/$index");
                  },
                );
              },
            ),
          ),
          CustomButtonWidget(
            backgroundColor: secondaryColor,
            text: "Agregar método de pago",
            onTap: () {
              context.push("${Routes.cardPayment}/create");
            },
          ),
        ],
      ),
    );
  }
}
