import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/data/model/transaction_model.dart';
import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<Result<bool>> create({
    required int amount,
    required String note,
    required int categoryId,
    required DateTime transactionDate,
  }) async {
    try {
      await Supabase.instance.client.from('transactions').insert({
        'amount': amount,
        'note': note,
        'category_id': categoryId,
        'transaction_date': transactionDate.toIso8601String(),
      });

      return const Result.success(true);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<bool>> update({
    required int id,
    required int amount,
    required String note,
    required int categoryId,
    required DateTime transactionDate,
  }) async {
    try {
      await Supabase.instance.client.from('transactions').update({
        'amount': amount,
        'note': note,
        'category_id': categoryId,
        'transaction_date': transactionDate.toIso8601String(),
      }).match({'id': id});

      return const Result.success(true);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<Transaction>> getById(int id) async {
    try {
      final result = await Supabase.instance.client
          .from('transactions')
          .select(
            'id, user_id, transaction_date, amount, note, category:category_id(id, name, code, type)',
          )
          .eq('id', id)
          .single();

      return Result.success(TransactionModel.fromJson(result).toEntity());
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
