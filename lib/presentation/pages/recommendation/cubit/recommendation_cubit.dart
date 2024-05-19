import 'package:bwai_bandung_hackathon/domain/usecases/create_recommendation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

part 'recommendation_state.dart';
part 'recommendation_cubit.freezed.dart';

@injectable
class RecommendationCubit extends Cubit<RecommendationState> {
  final CreateRecommendation _createRecommendation;

  RecommendationCubit(this._createRecommendation)
      : super(const RecommendationState.initial());

  void getRecommendation() async {
    emit(const RecommendationState.loading());

    final result = await _createRecommendation();

    result.when(success: (content) {
      emit(RecommendationState.success(content));
    }, failure: (message) {
      emit(RecommendationState.failure(message));
    });
  }
}
