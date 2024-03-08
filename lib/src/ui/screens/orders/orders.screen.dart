import 'package:ecommercesmall/src/router/routes.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_listTile.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Mis ordenes",
      body: ListView.separated(
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
            leadingIcon: FontAwesomeIcons.box,
            title: "Orden 0101",
            subtitle: "Hora: 11:22",
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Entregado",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            onTap: () {
              context.push("${Routes.orders}/0101");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const OrdersDetailScreen(
              //       id: "0101",
              //     ),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
