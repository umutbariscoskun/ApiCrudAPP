part of 'account_fields_cubit.dart';

enum AccountFieldsStatus { initial, loading, success, failure }

extension AccountFieldsExt on AccountFieldsStatus {
  bool get isInitial => this == AccountFieldsStatus.initial;
  bool get isLoading => this == AccountFieldsStatus.loading;
  bool get isSuccess => this == AccountFieldsStatus.success;
  bool get isFailure => this == AccountFieldsStatus.failure;
}

class AccountFieldsState extends Equatable {
  final AccountFieldsStatus accountFieldsStatus;
  final String name;
  final String surname;
  final String phoneNumber;
  final String salary;
  final DateTime? birthDate;
  final String identityNumber;

  const AccountFieldsState({
    this.accountFieldsStatus = AccountFieldsStatus.initial,
    this.name = '',
    this.surname = '',
    this.phoneNumber = '',
    this.salary = '',
    this.birthDate,
    this.identityNumber = '',
  });

  AccountFieldsState copyWith({
    AccountFieldsStatus? accountFieldsStatus,
    String? name,
    String? surname,
    String? phoneNumber,
    String? salary,
    DateTime? birthDate,
    String? identityNumber,
  }) {
    return AccountFieldsState(
      accountFieldsStatus: accountFieldsStatus ?? this.accountFieldsStatus,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      salary: salary ?? this.salary,
      birthDate: birthDate ?? this.birthDate,
      identityNumber: identityNumber ?? this.identityNumber,
    );
  }

  @override
  List<Object?> get props => [
        accountFieldsStatus,
        name,
        surname,
        phoneNumber,
        salary,
        birthDate,
        identityNumber,
      ];
}
