import 'package:ecommercesmall/src/common/constants/data.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MethodsPaymentsScreen extends StatelessWidget {
  const MethodsPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Mis Métodos de pago",
      body: Column(
        children: [
          ...methodPaymentsData.map(
            (element) {
              return CustomListTileWidget(
                leadingIcon: Icons.payment,
                title: element.name,
                onTap: () {
                  context.pop(element.id);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
