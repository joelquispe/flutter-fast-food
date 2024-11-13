import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBackButtonWidget extends StatelessWidget {
  final String? text;
  
  const CustomBackButtonWidget({
    super.key,
    this.text,
    
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: (){
          context.pop();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text ?? "Cancelar",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
