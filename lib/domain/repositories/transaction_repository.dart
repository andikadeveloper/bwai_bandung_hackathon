import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<Result<bool>> create({
    required int amount,
    required String note,
    required int categoryId,
    required DateTime transactionDate,
  });

  Future<Result<bool>> update({
    required int id,
    required int amount,
    required String note,
    required int categoryId,
    required DateTime transactionDate,
  });

  Future<Result<Transaction>> getById(int id);

  Future<Result<List<Transaction>>> getTransactions({
    required DateTime startDate,
    required DateTime endDate,
  });
}
