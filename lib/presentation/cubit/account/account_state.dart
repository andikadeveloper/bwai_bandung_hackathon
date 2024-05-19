part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.loading() = _Loading;
  const factory AccountState.success(int? amount) = _Success;
  const factory AccountState.failure(String message) = _Failure;
}
