import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpsertTransaction {
  final TransactionRepository repository;

  UpsertTransaction(this.repository);

  Future<Result<bool>> call({
    int? id,
    required int amount,
    required String note,
    required int categoryId,
    required DateTime transactionDate,
  }) {
    if (id != null) {
      return repository.update(
        id: id,
        amount: amount,
        note: note,
        categoryId: categoryId,
        transactionDate: transactionDate,
      );
    }

    return repository.create(
      amount: amount,
      note: note,
      categoryId: categoryId,
      transactionDate: transactionDate,
    );
  }
}
