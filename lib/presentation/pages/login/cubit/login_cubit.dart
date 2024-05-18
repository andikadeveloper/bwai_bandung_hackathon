import 'package:bwai_bandung_hackathon/domain/usecases/create_generative_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final CreateGenerativecontent createGenerativecontent;

  LoginCubit(
    this.createGenerativecontent,
  ) : super(const LoginState.initial());

  Future<void> generateContent(List<Content> content) async {
    emit(const LoginState.loading());

    final result = await createGenerativecontent(content);

    result.when(
      success: (value) {
        emit(LoginState.success(value));
      },
      failure: (message) {
        emit(LoginState.failure(message));
      },
    );
  }
}
