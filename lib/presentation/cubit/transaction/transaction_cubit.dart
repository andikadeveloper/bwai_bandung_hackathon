import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/get_all_transactions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

@injectable
class TransactionCubit extends Cubit<TransactionState> {
  final GetAllTransactions getAllTransactions;

  TransactionCubit(
    this.getAllTransactions,
  ) : super(const TransactionState.initial()) {
    getAll();
  }

  Future<void> getAll() async {
    emit(const TransactionState.loading());

    var result = await getAllTransactions();

    result.when(
      success: (value) {
        emit(TransactionState.success(value));
      },
      failure: (message) {
        emit(TransactionState.failure(message));
      },
    );
  }
}
