import 'package:flutter/material.dart';

class CustomListTileOptionCancelOrderWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const CustomListTileOptionCancelOrderWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w500,),),
      onTap: onTap,
      trailing:  Icon(
        Icons.arrow_forward_ios_outlined,
        size: 16,
        color: Colors.grey.shade500,
      ),
    );
  }
}