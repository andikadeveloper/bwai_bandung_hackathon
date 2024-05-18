part of 'form_transaction_cubit.dart';

class FormTransactionState {
  final int amount;
  final String note;
  final Category category;
  final DateTime transactionDate;
  final bool isLoading;
  final bool isSuccess;

  FormTransactionState({
    this.amount = 0,
    this.note = '',
    this.category = const Category(
      id: 0,
      name: '',
      code: '',
      type: CategoryType.income,
    ),
    DateTime? transactionDate,
    this.isLoading = false,
    this.isSuccess = false,
  }) : transactionDate = transactionDate ?? DateTime.now();

  FormTransactionState copyWith({
    int? amount,
    String? note,
    Category? category,
    DateTime? transactionDate,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return FormTransactionState(
      amount: amount ?? this.amount,
      note: note ?? this.note,
      category: category ?? this.category,
      transactionDate: transactionDate ?? this.transactionDate,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
