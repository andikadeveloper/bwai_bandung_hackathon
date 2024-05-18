// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GenerateContentResponse value) success,
    required TResult Function(String message) failure,
    required TResult Function(AuthResponse? user) successGetUserApi,
    required TResult Function(UserResponse? user) successGetUserSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GenerateContentResponse value)? success,
    TResult? Function(String message)? failure,
    TResult? Function(AuthResponse? user)? successGetUserApi,
    TResult? Function(UserResponse? user)? successGetUserSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GenerateContentResponse value)? success,
    TResult Function(String message)? failure,
    TResult Function(AuthResponse? user)? successGetUserApi,
    TResult Function(UserResponse? user)? successGetUserSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessGetUserApi value) successGetUserApi,
    required TResult Function(_SuccessGetUserSession value)
        successGetUserSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult? Function(_SuccessGetUserSession value)? successGetUserSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult Function(_SuccessGetUserSession value)? successGetUserSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GenerateContentResponse value) success,
    required TResult Function(String message) failure,
    required TResult Function(AuthResponse? user) successGetUserApi,
    required TResult Function(UserResponse? user) successGetUserSession,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GenerateContentResponse value)? success,
    TResult? Function(String message)? failure,
    TResult? Function(AuthResponse? user)? successGetUserApi,
    TResult? Function(UserResponse? user)? successGetUserSession,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GenerateContentResponse value)? success,
    TResult Function(String message)? failure,
    TResult Function(AuthResponse? user)? successGetUserApi,
    TResult Function(UserResponse? user)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessGetUserApi value) successGetUserApi,
    required TResult Function(_SuccessGetUserSession value)
        successGetUserSession,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult? Function(_SuccessGetUserSession value)? successGetUserSession,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult Function(_SuccessGetUserSession value)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GenerateContentResponse value) success,
    required TResult Function(String message) failure,
    required TResult Function(AuthResponse? user) successGetUserApi,
    required TResult Function(UserResponse? user) successGetUserSession,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GenerateContentResponse value)? success,
    TResult? Function(String message)? failure,
    TResult? Function(AuthResponse? user)? successGetUserApi,
    TResult? Function(UserResponse? user)? successGetUserSession,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GenerateContentResponse value)? success,
    TResult Function(String message)? failure,
    TResult Function(AuthResponse? user)? successGetUserApi,
    TResult Function(UserResponse? user)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessGetUserApi value) successGetUserApi,
    required TResult Function(_SuccessGetUserSession value)
        successGetUserSession,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult? Function(_SuccessGetUserSession value)? successGetUserSession,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult Function(_SuccessGetUserSession value)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GenerateContentResponse value});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SuccessImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as GenerateContentResponse,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.value);

  @override
  final GenerateContentResponse value;

  @override
  String toString() {
    return 'HomeState.success(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GenerateContentResponse value) success,
    required TResult Function(String message) failure,
    required TResult Function(AuthResponse? user) successGetUserApi,
    required TResult Function(UserResponse? user) successGetUserSession,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GenerateContentResponse value)? success,
    TResult? Function(String message)? failure,
    TResult? Function(AuthResponse? user)? successGetUserApi,
    TResult? Function(UserResponse? user)? successGetUserSession,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GenerateContentResponse value)? success,
    TResult Function(String message)? failure,
    TResult Function(AuthResponse? user)? successGetUserApi,
    TResult Function(UserResponse? user)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessGetUserApi value) successGetUserApi,
    required TResult Function(_SuccessGetUserSession value)
        successGetUserSession,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult? Function(_SuccessGetUserSession value)? successGetUserSession,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult Function(_SuccessGetUserSession value)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements HomeState {
  const factory _Success(final GenerateContentResponse value) = _$SuccessImpl;

  GenerateContentResponse get value;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GenerateContentResponse value) success,
    required TResult Function(String message) failure,
    required TResult Function(AuthResponse? user) successGetUserApi,
    required TResult Function(UserResponse? user) successGetUserSession,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GenerateContentResponse value)? success,
    TResult? Function(String message)? failure,
    TResult? Function(AuthResponse? user)? successGetUserApi,
    TResult? Function(UserResponse? user)? successGetUserSession,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GenerateContentResponse value)? success,
    TResult Function(String message)? failure,
    TResult Function(AuthResponse? user)? successGetUserApi,
    TResult Function(UserResponse? user)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessGetUserApi value) successGetUserApi,
    required TResult Function(_SuccessGetUserSession value)
        successGetUserSession,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult? Function(_SuccessGetUserSession value)? successGetUserSession,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult Function(_SuccessGetUserSession value)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements HomeState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetUserApiImplCopyWith<$Res> {
  factory _$$SuccessGetUserApiImplCopyWith(_$SuccessGetUserApiImpl value,
          $Res Function(_$SuccessGetUserApiImpl) then) =
      __$$SuccessGetUserApiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthResponse? user});
}

