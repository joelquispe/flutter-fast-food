import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/material.dart';

class OrdersDetailScreen extends StatelessWidget {
  final String id;
  const OrdersDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBarTitle: "Mi orden : $id",
        body: const Column(
          children: [Text("Detail order")],
        ));
  }
}
