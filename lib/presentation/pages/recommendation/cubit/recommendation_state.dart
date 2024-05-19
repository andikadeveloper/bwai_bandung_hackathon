part of 'recommendation_cubit.dart';

@freezed
class RecommendationState with _$RecommendationState {
  const factory RecommendationState.initial() = _Initial;
  const factory RecommendationState.loading() = _Loading;
  const factory RecommendationState.success(GenerateContentResponse content) =
      _Success;
  const factory RecommendationState.failure(String message) = _Failure;
}
