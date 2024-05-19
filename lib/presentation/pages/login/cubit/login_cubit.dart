import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final SignInUseCase signInUseCase;

  LoginCubit(
    this.signInUseCase,
  ) : super(const LoginState.initial());

  Future<void> loginWithGoogle(BuildContext context) async {
    emit(const LoginState.loading());

    Result<AuthResponse> result =
        await signInUseCase(provider: OAuthProvider.google);

    result.when(
      success: (value) {
        emit(LoginState.success(value));
        context.pop(value);
      },
      failure: (message) {
        emit(LoginState.failure(message));
      },
    );
  }
}
