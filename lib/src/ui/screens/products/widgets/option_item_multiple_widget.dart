import 'package:flutter/material.dart';

class OptionItemMultipleWidget extends StatelessWidget {
  final String name;
  final bool value;
  final void Function(bool?)? onChanged;
  const OptionItemMultipleWidget({
    super.key,
    required this.name,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      title: Text(name),
      value: value,
      onChanged: onChanged,
    );
  }
}
