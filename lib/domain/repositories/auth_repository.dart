import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<Result<AuthResponse>> signInWithIdToken({
    required OAuthProvider provider,
  });
  Future<Result<UserResponse>> getUser();
}
