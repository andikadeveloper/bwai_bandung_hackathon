import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/auth_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Result<AuthResponse>> signInWithIdToken({
    required OAuthProvider provider,
  }) async {
    try {  
      var webClientId = dotenv.env['WEB_CLIENT_ID'];
      var iosClientId = dotenv.env['IOS_CLIENT_ID'];

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      AuthResponse response = await Supabase.instance.client.auth.signInWithIdToken(
        provider: provider,
        idToken: idToken,
        accessToken: accessToken,
      );
      return Result.success(response);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<UserResponse>> getUser() async {
    try {  
      UserResponse response = await Supabase.instance.client.auth.getUser();
      return Result.success(response);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
