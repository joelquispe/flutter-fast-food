import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_cached_network_image.widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCardCheckoutWidget extends StatelessWidget {
  const ProductCardCheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCachedNetworkImageWidget(
          imageUrl:
              "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg",
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pollo a la brasa",
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "S/20.00",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Cantidad: 10",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
