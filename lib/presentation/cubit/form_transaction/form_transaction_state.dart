part of 'form_transaction_cubit.dart';

class FormTransactionState {
  final int amount;
  final String note;
  final int categoryId;
  final DateTime transactionDate;
  final bool isLoading;
  final bool isSuccess;

  FormTransactionState({
    this.amount = 0,
    this.note = '',
    this.categoryId = 0,
    DateTime? transactionDate,
    this.isLoading = false,
    this.isSuccess = false,
  }) : transactionDate = transactionDate ?? DateTime.now();

  FormTransactionState copyWith({
    int? amount,
    String? note,
    int? categoryId,
    DateTime? transactionDate,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return FormTransactionState(
      amount: amount ?? this.amount,
      note: note ?? this.note,
      categoryId: categoryId ?? this.categoryId,
      transactionDate: transactionDate ?? this.transactionDate,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
