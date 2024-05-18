import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/enums/category_type.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/get_default_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/create_transaction.dart';
import 'package:injectable/injectable.dart';

part 'form_transaction_state.dart';

@injectable
class FormTransactionCubit extends Cubit<FormTransactionState> {
  final CreateTransaction _createTransaction;
  final GetDefaultCategory _getDefaultCategory;

  FormTransactionCubit(
    this._createTransaction,
    this._getDefaultCategory,
  ) : super(FormTransactionState());

  void getDefaultCategory() async {
    final result = await _getDefaultCategory();

    result.when(
      success: (category) => emit(state.copyWith(category: category)),
      failure: (_) {},
    );
  }

  void setAmount(int amount) {
    emit(state.copyWith(amount: amount));
  }

  void setNote(String note) {
    emit(state.copyWith(note: note));
  }

  void setCategory(Category category) {
    emit(state.copyWith(category: category));
  }

  void setTransactionDate(DateTime transactionDate) {
    emit(state.copyWith(transactionDate: transactionDate));
  }

  void reset() {
    emit(FormTransactionState());
  }

  void addTransaction() async {
    emit(state.copyWith(isLoading: true));

    final result = await _createTransaction(
      amount: state.amount,
      note: state.note,
      categoryId: state.category.id,
      transactionDate: state.transactionDate,
    );

    result.when(
      success: (_) => emit(state.copyWith(isSuccess: true)),
      failure: (message) => emit(state.copyWith(isSuccess: false)),
    );

    emit(state.copyWith(isLoading: false));
  }
}
