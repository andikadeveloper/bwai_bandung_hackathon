import 'package:bwai_bandung_hackathon/domain/usecases/create_generative_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final CreateGenerativecontent createGenerativecontent;

  HomeCubit(
    this.createGenerativecontent,
  ) : super(const HomeState.initial());

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
}
