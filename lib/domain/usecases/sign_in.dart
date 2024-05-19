import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Result<AuthResponse>> call({
    required OAuthProvider provider,
  }) async {
    return await repository.signInWithIdToken(provider: provider);
  }
}
