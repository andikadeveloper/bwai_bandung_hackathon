part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.success(UserResponse? user) = _Success;
  const factory UserState.failure(String message) = _Failure;
}
