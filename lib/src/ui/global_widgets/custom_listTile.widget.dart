import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomListTileWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String? assetIcon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final void Function()? onTap;
  const CustomListTileWidget({
    super.key,
    required this.leadingIcon,
    this.assetIcon,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: assetIcon != null ? Image.asset(assetIcon!) : Icon(
        leadingIcon,
        color: primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
      trailing: trailing ?? Icon(
        Icons.arrow_forward_ios_outlined,
        size: 16,
        color: Colors.grey.shade500,
      ),
      onTap: onTap,
    );
  }
}
