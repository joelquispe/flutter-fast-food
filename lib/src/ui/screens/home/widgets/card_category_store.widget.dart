import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardCategoryStoreWidget extends StatefulWidget {
  final String title;
  final String image;
  const CardCategoryStoreWidget({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  State<CardCategoryStoreWidget> createState() => _CardCategoryStoreWidgetState();
}

class _CardCategoryStoreWidgetState extends State<CardCategoryStoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: NetworkImage(
              widget.image,
            ),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            opacity: 0.7),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600, color: fourthColor),
        ),
      ),
    );
  }
}
