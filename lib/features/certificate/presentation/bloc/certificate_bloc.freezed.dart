// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CertificateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateEvent()';
}


}

/// @nodoc
class $CertificateEventCopyWith<$Res>  {
$CertificateEventCopyWith(CertificateEvent _, $Res Function(CertificateEvent) __);
}


/// Adds pattern-matching-related methods to [CertificateEvent].
extension CertificateEventPatterns on CertificateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GenerateCertificate value)?  generate,TResult Function( SaveCertificate value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GenerateCertificate() when generate != null:
return generate(_that);case SaveCertificate() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GenerateCertificate value)  generate,required TResult Function( SaveCertificate value)  save,}){
final _that = this;
switch (_that) {
case GenerateCertificate():
return generate(_that);case SaveCertificate():
return save(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GenerateCertificate value)?  generate,TResult? Function( SaveCertificate value)?  save,}){
final _that = this;
switch (_that) {
case GenerateCertificate() when generate != null:
return generate(_that);case SaveCertificate() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  String userName,  String conferenceId,  String conferenceName)?  generate,TResult Function( String filePath)?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GenerateCertificate() when generate != null:
return generate(_that.userId,_that.userName,_that.conferenceId,_that.conferenceName);case SaveCertificate() when save != null:
return save(_that.filePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  String userName,  String conferenceId,  String conferenceName)  generate,required TResult Function( String filePath)  save,}) {final _that = this;
switch (_that) {
case GenerateCertificate():
return generate(_that.userId,_that.userName,_that.conferenceId,_that.conferenceName);case SaveCertificate():
return save(_that.filePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  String userName,  String conferenceId,  String conferenceName)?  generate,TResult? Function( String filePath)?  save,}) {final _that = this;
switch (_that) {
case GenerateCertificate() when generate != null:
return generate(_that.userId,_that.userName,_that.conferenceId,_that.conferenceName);case SaveCertificate() when save != null:
return save(_that.filePath);case _:
  return null;

}
}

}

/// @nodoc


class GenerateCertificate implements CertificateEvent {
  const GenerateCertificate({required this.userId, required this.userName, required this.conferenceId, required this.conferenceName});
  

 final  String userId;
 final  String userName;
 final  String conferenceId;
 final  String conferenceName;

/// Create a copy of CertificateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateCertificateCopyWith<GenerateCertificate> get copyWith => _$GenerateCertificateCopyWithImpl<GenerateCertificate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCertificate&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.conferenceId, conferenceId) || other.conferenceId == conferenceId)&&(identical(other.conferenceName, conferenceName) || other.conferenceName == conferenceName));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,conferenceId,conferenceName);

@override
String toString() {
  return 'CertificateEvent.generate(userId: $userId, userName: $userName, conferenceId: $conferenceId, conferenceName: $conferenceName)';
}


}

