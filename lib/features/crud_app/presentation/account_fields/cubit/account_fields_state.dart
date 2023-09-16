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

  const AccountFieldsState({
    this.accountFieldsStatus = AccountFieldsStatus.initial,
  });

  AccountFieldsState copyWith({
    AccountFieldsStatus? accountFieldsStatus,
  }) {
    return AccountFieldsState(
      accountFieldsStatus: accountFieldsStatus ?? this.accountFieldsStatus,
    );
  }

  @override
  List<Object?> get props => [
        accountFieldsStatus,
      ];
}
