import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllTransactions {
  final TransactionRepository _transactionRepository;

  GetAllTransactions(this._transactionRepository);

  Future<Result<List<Transaction>>> call() {
    // get DateTime for last day of this month
    final DateTime now = DateTime.now();
    final DateTime lastDayOfThisMonth = DateTime(now.year, now.month + 1, 0);

    // get DateTime for first day of this month
    final DateTime firstDayOfThisMonth = DateTime(now.year, now.month, 1);

    return _transactionRepository.getTransactions(
      startDate: firstDayOfThisMonth,
      endDate: lastDayOfThisMonth,
    );
  }
}
