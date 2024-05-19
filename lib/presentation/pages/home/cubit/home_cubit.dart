import 'package:bwai_bandung_hackathon/domain/usecases/create_generative_content.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/get_user.dart';
import 'package:bwai_bandung_hackathon/presentation/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final CreateGenerativecontent createGenerativecontent;
  final GetUserUseCase getUserUseCase;

  HomeCubit(
    this.createGenerativecontent,
    this.getUserUseCase,
  ) : super(const HomeState.initial()) {
    _getUser();
  }

  Future<void> _getUser() async {
    final result = await getUserUseCase();
    result.when(
      success: (value) {
        emit(HomeState.successGetUserSession(value));
      },
      failure: (message) {},
    );
  }

  Future<void> generateContent(List<Content> content) async {
    emit(const HomeState.loading());

    final result = await createGenerativecontent(content);

    result.when(
      success: (value) {
        emit(HomeState.success(value));
      },
      failure: (message) {
        emit(HomeState.failure(message));
      },
    );
  }

  void _toLogin(BuildContext context) {
    context.push(PathRoute.login).then(
      (value) {
        emit(HomeState.successGetUserApi(value as AuthResponse?));
      },
    ).catchError((err) {});
  }

  Future<void> goToProfileOrLogin(BuildContext context) async {
    final result = await getUserUseCase();
    result.when(
      success: (value) {
        context.push(PathRoute.profile);
      },
      failure: (message) {
        _toLogin(context);
      },
    );
  }
}
