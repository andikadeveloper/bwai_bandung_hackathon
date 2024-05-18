import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class GetUserUseCase {
  final AuthRepository repository;

  GetUserUseCase(this.repository);

  Future<Result<UserResponse>> call() async {
    return await repository.getUser();
  }
}
