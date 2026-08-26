// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enter_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnterCodeState {

 LoadStatus get nextButtonLoadStatus; LoadStatus get resendOtpLoadStatus; String get code; bool get isEnableNextButton; bool get isEnableResendButton; String? get errorMessage;
/// Create a copy of EnterCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnterCodeStateCopyWith<EnterCodeState> get copyWith => _$EnterCodeStateCopyWithImpl<EnterCodeState>(this as EnterCodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnterCodeState&&(identical(other.nextButtonLoadStatus, nextButtonLoadStatus) || other.nextButtonLoadStatus == nextButtonLoadStatus)&&(identical(other.resendOtpLoadStatus, resendOtpLoadStatus) || other.resendOtpLoadStatus == resendOtpLoadStatus)&&(identical(other.code, code) || other.code == code)&&(identical(other.isEnableNextButton, isEnableNextButton) || other.isEnableNextButton == isEnableNextButton)&&(identical(other.isEnableResendButton, isEnableResendButton) || other.isEnableResendButton == isEnableResendButton)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,nextButtonLoadStatus,resendOtpLoadStatus,code,isEnableNextButton,isEnableResendButton,errorMessage);

@override
String toString() {
  return 'EnterCodeState(nextButtonLoadStatus: $nextButtonLoadStatus, resendOtpLoadStatus: $resendOtpLoadStatus, code: $code, isEnableNextButton: $isEnableNextButton, isEnableResendButton: $isEnableResendButton, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EnterCodeStateCopyWith<$Res>  {
  factory $EnterCodeStateCopyWith(EnterCodeState value, $Res Function(EnterCodeState) _then) = _$EnterCodeStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus nextButtonLoadStatus, LoadStatus resendOtpLoadStatus, String code, bool isEnableNextButton, bool isEnableResendButton, String? errorMessage
});




}
/// @nodoc
class _$EnterCodeStateCopyWithImpl<$Res>
    implements $EnterCodeStateCopyWith<$Res> {
  _$EnterCodeStateCopyWithImpl(this._self, this._then);

  final EnterCodeState _self;
  final $Res Function(EnterCodeState) _then;

/// Create a copy of EnterCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextButtonLoadStatus = null,Object? resendOtpLoadStatus = null,Object? code = null,Object? isEnableNextButton = null,Object? isEnableResendButton = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
nextButtonLoadStatus: null == nextButtonLoadStatus ? _self.nextButtonLoadStatus : nextButtonLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,resendOtpLoadStatus: null == resendOtpLoadStatus ? _self.resendOtpLoadStatus : resendOtpLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isEnableNextButton: null == isEnableNextButton ? _self.isEnableNextButton : isEnableNextButton // ignore: cast_nullable_to_non_nullable
as bool,isEnableResendButton: null == isEnableResendButton ? _self.isEnableResendButton : isEnableResendButton // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EnterCodeState].
extension EnterCodeStatePatterns on EnterCodeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnterCodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnterCodeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnterCodeState value)  $default,){
final _that = this;
switch (_that) {
case _EnterCodeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnterCodeState value)?  $default,){
final _that = this;
switch (_that) {
case _EnterCodeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus nextButtonLoadStatus,  LoadStatus resendOtpLoadStatus,  String code,  bool isEnableNextButton,  bool isEnableResendButton,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnterCodeState() when $default != null:
return $default(_that.nextButtonLoadStatus,_that.resendOtpLoadStatus,_that.code,_that.isEnableNextButton,_that.isEnableResendButton,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus nextButtonLoadStatus,  LoadStatus resendOtpLoadStatus,  String code,  bool isEnableNextButton,  bool isEnableResendButton,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EnterCodeState():
return $default(_that.nextButtonLoadStatus,_that.resendOtpLoadStatus,_that.code,_that.isEnableNextButton,_that.isEnableResendButton,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus nextButtonLoadStatus,  LoadStatus resendOtpLoadStatus,  String code,  bool isEnableNextButton,  bool isEnableResendButton,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EnterCodeState() when $default != null:
return $default(_that.nextButtonLoadStatus,_that.resendOtpLoadStatus,_that.code,_that.isEnableNextButton,_that.isEnableResendButton,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EnterCodeState implements EnterCodeState {
  const _EnterCodeState({this.nextButtonLoadStatus = LoadStatus.initial, this.resendOtpLoadStatus = LoadStatus.initial, this.code = '', this.isEnableNextButton = false, this.isEnableResendButton = true, this.errorMessage});
  

@override@JsonKey() final  LoadStatus nextButtonLoadStatus;
@override@JsonKey() final  LoadStatus resendOtpLoadStatus;
@override@JsonKey() final  String code;
@override@JsonKey() final  bool isEnableNextButton;
@override@JsonKey() final  bool isEnableResendButton;
@override final  String? errorMessage;

/// Create a copy of EnterCodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnterCodeStateCopyWith<_EnterCodeState> get copyWith => __$EnterCodeStateCopyWithImpl<_EnterCodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnterCodeState&&(identical(other.nextButtonLoadStatus, nextButtonLoadStatus) || other.nextButtonLoadStatus == nextButtonLoadStatus)&&(identical(other.resendOtpLoadStatus, resendOtpLoadStatus) || other.resendOtpLoadStatus == resendOtpLoadStatus)&&(identical(other.code, code) || other.code == code)&&(identical(other.isEnableNextButton, isEnableNextButton) || other.isEnableNextButton == isEnableNextButton)&&(identical(other.isEnableResendButton, isEnableResendButton) || other.isEnableResendButton == isEnableResendButton)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,nextButtonLoadStatus,resendOtpLoadStatus,code,isEnableNextButton,isEnableResendButton,errorMessage);

@override
String toString() {
  return 'EnterCodeState(nextButtonLoadStatus: $nextButtonLoadStatus, resendOtpLoadStatus: $resendOtpLoadStatus, code: $code, isEnableNextButton: $isEnableNextButton, isEnableResendButton: $isEnableResendButton, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EnterCodeStateCopyWith<$Res> implements $EnterCodeStateCopyWith<$Res> {
  factory _$EnterCodeStateCopyWith(_EnterCodeState value, $Res Function(_EnterCodeState) _then) = __$EnterCodeStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus nextButtonLoadStatus, LoadStatus resendOtpLoadStatus, String code, bool isEnableNextButton, bool isEnableResendButton, String? errorMessage
});




}
/// @nodoc
class __$EnterCodeStateCopyWithImpl<$Res>
    implements _$EnterCodeStateCopyWith<$Res> {
  __$EnterCodeStateCopyWithImpl(this._self, this._then);

  final _EnterCodeState _self;
  final $Res Function(_EnterCodeState) _then;

/// Create a copy of EnterCodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextButtonLoadStatus = null,Object? resendOtpLoadStatus = null,Object? code = null,Object? isEnableNextButton = null,Object? isEnableResendButton = null,Object? errorMessage = freezed,}) {
  return _then(_EnterCodeState(
nextButtonLoadStatus: null == nextButtonLoadStatus ? _self.nextButtonLoadStatus : nextButtonLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,resendOtpLoadStatus: null == resendOtpLoadStatus ? _self.resendOtpLoadStatus : resendOtpLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isEnableNextButton: null == isEnableNextButton ? _self.isEnableNextButton : isEnableNextButton // ignore: cast_nullable_to_non_nullable
as bool,isEnableResendButton: null == isEnableResendButton ? _self.isEnableResendButton : isEnableResendButton // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
