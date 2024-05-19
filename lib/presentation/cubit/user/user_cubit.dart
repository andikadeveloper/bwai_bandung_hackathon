import 'package:bwai_bandung_hackathon/domain/usecases/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final GetUserUseCase getUserUseCase;

  UserCubit(this.getUserUseCase) : super(const UserState.initial()) {
    getUser();
  }

  Future<void> getUser() async {
    var result = await getUserUseCase();

    result.when(
      success: (value) {
        emit(UserState.success(value));
      },
      failure: (message) {
        emit(UserState.failure(message));
      },
    );
  }
}
