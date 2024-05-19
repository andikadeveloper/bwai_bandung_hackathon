import 'package:bwai_bandung_hackathon/core/result/result.dart';

abstract class AccountRepository {
  Future<Result<bool>> update({required int amount});
  Future<Result<int>> getAmount();
  Future<Result<bool>> createAccount();
}
