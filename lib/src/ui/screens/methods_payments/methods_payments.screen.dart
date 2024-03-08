import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:ecommercesmall/src/ui/screens/methods_payments/form_methods_payments.screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MethodsPaymentsScreen extends StatelessWidget {
  const MethodsPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      
      appBarTitle: "Mis Métodos de pago",	
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FormMethodsPaymentsScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          CustomButtonWidget(
            backgroundColor: secondaryColor,
            text: "Agregar método de pago",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FormMethodsPaymentsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
