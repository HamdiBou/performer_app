// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conference_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConferenceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConferenceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConferenceEvent()';
}


}

/// @nodoc
class $ConferenceEventCopyWith<$Res>  {
$ConferenceEventCopyWith(ConferenceEvent _, $Res Function(ConferenceEvent) __);
}


/// Adds pattern-matching-related methods to [ConferenceEvent].
extension ConferenceEventPatterns on ConferenceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadConferences value)?  loadConferences,TResult Function( SelectConference value)?  selectConference,TResult Function( LoadSelectedConference value)?  loadSelectedConference,TResult Function( ClearSelectedConference value)?  clearSelectedConference,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadConferences() when loadConferences != null:
return loadConferences(_that);case SelectConference() when selectConference != null:
return selectConference(_that);case LoadSelectedConference() when loadSelectedConference != null:
return loadSelectedConference(_that);case ClearSelectedConference() when clearSelectedConference != null:
return clearSelectedConference(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadConferences value)  loadConferences,required TResult Function( SelectConference value)  selectConference,required TResult Function( LoadSelectedConference value)  loadSelectedConference,required TResult Function( ClearSelectedConference value)  clearSelectedConference,}){
final _that = this;
switch (_that) {
case LoadConferences():
return loadConferences(_that);case SelectConference():
return selectConference(_that);case LoadSelectedConference():
return loadSelectedConference(_that);case ClearSelectedConference():
return clearSelectedConference(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadConferences value)?  loadConferences,TResult? Function( SelectConference value)?  selectConference,TResult? Function( LoadSelectedConference value)?  loadSelectedConference,TResult? Function( ClearSelectedConference value)?  clearSelectedConference,}){
final _that = this;
switch (_that) {
case LoadConferences() when loadConferences != null:
return loadConferences(_that);case SelectConference() when selectConference != null:
return selectConference(_that);case LoadSelectedConference() when loadSelectedConference != null:
return loadSelectedConference(_that);case ClearSelectedConference() when clearSelectedConference != null:
return clearSelectedConference(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadConferences,TResult Function( Conference conference)?  selectConference,TResult Function()?  loadSelectedConference,TResult Function()?  clearSelectedConference,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadConferences() when loadConferences != null:
return loadConferences();case SelectConference() when selectConference != null:
return selectConference(_that.conference);case LoadSelectedConference() when loadSelectedConference != null:
return loadSelectedConference();case ClearSelectedConference() when clearSelectedConference != null:
return clearSelectedConference();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadConferences,required TResult Function( Conference conference)  selectConference,required TResult Function()  loadSelectedConference,required TResult Function()  clearSelectedConference,}) {final _that = this;
switch (_that) {
case LoadConferences():
return loadConferences();case SelectConference():
return selectConference(_that.conference);case LoadSelectedConference():
return loadSelectedConference();case ClearSelectedConference():
return clearSelectedConference();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadConferences,TResult? Function( Conference conference)?  selectConference,TResult? Function()?  loadSelectedConference,TResult? Function()?  clearSelectedConference,}) {final _that = this;
switch (_that) {
case LoadConferences() when loadConferences != null:
return loadConferences();case SelectConference() when selectConference != null:
return selectConference(_that.conference);case LoadSelectedConference() when loadSelectedConference != null:
return loadSelectedConference();case ClearSelectedConference() when clearSelectedConference != null:
return clearSelectedConference();case _:
  return null;

}
}

}

/// @nodoc


class LoadConferences implements ConferenceEvent {
  const LoadConferences();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadConferences);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConferenceEvent.loadConferences()';
}


}




/// @nodoc


class SelectConference implements ConferenceEvent {
  const SelectConference(this.conference);
  

 final  Conference conference;

/// Create a copy of ConferenceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectConferenceCopyWith<SelectConference> get copyWith => _$SelectConferenceCopyWithImpl<SelectConference>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectConference&&(identical(other.conference, conference) || other.conference == conference));
}


@override
int get hashCode => Object.hash(runtimeType,conference);

@override
String toString() {
  return 'ConferenceEvent.selectConference(conference: $conference)';
}


}

/// @nodoc
abstract mixin class $SelectConferenceCopyWith<$Res> implements $ConferenceEventCopyWith<$Res> {
  factory $SelectConferenceCopyWith(SelectConference value, $Res Function(SelectConference) _then) = _$SelectConferenceCopyWithImpl;
@useResult
$Res call({
 Conference conference
});


$ConferenceCopyWith<$Res> get conference;

}
/// @nodoc
class _$SelectConferenceCopyWithImpl<$Res>
    implements $SelectConferenceCopyWith<$Res> {
  _$SelectConferenceCopyWithImpl(this._self, this._then);

  final SelectConference _self;
  final $Res Function(SelectConference) _then;

/// Create a copy of ConferenceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conference = null,}) {
  return _then(SelectConference(
null == conference ? _self.conference : conference // ignore: cast_nullable_to_non_nullable
as Conference,
  ));
}

/// Create a copy of ConferenceEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConferenceCopyWith<$Res> get conference {
  
  return $ConferenceCopyWith<$Res>(_self.conference, (value) {
    return _then(_self.copyWith(conference: value));
  });
}
}

/// @nodoc


class LoadSelectedConference implements ConferenceEvent {
  const LoadSelectedConference();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSelectedConference);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConferenceEvent.loadSelectedConference()';
}


}




/// @nodoc


