import 'package:bwai_bandung_hackathon/core/result/result.dart';

abstract class TransactionRepository {
  Future<Result<bool>> create({
    required int amount,
    required String note,
    required int categoryId,
    required DateTime transactionDate,
  });
}
