import 'package:ecommercesmall/src/core/models/product.model.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCardItem extends StatelessWidget {
  final Product product;
  final void Function()? onTapItem;
  final void Function()? onAddCart;
  const CustomCardItem({
    super.key,
    required this.product,
    this.onTapItem,
    this.onAddCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: onTapItem,
          child: Container(
            padding: const EdgeInsets.all(12),
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "S/${product.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButtonWidget(
                        text: "Agregar",
                        onTap: onAddCart,
                        height: 40,
                        fontSize: 15.sp,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://gestion.pe/resizer/i5vGkdDtf5Hm87rWfJgyCvkwEyI=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/IOUUSANWTNDP7G3IJPGGO6NZOI.jpg",
                    width: 120,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
