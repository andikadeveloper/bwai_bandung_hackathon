import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateTransaction {
  final TransactionRepository repository;

  CreateTransaction(this.repository);

  Future<Result<bool>> call({
    required int amount,
    required String note,
    required int categoryId,
    required DateTime transactionDate,
  }) {
    return repository.create(
      amount: amount,
      note: note,
      categoryId: categoryId,
      transactionDate: transactionDate,
    );
  }
}
