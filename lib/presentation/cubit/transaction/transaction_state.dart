part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.success(List<Transaction>? listTransaction) = _Success;
  const factory TransactionState.failure(String message) = _Failure;
}
