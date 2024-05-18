import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTransactionById {
  final TransactionRepository _transactionRepository;

  GetTransactionById(this._transactionRepository);

  Future<Result<Transaction>> call(int id) {
    return _transactionRepository.getById(id);
  }
}