class ClearSelectedConference implements ConferenceEvent {
  const ClearSelectedConference();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelectedConference);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConferenceEvent.clearSelectedConference()';
}


}




/// @nodoc
mixin _$ConferenceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConferenceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConferenceState()';
}


}

/// @nodoc
class $ConferenceStateCopyWith<$Res>  {
$ConferenceStateCopyWith(ConferenceState _, $Res Function(ConferenceState) __);
}


/// Adds pattern-matching-related methods to [ConferenceState].
extension ConferenceStatePatterns on ConferenceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConferenceInitial value)?  initial,TResult Function( ConferenceLoading value)?  loading,TResult Function( ConferenceLoaded value)?  loaded,TResult Function( ConferenceError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConferenceInitial() when initial != null:
return initial(_that);case ConferenceLoading() when loading != null:
return loading(_that);case ConferenceLoaded() when loaded != null:
return loaded(_that);case ConferenceError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConferenceInitial value)  initial,required TResult Function( ConferenceLoading value)  loading,required TResult Function( ConferenceLoaded value)  loaded,required TResult Function( ConferenceError value)  error,}){
final _that = this;
switch (_that) {
case ConferenceInitial():
return initial(_that);case ConferenceLoading():
return loading(_that);case ConferenceLoaded():
return loaded(_that);case ConferenceError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConferenceInitial value)?  initial,TResult? Function( ConferenceLoading value)?  loading,TResult? Function( ConferenceLoaded value)?  loaded,TResult? Function( ConferenceError value)?  error,}){
final _that = this;
switch (_that) {
case ConferenceInitial() when initial != null:
return initial(_that);case ConferenceLoading() when loading != null:
return loading(_that);case ConferenceLoaded() when loaded != null:
return loaded(_that);case ConferenceError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Conference> conferences,  Conference? selected)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConferenceInitial() when initial != null:
return initial();case ConferenceLoading() when loading != null:
return loading();case ConferenceLoaded() when loaded != null:
return loaded(_that.conferences,_that.selected);case ConferenceError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Conference> conferences,  Conference? selected)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ConferenceInitial():
return initial();case ConferenceLoading():
return loading();case ConferenceLoaded():
return loaded(_that.conferences,_that.selected);case ConferenceError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Conference> conferences,  Conference? selected)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ConferenceInitial() when initial != null:
return initial();case ConferenceLoading() when loading != null:
return loading();case ConferenceLoaded() when loaded != null:
return loaded(_that.conferences,_that.selected);case ConferenceError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ConferenceInitial implements ConferenceState {
  const ConferenceInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConferenceInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConferenceState.initial()';
}


}




/// @nodoc


class ConferenceLoading implements ConferenceState {
  const ConferenceLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConferenceLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConferenceState.loading()';
}


}




/// @nodoc


class ConferenceLoaded implements ConferenceState {
  const ConferenceLoaded(final  List<Conference> conferences, this.selected): _conferences = conferences;
  

 final  List<Conference> _conferences;
 List<Conference> get conferences {
  if (_conferences is EqualUnmodifiableListView) return _conferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conferences);
}

 final  Conference? selected;

/// Create a copy of ConferenceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConferenceLoadedCopyWith<ConferenceLoaded> get copyWith => _$ConferenceLoadedCopyWithImpl<ConferenceLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConferenceLoaded&&const DeepCollectionEquality().equals(other._conferences, _conferences)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conferences),selected);

@override
String toString() {
  return 'ConferenceState.loaded(conferences: $conferences, selected: $selected)';
}


}

/// @nodoc
abstract mixin class $ConferenceLoadedCopyWith<$Res> implements $ConferenceStateCopyWith<$Res> {
  factory $ConferenceLoadedCopyWith(ConferenceLoaded value, $Res Function(ConferenceLoaded) _then) = _$ConferenceLoadedCopyWithImpl;
@useResult
$Res call({
 List<Conference> conferences, Conference? selected
});


$ConferenceCopyWith<$Res>? get selected;

}
/// @nodoc
class _$ConferenceLoadedCopyWithImpl<$Res>
    implements $ConferenceLoadedCopyWith<$Res> {
  _$ConferenceLoadedCopyWithImpl(this._self, this._then);

  final ConferenceLoaded _self;
  final $Res Function(ConferenceLoaded) _then;

/// Create a copy of ConferenceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conferences = null,Object? selected = freezed,}) {
  return _then(ConferenceLoaded(
null == conferences ? _self._conferences : conferences // ignore: cast_nullable_to_non_nullable
as List<Conference>,freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as Conference?,
  ));
}

/// Create a copy of ConferenceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConferenceCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $ConferenceCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

/// @nodoc


class ConferenceError implements ConferenceState {
  const ConferenceError(this.message);
  

 final  String message;

/// Create a copy of ConferenceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConferenceErrorCopyWith<ConferenceError> get copyWith => _$ConferenceErrorCopyWithImpl<ConferenceError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConferenceError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConferenceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConferenceErrorCopyWith<$Res> implements $ConferenceStateCopyWith<$Res> {
  factory $ConferenceErrorCopyWith(ConferenceError value, $Res Function(ConferenceError) _then) = _$ConferenceErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConferenceErrorCopyWithImpl<$Res>
    implements $ConferenceErrorCopyWith<$Res> {
  _$ConferenceErrorCopyWithImpl(this._self, this._then);

  final ConferenceError _self;
  final $Res Function(ConferenceError) _then;

/// Create a copy of ConferenceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConferenceError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
