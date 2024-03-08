import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return CustomListTileWidget(
            leadingIcon: Icons.notifications,
            title: "Pedido 12312",
            subtitle: "El pedido ha sido cancelado",
            onTap: () {},
          );
        }),
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.grey.shade300,
            height: 1,
          );
        },
        itemCount: 10);
  }
}
