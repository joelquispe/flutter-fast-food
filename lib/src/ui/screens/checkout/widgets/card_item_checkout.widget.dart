import 'package:flutter/material.dart';

class CardItemCheckoutWidget extends StatelessWidget {
  final Widget body;
  const CardItemCheckoutWidget({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 0.9,
          color: Colors.grey.shade300,
        ),
      ),
      child: body,
    );
  }
}
