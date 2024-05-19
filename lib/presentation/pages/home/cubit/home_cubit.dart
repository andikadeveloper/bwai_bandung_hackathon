import 'package:bwai_bandung_hackathon/domain/usecases/get_user.dart';
import 'package:bwai_bandung_hackathon/presentation/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetUserUseCase getUserUseCase;

  HomeCubit(
    this.getUserUseCase,
  ) : super(const HomeState.initial());

  void _toLogin(BuildContext context) {
    context.push(PathRoute.login);
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
