import 'package:ecommercesmall/src/ui/global_widgets/custom_back_button.widget.dart';
import 'package:flutter/material.dart';

Future<T?> showModalBottomSheetUtil<T>(BuildContext context, Widget body) async{
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: body),
      );
    },
  );
}
