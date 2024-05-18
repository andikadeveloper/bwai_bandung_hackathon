import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result {
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(String message) = Failure;
}
