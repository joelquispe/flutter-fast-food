import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MethodPayment {
  final String id;
  final String name;
  MethodPayment({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory MethodPayment.fromMap(Map<String, dynamic> map) {
    return MethodPayment(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MethodPayment.fromJson(String source) => MethodPayment.fromMap(json.decode(source) as Map<String, dynamic>);
}
