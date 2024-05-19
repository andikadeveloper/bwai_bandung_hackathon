import 'package:bwai_bandung_hackathon/domain/usecases/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserUseCase getUserUseCase;

  ProfileCubit(
    this.getUserUseCase,
  ) : super(const ProfileState.initial()) {
    _getUser();
  }

  Future<void> _getUser() async {
    emit(const ProfileState.loading());
    final result = await getUserUseCase();

    result.when(
      success: (value) {
        emit(ProfileState.success(value));
      },
      failure: (message) {
      },
    );
  }
}
