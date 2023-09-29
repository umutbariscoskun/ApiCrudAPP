// ignore_for_file: public_member_api_docs, sort_constructors_first
class AccountEntity {
  final String name;
  final String surname;
  final DateTime birthDate;
  final int salary;
  final String phoneNumber;
  final String identityNumber;
  final String id;

  AccountEntity({
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.salary,
    required this.phoneNumber,
    required this.identityNumber,
    required this.id,
  });

  AccountEntity copyWith({
    String? name,
    String? surname,
    DateTime? birthDate,
    int? salary,
    String? phoneNumber,
    String? identityNumber,
    String? id,
  }) {
    return AccountEntity(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDate: birthDate ?? this.birthDate,
      salary: salary ?? this.salary,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      identityNumber: identityNumber ?? this.identityNumber,
      id: id ?? this.id,
    );
  }
}
