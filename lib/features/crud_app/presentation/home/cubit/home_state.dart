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

  const HomeState({
    this.homeStatus = HomeStatus.initial,
  });

  @override
  List<Object?> get props => [
        homeStatus,
      ];
}
