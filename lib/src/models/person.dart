import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
part 'person.mapper.dart';

@MappableClass()
class Person with PersonMappable {
  const Person({
    required this.firstName,
    required this.lastName,
    required this.age,
  });
  
  factory Person.fromJson(String json) => PersonMapper.fromJson(json);

  factory Person.fromMap(Map<String, Object?> map) => PersonMapper.fromMap(map);

  final String firstName;
  final String lastName;
  final int age;

  void method() {
    debugPrint('$firstName $lastName says hello world');
  }
}
