// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unauthenticated,
    required TResult Function(UserModel? user) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function(UserModel? user)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unauthenticated,
    TResult Function(UserModel? user)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_UnAuthenticatated<T> value) unauthenticated,
    required TResult Function(_Authenticated<T> value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult? Function(_Authenticated<T> value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult Function(_Authenticated<T> value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<T, $Res> {
  factory $AuthStateCopyWith(
          AuthState<T> value, $Res Function(AuthState<T>) then) =
      _$AuthStateCopyWithImpl<T, $Res, AuthState<T>>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<T, $Res, $Val extends AuthState<T>>
    implements $AuthStateCopyWith<T, $Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<T, $Res> {
  factory _$$_InitialCopyWith(
          _$_Initial<T> value, $Res Function(_$_Initial<T>) then) =
      __$$_InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$_Initial<T>>
    implements _$$_InitialCopyWith<T, $Res> {
  __$$_InitialCopyWithImpl(
      _$_Initial<T> _value, $Res Function(_$_Initial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial<T> implements _Initial<T> {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unauthenticated,
    required TResult Function(UserModel? user) authenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function(UserModel? user)? authenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unauthenticated,
    TResult Function(UserModel? user)? authenticated,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_UnAuthenticatated<T> value) unauthenticated,
    required TResult Function(_Authenticated<T> value) authenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult? Function(_Authenticated<T> value)? authenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult Function(_Authenticated<T> value)? authenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements AuthState<T> {
  const factory _Initial() = _$_Initial<T>;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<T, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<T> value, $Res Function(_$_Loading<T>) then) =
      __$$_LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$_Loading<T>>
    implements _$$_LoadingCopyWith<T, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<T> _value, $Res Function(_$_Loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading<T> implements _Loading<T> {
  const _$_Loading();

  @override
  String toString() {
    return 'AuthState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unauthenticated,
    required TResult Function(UserModel? user) authenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function(UserModel? user)? authenticated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unauthenticated,
    TResult Function(UserModel? user)? authenticated,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_UnAuthenticatated<T> value) unauthenticated,
    required TResult Function(_Authenticated<T> value) authenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult? Function(_Authenticated<T> value)? authenticated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult Function(_Authenticated<T> value)? authenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements AuthState<T> {
  const factory _Loading() = _$_Loading<T>;
}

/// @nodoc
abstract class _$$_UnAuthenticatatedCopyWith<T, $Res> {
  factory _$$_UnAuthenticatatedCopyWith(_$_UnAuthenticatated<T> value,
          $Res Function(_$_UnAuthenticatated<T>) then) =
      __$$_UnAuthenticatatedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_UnAuthenticatatedCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$_UnAuthenticatated<T>>
    implements _$$_UnAuthenticatatedCopyWith<T, $Res> {
  __$$_UnAuthenticatatedCopyWithImpl(_$_UnAuthenticatated<T> _value,
      $Res Function(_$_UnAuthenticatated<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_UnAuthenticatated<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UnAuthenticatated<T> implements _UnAuthenticatated<T> {
  const _$_UnAuthenticatated({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState<$T>.unauthenticated(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnAuthenticatated<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnAuthenticatatedCopyWith<T, _$_UnAuthenticatated<T>> get copyWith =>
      __$$_UnAuthenticatatedCopyWithImpl<T, _$_UnAuthenticatated<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unauthenticated,
    required TResult Function(UserModel? user) authenticated,
  }) {
    return unauthenticated(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function(UserModel? user)? authenticated,
  }) {
    return unauthenticated?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unauthenticated,
    TResult Function(UserModel? user)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_UnAuthenticatated<T> value) unauthenticated,
    required TResult Function(_Authenticated<T> value) authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult? Function(_Authenticated<T> value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult Function(_Authenticated<T> value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticatated<T> implements AuthState<T> {
  const factory _UnAuthenticatated({final String? message}) =
      _$_UnAuthenticatated<T>;

  String? get message;
  @JsonKey(ignore: true)
  _$$_UnAuthenticatatedCopyWith<T, _$_UnAuthenticatated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthenticatedCopyWith<T, $Res> {
  factory _$$_AuthenticatedCopyWith(
          _$_Authenticated<T> value, $Res Function(_$_Authenticated<T>) then) =
      __$$_AuthenticatedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({UserModel? user});
}

/// @nodoc
class __$$_AuthenticatedCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$_Authenticated<T>>
    implements _$$_AuthenticatedCopyWith<T, $Res> {
  __$$_AuthenticatedCopyWithImpl(
      _$_Authenticated<T> _value, $Res Function(_$_Authenticated<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_Authenticated<T>(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_Authenticated<T> implements _Authenticated<T> {
  const _$_Authenticated({required this.user});

  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthState<$T>.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Authenticated<T> &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedCopyWith<T, _$_Authenticated<T>> get copyWith =>
      __$$_AuthenticatedCopyWithImpl<T, _$_Authenticated<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unauthenticated,
    required TResult Function(UserModel? user) authenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function(UserModel? user)? authenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unauthenticated,
    TResult Function(UserModel? user)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_UnAuthenticatated<T> value) unauthenticated,
    required TResult Function(_Authenticated<T> value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult? Function(_Authenticated<T> value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_UnAuthenticatated<T> value)? unauthenticated,
    TResult Function(_Authenticated<T> value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated<T> implements AuthState<T> {
  const factory _Authenticated({required final UserModel? user}) =
      _$_Authenticated<T>;

  UserModel? get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedCopyWith<T, _$_Authenticated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