/// @nodoc
abstract mixin class $GenerateCertificateCopyWith<$Res> implements $CertificateEventCopyWith<$Res> {
  factory $GenerateCertificateCopyWith(GenerateCertificate value, $Res Function(GenerateCertificate) _then) = _$GenerateCertificateCopyWithImpl;
@useResult
$Res call({
 String userId, String userName, String conferenceId, String conferenceName
});




}
/// @nodoc
class _$GenerateCertificateCopyWithImpl<$Res>
    implements $GenerateCertificateCopyWith<$Res> {
  _$GenerateCertificateCopyWithImpl(this._self, this._then);

  final GenerateCertificate _self;
  final $Res Function(GenerateCertificate) _then;

/// Create a copy of CertificateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? conferenceId = null,Object? conferenceName = null,}) {
  return _then(GenerateCertificate(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,conferenceId: null == conferenceId ? _self.conferenceId : conferenceId // ignore: cast_nullable_to_non_nullable
as String,conferenceName: null == conferenceName ? _self.conferenceName : conferenceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SaveCertificate implements CertificateEvent {
  const SaveCertificate(this.filePath);
  

 final  String filePath;

/// Create a copy of CertificateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveCertificateCopyWith<SaveCertificate> get copyWith => _$SaveCertificateCopyWithImpl<SaveCertificate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveCertificate&&(identical(other.filePath, filePath) || other.filePath == filePath));
}


@override
int get hashCode => Object.hash(runtimeType,filePath);

@override
String toString() {
  return 'CertificateEvent.save(filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $SaveCertificateCopyWith<$Res> implements $CertificateEventCopyWith<$Res> {
  factory $SaveCertificateCopyWith(SaveCertificate value, $Res Function(SaveCertificate) _then) = _$SaveCertificateCopyWithImpl;
@useResult
$Res call({
 String filePath
});




}
/// @nodoc
class _$SaveCertificateCopyWithImpl<$Res>
    implements $SaveCertificateCopyWith<$Res> {
  _$SaveCertificateCopyWithImpl(this._self, this._then);

  final SaveCertificate _self;
  final $Res Function(SaveCertificate) _then;

/// Create a copy of CertificateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filePath = null,}) {
  return _then(SaveCertificate(
null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CertificateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateState()';
}


}

/// @nodoc
class $CertificateStateCopyWith<$Res>  {
$CertificateStateCopyWith(CertificateState _, $Res Function(CertificateState) __);
}


/// Adds pattern-matching-related methods to [CertificateState].
extension CertificateStatePatterns on CertificateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CertificateInitial value)?  initial,TResult Function( CertificateLoading value)?  loading,TResult Function( CertificateGenerated value)?  generated,TResult Function( CertificateSaved value)?  saved,TResult Function( CertificateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CertificateInitial() when initial != null:
return initial(_that);case CertificateLoading() when loading != null:
return loading(_that);case CertificateGenerated() when generated != null:
return generated(_that);case CertificateSaved() when saved != null:
return saved(_that);case CertificateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CertificateInitial value)  initial,required TResult Function( CertificateLoading value)  loading,required TResult Function( CertificateGenerated value)  generated,required TResult Function( CertificateSaved value)  saved,required TResult Function( CertificateError value)  error,}){
final _that = this;
switch (_that) {
case CertificateInitial():
return initial(_that);case CertificateLoading():
return loading(_that);case CertificateGenerated():
return generated(_that);case CertificateSaved():
return saved(_that);case CertificateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CertificateInitial value)?  initial,TResult? Function( CertificateLoading value)?  loading,TResult? Function( CertificateGenerated value)?  generated,TResult? Function( CertificateSaved value)?  saved,TResult? Function( CertificateError value)?  error,}){
final _that = this;
switch (_that) {
case CertificateInitial() when initial != null:
return initial(_that);case CertificateLoading() when loading != null:
return loading(_that);case CertificateGenerated() when generated != null:
return generated(_that);case CertificateSaved() when saved != null:
return saved(_that);case CertificateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Certificate certificate)?  generated,TResult Function()?  saved,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CertificateInitial() when initial != null:
return initial();case CertificateLoading() when loading != null:
return loading();case CertificateGenerated() when generated != null:
return generated(_that.certificate);case CertificateSaved() when saved != null:
return saved();case CertificateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Certificate certificate)  generated,required TResult Function()  saved,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CertificateInitial():
return initial();case CertificateLoading():
return loading();case CertificateGenerated():
return generated(_that.certificate);case CertificateSaved():
return saved();case CertificateError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Certificate certificate)?  generated,TResult? Function()?  saved,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CertificateInitial() when initial != null:
return initial();case CertificateLoading() when loading != null:
return loading();case CertificateGenerated() when generated != null:
return generated(_that.certificate);case CertificateSaved() when saved != null:
return saved();case CertificateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CertificateInitial implements CertificateState {
  const CertificateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateState.initial()';
}


}




/// @nodoc


class CertificateLoading implements CertificateState {
  const CertificateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateState.loading()';
}


}




/// @nodoc


class CertificateGenerated implements CertificateState {
  const CertificateGenerated(this.certificate);
  

 final  Certificate certificate;

/// Create a copy of CertificateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateGeneratedCopyWith<CertificateGenerated> get copyWith => _$CertificateGeneratedCopyWithImpl<CertificateGenerated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateGenerated&&(identical(other.certificate, certificate) || other.certificate == certificate));
}


@override
int get hashCode => Object.hash(runtimeType,certificate);

@override
String toString() {
  return 'CertificateState.generated(certificate: $certificate)';
}


}

/// @nodoc
abstract mixin class $CertificateGeneratedCopyWith<$Res> implements $CertificateStateCopyWith<$Res> {
  factory $CertificateGeneratedCopyWith(CertificateGenerated value, $Res Function(CertificateGenerated) _then) = _$CertificateGeneratedCopyWithImpl;
@useResult
$Res call({
 Certificate certificate
});


$CertificateCopyWith<$Res> get certificate;

}
/// @nodoc
class _$CertificateGeneratedCopyWithImpl<$Res>
    implements $CertificateGeneratedCopyWith<$Res> {
  _$CertificateGeneratedCopyWithImpl(this._self, this._then);

  final CertificateGenerated _self;
  final $Res Function(CertificateGenerated) _then;

/// Create a copy of CertificateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? certificate = null,}) {
  return _then(CertificateGenerated(
null == certificate ? _self.certificate : certificate // ignore: cast_nullable_to_non_nullable
as Certificate,
  ));
}

/// Create a copy of CertificateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CertificateCopyWith<$Res> get certificate {
  
  return $CertificateCopyWith<$Res>(_self.certificate, (value) {
    return _then(_self.copyWith(certificate: value));
  });
}
}

/// @nodoc


class CertificateSaved implements CertificateState {
  const CertificateSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificateState.saved()';
}


}




/// @nodoc


class CertificateError implements CertificateState {
  const CertificateError(this.message);
  

 final  String message;

/// Create a copy of CertificateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateErrorCopyWith<CertificateError> get copyWith => _$CertificateErrorCopyWithImpl<CertificateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CertificateState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CertificateErrorCopyWith<$Res> implements $CertificateStateCopyWith<$Res> {
  factory $CertificateErrorCopyWith(CertificateError value, $Res Function(CertificateError) _then) = _$CertificateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CertificateErrorCopyWithImpl<$Res>
    implements $CertificateErrorCopyWith<$Res> {
  _$CertificateErrorCopyWithImpl(this._self, this._then);

  final CertificateError _self;
  final $Res Function(CertificateError) _then;

/// Create a copy of CertificateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CertificateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
