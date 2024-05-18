import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/enums/category_type.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/get_default_category.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/get_transaction_by_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/upsert_transaction.dart';
import 'package:injectable/injectable.dart';

part 'form_transaction_state.dart';

@injectable
class FormTransactionCubit extends Cubit<FormTransactionState> {
  final UpsertTransaction _upsertTransaction;
  final GetDefaultCategory _getDefaultCategory;
  final GetTransactionById _getTransactionById;

  FormTransactionCubit(
    this._upsertTransaction,
    this._getDefaultCategory,
    this._getTransactionById,
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

  void getTransactionById(int id) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getTransactionById(id);

    result.when(
      success: (transaction) {
        emit(state.copyWith(
          id: transaction.id,
          amount: transaction.amount,
          note: transaction.note,
          category: transaction.category,
          transactionDate: transaction.transactionDate,
        ));
      },
      failure: (err) {},
    );

    emit(state.copyWith(isLoading: false));
  }

  void reset() {
    emit(FormTransactionState());
  }

  void upsertTransaction() async {
    emit(state.copyWith(isLoading: true));

    final result = await _upsertTransaction(
      id: state.id,
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
