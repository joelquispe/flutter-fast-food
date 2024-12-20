import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Mis direcciones",	
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
                  leadingIcon: Icons.place,
                  title: "Mi hogar",
                  subtitle: "av. perú 123, Lima, Perú",
                  onTap: () {
                    context.push("${Routes.addresses}/edit/$index");
                   
                  },
                );
              },
            ),
          ),
          CustomButtonWidget(
            backgroundColor: secondaryColor,
            text: "Agregar dirección",
            onTap: () {
               context.push("${Routes.addresses}/create");
             
            },
          ),
        ],
      ),
    );
  }
}
