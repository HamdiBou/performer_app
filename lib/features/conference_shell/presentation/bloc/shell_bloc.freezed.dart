// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shell_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShellEvent {

 String get conferenceId;
/// Create a copy of ShellEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShellEventCopyWith<ShellEvent> get copyWith => _$ShellEventCopyWithImpl<ShellEvent>(this as ShellEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellEvent&&(identical(other.conferenceId, conferenceId) || other.conferenceId == conferenceId));
}


@override
int get hashCode => Object.hash(runtimeType,conferenceId);

@override
String toString() {
  return 'ShellEvent(conferenceId: $conferenceId)';
}


}

/// @nodoc
abstract mixin class $ShellEventCopyWith<$Res>  {
  factory $ShellEventCopyWith(ShellEvent value, $Res Function(ShellEvent) _then) = _$ShellEventCopyWithImpl;
@useResult
$Res call({
 String conferenceId
});




}
/// @nodoc
class _$ShellEventCopyWithImpl<$Res>
    implements $ShellEventCopyWith<$Res> {
  _$ShellEventCopyWithImpl(this._self, this._then);

  final ShellEvent _self;
  final $Res Function(ShellEvent) _then;

/// Create a copy of ShellEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conferenceId = null,}) {
  return _then(_self.copyWith(
conferenceId: null == conferenceId ? _self.conferenceId : conferenceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShellEvent].
extension ShellEventPatterns on ShellEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadConfig value)?  loadConfig,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadConfig() when loadConfig != null:
return loadConfig(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadConfig value)  loadConfig,}){
final _that = this;
switch (_that) {
case LoadConfig():
return loadConfig(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadConfig value)?  loadConfig,}){
final _that = this;
switch (_that) {
case LoadConfig() when loadConfig != null:
return loadConfig(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String conferenceId)?  loadConfig,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadConfig() when loadConfig != null:
return loadConfig(_that.conferenceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String conferenceId)  loadConfig,}) {final _that = this;
switch (_that) {
case LoadConfig():
return loadConfig(_that.conferenceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String conferenceId)?  loadConfig,}) {final _that = this;
switch (_that) {
case LoadConfig() when loadConfig != null:
return loadConfig(_that.conferenceId);case _:
  return null;

}
}

}

/// @nodoc


class LoadConfig implements ShellEvent {
  const LoadConfig(this.conferenceId);
  

@override final  String conferenceId;

/// Create a copy of ShellEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadConfigCopyWith<LoadConfig> get copyWith => _$LoadConfigCopyWithImpl<LoadConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadConfig&&(identical(other.conferenceId, conferenceId) || other.conferenceId == conferenceId));
}


@override
int get hashCode => Object.hash(runtimeType,conferenceId);

@override
String toString() {
  return 'ShellEvent.loadConfig(conferenceId: $conferenceId)';
}


}

/// @nodoc
abstract mixin class $LoadConfigCopyWith<$Res> implements $ShellEventCopyWith<$Res> {
  factory $LoadConfigCopyWith(LoadConfig value, $Res Function(LoadConfig) _then) = _$LoadConfigCopyWithImpl;
@override @useResult
$Res call({
 String conferenceId
});




}
/// @nodoc
class _$LoadConfigCopyWithImpl<$Res>
    implements $LoadConfigCopyWith<$Res> {
  _$LoadConfigCopyWithImpl(this._self, this._then);

  final LoadConfig _self;
  final $Res Function(LoadConfig) _then;

/// Create a copy of ShellEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conferenceId = null,}) {
  return _then(LoadConfig(
null == conferenceId ? _self.conferenceId : conferenceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ShellState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShellState()';
}


}

/// @nodoc
class $ShellStateCopyWith<$Res>  {
$ShellStateCopyWith(ShellState _, $Res Function(ShellState) __);
}


/// Adds pattern-matching-related methods to [ShellState].
extension ShellStatePatterns on ShellState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShellInitial value)?  initial,TResult Function( ShellLoading value)?  loading,TResult Function( ShellLoaded value)?  loaded,TResult Function( ShellError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShellInitial() when initial != null:
return initial(_that);case ShellLoading() when loading != null:
return loading(_that);case ShellLoaded() when loaded != null:
return loaded(_that);case ShellError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShellInitial value)  initial,required TResult Function( ShellLoading value)  loading,required TResult Function( ShellLoaded value)  loaded,required TResult Function( ShellError value)  error,}){
final _that = this;
switch (_that) {
case ShellInitial():
return initial(_that);case ShellLoading():
return loading(_that);case ShellLoaded():
return loaded(_that);case ShellError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShellInitial value)?  initial,TResult? Function( ShellLoading value)?  loading,TResult? Function( ShellLoaded value)?  loaded,TResult? Function( ShellError value)?  error,}){
final _that = this;
switch (_that) {
case ShellInitial() when initial != null:
return initial(_that);case ShellLoading() when loading != null:
return loading(_that);case ShellLoaded() when loaded != null:
return loaded(_that);case ShellError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ConferenceShellConfig config)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShellInitial() when initial != null:
return initial();case ShellLoading() when loading != null:
return loading();case ShellLoaded() when loaded != null:
return loaded(_that.config);case ShellError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ConferenceShellConfig config)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ShellInitial():
return initial();case ShellLoading():
return loading();case ShellLoaded():
return loaded(_that.config);case ShellError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ConferenceShellConfig config)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ShellInitial() when initial != null:
return initial();case ShellLoading() when loading != null:
return loading();case ShellLoaded() when loaded != null:
return loaded(_that.config);case ShellError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ShellInitial implements ShellState {
  const ShellInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShellState.initial()';
}


}




/// @nodoc


class ShellLoading implements ShellState {
  const ShellLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShellState.loading()';
}


}




/// @nodoc


class ShellLoaded implements ShellState {
  const ShellLoaded(this.config);
  

 final  ConferenceShellConfig config;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShellLoadedCopyWith<ShellLoaded> get copyWith => _$ShellLoadedCopyWithImpl<ShellLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellLoaded&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ShellState.loaded(config: $config)';
}


}

/// @nodoc
abstract mixin class $ShellLoadedCopyWith<$Res> implements $ShellStateCopyWith<$Res> {
  factory $ShellLoadedCopyWith(ShellLoaded value, $Res Function(ShellLoaded) _then) = _$ShellLoadedCopyWithImpl;
@useResult
$Res call({
 ConferenceShellConfig config
});


$ConferenceShellConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$ShellLoadedCopyWithImpl<$Res>
    implements $ShellLoadedCopyWith<$Res> {
  _$ShellLoadedCopyWithImpl(this._self, this._then);

  final ShellLoaded _self;
  final $Res Function(ShellLoaded) _then;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(ShellLoaded(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ConferenceShellConfig,
  ));
}

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConferenceShellConfigCopyWith<$Res> get config {
  
  return $ConferenceShellConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class ShellError implements ShellState {
  const ShellError(this.message);
  

 final  String message;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShellErrorCopyWith<ShellError> get copyWith => _$ShellErrorCopyWithImpl<ShellError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ShellState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShellErrorCopyWith<$Res> implements $ShellStateCopyWith<$Res> {
  factory $ShellErrorCopyWith(ShellError value, $Res Function(ShellError) _then) = _$ShellErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ShellErrorCopyWithImpl<$Res>
    implements $ShellErrorCopyWith<$Res> {
  _$ShellErrorCopyWithImpl(this._self, this._then);

  final ShellError _self;
  final $Res Function(ShellError) _then;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShellError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
