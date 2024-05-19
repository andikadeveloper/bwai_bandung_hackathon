import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/account_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAccountBalance {
  final AccountRepository repository;

  GetAccountBalance(this.repository);

  Future<Result<int>> call() async {
    return await repository.getAmount();
  }
}
