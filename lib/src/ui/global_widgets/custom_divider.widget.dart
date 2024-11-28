import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  final double thickness;
  final double height;
  const CustomDividerWidget({
    super.key,
    this.thickness = 1,
    this.height = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade300,
      thickness: thickness,
      height: height,
    );
  }
}
