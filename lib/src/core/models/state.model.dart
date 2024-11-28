// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class State {
  final int id;
  final String name;
  final int position;
  State({
    required this.id,
    required this.name,
    required this.position,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'position': position,
    };
  }

  factory State.fromMap(Map<String, dynamic> map) {
    return State(
      id: map['id'] as int,
      name: map['name'] as String,
      position: map['position'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory State.fromJson(String source) => State.fromMap(json.decode(source) as Map<String, dynamic>);
}
