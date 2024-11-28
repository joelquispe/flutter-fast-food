import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OptionItemModel {
  final String name;
  final String value;
  final bool isSelected;
  OptionItemModel({
    required this.name,
    required this.value,
    required this.isSelected,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
      'isSelected': isSelected,
    };
  }

  factory OptionItemModel.fromMap(Map<String, dynamic> map) {
    return OptionItemModel(
      name: map['name'] as String,
      value: map['value'] as String,
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionItemModel.fromJson(String source) => OptionItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
