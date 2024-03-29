// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AccountModel {
  AccountModel({
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.salary,
    required this.phoneNumber,
    required this.identityNumber,
    required this.id,
  });

  final String name;
  final String surname;
  final DateTime birthDate;
  final int salary;
  final String phoneNumber;
  final String identityNumber;
  final String id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'sallary': salary,
      'phoneNumber': phoneNumber,
      'identityNumber': identityNumber,
      'id': id,
    };
  }

  factory AccountModel.fromJson(Map<String, dynamic> map) {
    return AccountModel(
      name: map['name'] as String,
      surname: map['surname'] as String,
      birthDate: DateTime.fromMicrosecondsSinceEpoch(map['birthDate'] as int),
      salary: map['sallary'] as int,
      phoneNumber: map['phoneNumber'] as String,
      identityNumber: map['identityNumber'] as String,
      id: map["id"].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromMap(String source) =>
      AccountModel.fromJson(json.decode(source) as Map<String, dynamic>);
}
