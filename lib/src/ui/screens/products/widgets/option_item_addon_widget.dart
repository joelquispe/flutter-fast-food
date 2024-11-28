import 'package:flutter/material.dart';

class OptionItemAddonWidget extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  const OptionItemAddonWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
