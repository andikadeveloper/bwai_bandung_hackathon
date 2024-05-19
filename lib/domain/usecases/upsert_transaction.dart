import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/enums/category_type.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/account_repository.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpsertTransaction {
  final TransactionRepository _transactionRepository;
  final AccountRepository _accountRepository;

  UpsertTransaction(this._transactionRepository, this._accountRepository);

  Future<Result<bool>> call({
    int? id,
    required int amount,
    required String note,
    required Category category,
    required DateTime transactionDate,
  }) async {
    final currentAccountAmountResult = await _accountRepository.getAmount();
    int accountAmount = currentAccountAmountResult.when(
        success: (value) => value, failure: (_) => 0);

    if (id != null) {
      return _transactionRepository.update(
        id: id,
        amount: amount,
        note: note,
        categoryId: category.id,
        transactionDate: transactionDate,
      );
    }

    if (category.type == CategoryType.income) {
      accountAmount += amount;
    } else if (category.type == CategoryType.expense) {
      accountAmount -= amount;
    }
    await _accountRepository.update(amount: accountAmount);

    return _transactionRepository.create(
      amount: amount,
      note: note,
      categoryId: category.id,
      transactionDate: transactionDate,
    );
  }
}
