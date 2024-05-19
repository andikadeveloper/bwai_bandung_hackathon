import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/account_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<Result<int>> getAmount() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;

      if (userId == null) return const Result.failure('User not found');
      final result = await Supabase.instance.client
          .from('accounts')
          .select('amount')
          .eq('user_id', userId)
          .single();

      return Result.success(result['amount']);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<bool>> update({required int amount}) async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;

      if (userId == null) return const Result.failure('User not found');

      await Supabase.instance.client
          .from('accounts')
          .update({'amount': amount}).match({'user_id': userId});

      return const Result.success(true);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
