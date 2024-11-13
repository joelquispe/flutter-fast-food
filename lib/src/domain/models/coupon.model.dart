import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Coupon {
  final String id;
  final String code;
  final bool isActive;
  final double value;
  Coupon({
    required this.id,
    required this.code,
    required this.isActive,
    required this.value,
  });
  
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'isActive': isActive,
      'value': value,
    };
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      id: map['id'] as String,
      code: map['code'] as String,
      isActive: map['isActive'] as bool,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coupon.fromJson(String source) => Coupon.fromMap(json.decode(source) as Map<String, dynamic>);
}
