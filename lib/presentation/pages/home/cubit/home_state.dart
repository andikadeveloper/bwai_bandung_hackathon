part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(GenerateContentResponse value) = _Success;
  const factory HomeState.failure(String message) = _Failure;
}