/// @nodoc
class __$$SuccessGetUserApiImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessGetUserApiImpl>
    implements _$$SuccessGetUserApiImplCopyWith<$Res> {
  __$$SuccessGetUserApiImplCopyWithImpl(_$SuccessGetUserApiImpl _value,
      $Res Function(_$SuccessGetUserApiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$SuccessGetUserApiImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthResponse?,
    ));
  }
}

/// @nodoc

class _$SuccessGetUserApiImpl implements _SuccessGetUserApi {
  const _$SuccessGetUserApiImpl(this.user);

  @override
  final AuthResponse? user;

  @override
  String toString() {
    return 'HomeState.successGetUserApi(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetUserApiImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetUserApiImplCopyWith<_$SuccessGetUserApiImpl> get copyWith =>
      __$$SuccessGetUserApiImplCopyWithImpl<_$SuccessGetUserApiImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GenerateContentResponse value) success,
    required TResult Function(String message) failure,
    required TResult Function(AuthResponse? user) successGetUserApi,
    required TResult Function(UserResponse? user) successGetUserSession,
  }) {
    return successGetUserApi(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GenerateContentResponse value)? success,
    TResult? Function(String message)? failure,
    TResult? Function(AuthResponse? user)? successGetUserApi,
    TResult? Function(UserResponse? user)? successGetUserSession,
  }) {
    return successGetUserApi?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GenerateContentResponse value)? success,
    TResult Function(String message)? failure,
    TResult Function(AuthResponse? user)? successGetUserApi,
    TResult Function(UserResponse? user)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (successGetUserApi != null) {
      return successGetUserApi(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessGetUserApi value) successGetUserApi,
    required TResult Function(_SuccessGetUserSession value)
        successGetUserSession,
  }) {
    return successGetUserApi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult? Function(_SuccessGetUserSession value)? successGetUserSession,
  }) {
    return successGetUserApi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult Function(_SuccessGetUserSession value)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (successGetUserApi != null) {
      return successGetUserApi(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetUserApi implements HomeState {
  const factory _SuccessGetUserApi(final AuthResponse? user) =
      _$SuccessGetUserApiImpl;

  AuthResponse? get user;
  @JsonKey(ignore: true)
  _$$SuccessGetUserApiImplCopyWith<_$SuccessGetUserApiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetUserSessionImplCopyWith<$Res> {
  factory _$$SuccessGetUserSessionImplCopyWith(
          _$SuccessGetUserSessionImpl value,
          $Res Function(_$SuccessGetUserSessionImpl) then) =
      __$$SuccessGetUserSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserResponse? user});
}

/// @nodoc
class __$$SuccessGetUserSessionImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessGetUserSessionImpl>
    implements _$$SuccessGetUserSessionImplCopyWith<$Res> {
  __$$SuccessGetUserSessionImplCopyWithImpl(_$SuccessGetUserSessionImpl _value,
      $Res Function(_$SuccessGetUserSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$SuccessGetUserSessionImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }
}

/// @nodoc

class _$SuccessGetUserSessionImpl implements _SuccessGetUserSession {
  const _$SuccessGetUserSessionImpl(this.user);

  @override
  final UserResponse? user;

  @override
  String toString() {
    return 'HomeState.successGetUserSession(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetUserSessionImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetUserSessionImplCopyWith<_$SuccessGetUserSessionImpl>
      get copyWith => __$$SuccessGetUserSessionImplCopyWithImpl<
          _$SuccessGetUserSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GenerateContentResponse value) success,
    required TResult Function(String message) failure,
    required TResult Function(AuthResponse? user) successGetUserApi,
    required TResult Function(UserResponse? user) successGetUserSession,
  }) {
    return successGetUserSession(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GenerateContentResponse value)? success,
    TResult? Function(String message)? failure,
    TResult? Function(AuthResponse? user)? successGetUserApi,
    TResult? Function(UserResponse? user)? successGetUserSession,
  }) {
    return successGetUserSession?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GenerateContentResponse value)? success,
    TResult Function(String message)? failure,
    TResult Function(AuthResponse? user)? successGetUserApi,
    TResult Function(UserResponse? user)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (successGetUserSession != null) {
      return successGetUserSession(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessGetUserApi value) successGetUserApi,
    required TResult Function(_SuccessGetUserSession value)
        successGetUserSession,
  }) {
    return successGetUserSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult? Function(_SuccessGetUserSession value)? successGetUserSession,
  }) {
    return successGetUserSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessGetUserApi value)? successGetUserApi,
    TResult Function(_SuccessGetUserSession value)? successGetUserSession,
    required TResult orElse(),
  }) {
    if (successGetUserSession != null) {
      return successGetUserSession(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetUserSession implements HomeState {
  const factory _SuccessGetUserSession(final UserResponse? user) =
      _$SuccessGetUserSessionImpl;

  UserResponse? get user;
  @JsonKey(ignore: true)
  _$$SuccessGetUserSessionImplCopyWith<_$SuccessGetUserSessionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
