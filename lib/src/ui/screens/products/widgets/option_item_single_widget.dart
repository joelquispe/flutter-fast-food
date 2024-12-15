import 'package:flutter/material.dart';

class OptionItemSingleWidget extends StatelessWidget {
  final String name;
  final bool value;
  final Object? groupValue;
  final ValueChanged<Object?>? onChanged;
  final double? extraPrice;
  const OptionItemSingleWidget({
    super.key,
    required this.name,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.extraPrice,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile.adaptive(
      groupValue: groupValue,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name), extraPrice != null ? Text("S/${extraPrice!.toStringAsFixed(2)}") : SizedBox()],
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
