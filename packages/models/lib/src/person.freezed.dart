// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AgeLegalFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() minor,
    required TResult Function() invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? minor,
    TResult? Function()? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? minor,
    TResult Function()? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Minor value) minor,
    required TResult Function(_Invalid value) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Invalid value)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Minor value)? minor,
    TResult Function(_Invalid value)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgeLegalFailureCopyWith<$Res> {
  factory $AgeLegalFailureCopyWith(
          AgeLegalFailure value, $Res Function(AgeLegalFailure) then) =
      _$AgeLegalFailureCopyWithImpl<$Res, AgeLegalFailure>;
}

/// @nodoc
class _$AgeLegalFailureCopyWithImpl<$Res, $Val extends AgeLegalFailure>
    implements $AgeLegalFailureCopyWith<$Res> {
  _$AgeLegalFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MinorCopyWith<$Res> {
  factory _$$_MinorCopyWith(_$_Minor value, $Res Function(_$_Minor) then) =
      __$$_MinorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MinorCopyWithImpl<$Res>
    extends _$AgeLegalFailureCopyWithImpl<$Res, _$_Minor>
    implements _$$_MinorCopyWith<$Res> {
  __$$_MinorCopyWithImpl(_$_Minor _value, $Res Function(_$_Minor) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Minor implements _Minor {
  const _$_Minor();

  @override
  String toString() {
    return 'AgeLegalFailure.minor()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Minor);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() minor,
    required TResult Function() invalid,
  }) {
    return minor();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? minor,
    TResult? Function()? invalid,
  }) {
    return minor?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? minor,
    TResult Function()? invalid,
    required TResult orElse(),
  }) {
    if (minor != null) {
      return minor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Minor value) minor,
    required TResult Function(_Invalid value) invalid,
  }) {
    return minor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Invalid value)? invalid,
  }) {
    return minor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Minor value)? minor,
    TResult Function(_Invalid value)? invalid,
    required TResult orElse(),
  }) {
    if (minor != null) {
      return minor(this);
    }
    return orElse();
  }
}

abstract class _Minor implements AgeLegalFailure {
  const factory _Minor() = _$_Minor;
}

/// @nodoc
abstract class _$$_InvalidCopyWith<$Res> {
  factory _$$_InvalidCopyWith(
          _$_Invalid value, $Res Function(_$_Invalid) then) =
      __$$_InvalidCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidCopyWithImpl<$Res>
    extends _$AgeLegalFailureCopyWithImpl<$Res, _$_Invalid>
    implements _$$_InvalidCopyWith<$Res> {
  __$$_InvalidCopyWithImpl(_$_Invalid _value, $Res Function(_$_Invalid) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Invalid implements _Invalid {
  const _$_Invalid();

  @override
  String toString() {
    return 'AgeLegalFailure.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Invalid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() minor,
    required TResult Function() invalid,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? minor,
    TResult? Function()? invalid,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? minor,
    TResult Function()? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Minor value) minor,
    required TResult Function(_Invalid value) invalid,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Minor value)? minor,
    TResult? Function(_Invalid value)? invalid,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Minor value)? minor,
    TResult Function(_Invalid value)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _Invalid implements AgeLegalFailure {
  const factory _Invalid() = _$_Invalid;
}
