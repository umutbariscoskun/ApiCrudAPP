part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

extension HomeStatusExt on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final List<AccountEntity> accountEntityList;
  final String name;
  final String surname;
  final String phoneNumber;
  final String salary;
  final DateTime? birthDate;
  final String identityNumber;

  const HomeState({
    this.homeStatus = HomeStatus.initial,
    this.accountEntityList = const [],
    this.name = '',
    this.surname = '',
    this.phoneNumber = '',
    this.salary = '',
    this.birthDate,
    this.identityNumber = '',
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<AccountEntity>? accountEntityList,
    String? name,
    String? surname,
    String? phoneNumber,
    String? salary,
    DateTime? birthDate,
    String? identityNumber,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      accountEntityList: accountEntityList ?? this.accountEntityList,
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
        homeStatus,
        accountEntityList,
        name,
        surname,
        phoneNumber,
        salary,
        birthDate,
        identityNumber,
        identityHashCode(this),
      ];
}
