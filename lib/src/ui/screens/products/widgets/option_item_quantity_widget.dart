import 'package:flutter/material.dart';

class OptionItemQuantityWidget extends StatelessWidget {
  final String name;
  final Object? groupValue;
  final Object value;
  final void Function(Object?)? onChanged;
  const OptionItemQuantityWidget({
    super.key,
    required this.name,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 6,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.remove,
                    size: 16,
                  )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "1",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 6,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
