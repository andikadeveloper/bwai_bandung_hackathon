import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/create_transaction.dart';
import 'package:injectable/injectable.dart';

part 'form_transaction_state.dart';

@injectable
class FormTransactionCubit extends Cubit<FormTransactionState> {
  final CreateTransaction createTransaction;

  FormTransactionCubit(this.createTransaction) : super(FormTransactionState());

  void setAmount(int amount) {
    emit(state.copyWith(amount: amount));
  }

  void setNote(String note) {
    emit(state.copyWith(note: note));
  }

  void setCategoryId(int categoryId) {
    emit(state.copyWith(categoryId: categoryId));
  }

  void setTransactionDate(DateTime transactionDate) {
    emit(state.copyWith(transactionDate: transactionDate));
  }

  void reset() {
    emit(FormTransactionState());
  }

  void addTransaction() async {
    emit(state.copyWith(isLoading: true));

    final result = await createTransaction(
      amount: state.amount,
      note: state.note,
      categoryId: state.categoryId,
      transactionDate: state.transactionDate,
    );

    result.when(
      success: (_) => emit(state.copyWith(isSuccess: true)),
      failure: (message) => emit(state.copyWith(isSuccess: false)),
    );

    emit(state.copyWith(isLoading: false));
  }
}
