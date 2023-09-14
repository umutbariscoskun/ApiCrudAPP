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

  const HomeState({
    this.homeStatus = HomeStatus.initial,
    this.accountEntityList = const [],
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<AccountEntity>? accountEntityList,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      accountEntityList: accountEntityList ?? this.accountEntityList,
    );
  }

  @override
  List<Object?> get props => [
        homeStatus,
        accountEntityList,
      ];
}
