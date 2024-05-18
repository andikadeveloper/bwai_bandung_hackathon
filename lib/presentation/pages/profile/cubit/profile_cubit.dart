import 'package:bwai_bandung_hackathon/domain/usecases/create_generative_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final CreateGenerativecontent createGenerativecontent;

  ProfileCubit(
    this.createGenerativecontent,
  ) : super(const ProfileState.initial());

  Future<void> generateContent(List<Content> content) async {
    emit(const ProfileState.loading());

    final result = await createGenerativecontent(content);

    result.when(
      success: (value) {
        emit(ProfileState.success(value));
      },
      failure: (message) {
        emit(ProfileState.failure(message));
      },
    );
  }
}
