import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/get_user.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/sign_in.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/account/account_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/transaction/transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/user/user_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetUserUseCase getUserUseCase;
  final SignInUseCase signInUseCase;

  HomeCubit(
    this.getUserUseCase,
    this.signInUseCase,
  ) : super(const HomeState.initial());

  void _toLogin(BuildContext context) async {
    Result<AuthResponse> result = await signInUseCase(
      provider: OAuthProvider.google,
    );
    result.when(
      success: (value) {
        context.read<TransactionCubit>().getAll();
        context.read<UserCubit>().getUser();
        context.read<AccountCubit>().getAccount();
      },
      failure: (message) {},
    );
  }

  Future<void> goToProfileOrLogin(BuildContext context) async {
    final result = await getUserUseCase();
    result.when(
      success: (value) {},
      failure: (message) {
        _toLogin(context);
      },
    );
  }

  Future<void> goToRecommendationOrLogin(BuildContext context) async {
    final result = await getUserUseCase();
    result.when(
      success: (value) {
        context.push(PathRoute.recommendation);
      },
      failure: (message) {
        _toLogin(context);
      },
    );
  }

  void login(BuildContext context) {
    _toLogin(context);
  }
}
