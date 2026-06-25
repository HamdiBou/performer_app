// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_assistant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiAssistantEvent {

 String get prompt;
/// Create a copy of AiAssistantEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAssistantEventCopyWith<AiAssistantEvent> get copyWith => _$AiAssistantEventCopyWithImpl<AiAssistantEvent>(this as AiAssistantEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAssistantEvent&&(identical(other.prompt, prompt) || other.prompt == prompt));
}


@override
int get hashCode => Object.hash(runtimeType,prompt);

@override
String toString() {
  return 'AiAssistantEvent(prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class $AiAssistantEventCopyWith<$Res>  {
  factory $AiAssistantEventCopyWith(AiAssistantEvent value, $Res Function(AiAssistantEvent) _then) = _$AiAssistantEventCopyWithImpl;
@useResult
$Res call({
 String prompt
});




}
/// @nodoc
class _$AiAssistantEventCopyWithImpl<$Res>
    implements $AiAssistantEventCopyWith<$Res> {
  _$AiAssistantEventCopyWithImpl(this._self, this._then);

  final AiAssistantEvent _self;
  final $Res Function(AiAssistantEvent) _then;

/// Create a copy of AiAssistantEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prompt = null,}) {
  return _then(_self.copyWith(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiAssistantEvent].
extension AiAssistantEventPatterns on AiAssistantEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendMessage value)?  sendMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendMessage value)  sendMessage,}){
final _that = this;
switch (_that) {
case SendMessage():
return sendMessage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendMessage value)?  sendMessage,}){
final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String prompt)?  sendMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that.prompt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String prompt)  sendMessage,}) {final _that = this;
switch (_that) {
case SendMessage():
return sendMessage(_that.prompt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String prompt)?  sendMessage,}) {final _that = this;
switch (_that) {
case SendMessage() when sendMessage != null:
return sendMessage(_that.prompt);case _:
  return null;

}
}

}

/// @nodoc


class SendMessage implements AiAssistantEvent {
  const SendMessage({required this.prompt});
  

@override final  String prompt;

/// Create a copy of AiAssistantEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageCopyWith<SendMessage> get copyWith => _$SendMessageCopyWithImpl<SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessage&&(identical(other.prompt, prompt) || other.prompt == prompt));
}


@override
int get hashCode => Object.hash(runtimeType,prompt);

@override
String toString() {
  return 'AiAssistantEvent.sendMessage(prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $AiAssistantEventCopyWith<$Res> {
  factory $SendMessageCopyWith(SendMessage value, $Res Function(SendMessage) _then) = _$SendMessageCopyWithImpl;
@override @useResult
$Res call({
 String prompt
});




}
/// @nodoc
class _$SendMessageCopyWithImpl<$Res>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(this._self, this._then);

  final SendMessage _self;
  final $Res Function(SendMessage) _then;

/// Create a copy of AiAssistantEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prompt = null,}) {
  return _then(SendMessage(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AiAssistantState {

 List<AssistantMessage> get messages;
/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAssistantStateCopyWith<AiAssistantState> get copyWith => _$AiAssistantStateCopyWithImpl<AiAssistantState>(this as AiAssistantState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAssistantState&&const DeepCollectionEquality().equals(other.messages, messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'AiAssistantState(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $AiAssistantStateCopyWith<$Res>  {
  factory $AiAssistantStateCopyWith(AiAssistantState value, $Res Function(AiAssistantState) _then) = _$AiAssistantStateCopyWithImpl;
@useResult
$Res call({
 List<AssistantMessage> messages
});




}
/// @nodoc
class _$AiAssistantStateCopyWithImpl<$Res>
    implements $AiAssistantStateCopyWith<$Res> {
  _$AiAssistantStateCopyWithImpl(this._self, this._then);

  final AiAssistantState _self;
  final $Res Function(AiAssistantState) _then;

/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<AssistantMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiAssistantState].
extension AiAssistantStatePatterns on AiAssistantState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AiAssistantInitial value)?  initial,TResult Function( AiAssistantLoading value)?  loading,TResult Function( AiAssistantSuccess value)?  success,TResult Function( AiAssistantError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AiAssistantInitial() when initial != null:
return initial(_that);case AiAssistantLoading() when loading != null:
return loading(_that);case AiAssistantSuccess() when success != null:
return success(_that);case AiAssistantError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AiAssistantInitial value)  initial,required TResult Function( AiAssistantLoading value)  loading,required TResult Function( AiAssistantSuccess value)  success,required TResult Function( AiAssistantError value)  error,}){
final _that = this;
switch (_that) {
case AiAssistantInitial():
return initial(_that);case AiAssistantLoading():
return loading(_that);case AiAssistantSuccess():
return success(_that);case AiAssistantError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AiAssistantInitial value)?  initial,TResult? Function( AiAssistantLoading value)?  loading,TResult? Function( AiAssistantSuccess value)?  success,TResult? Function( AiAssistantError value)?  error,}){
final _that = this;
switch (_that) {
case AiAssistantInitial() when initial != null:
return initial(_that);case AiAssistantLoading() when loading != null:
return loading(_that);case AiAssistantSuccess() when success != null:
return success(_that);case AiAssistantError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<AssistantMessage> messages)?  initial,TResult Function( List<AssistantMessage> messages)?  loading,TResult Function( List<AssistantMessage> messages)?  success,TResult Function( List<AssistantMessage> messages,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AiAssistantInitial() when initial != null:
return initial(_that.messages);case AiAssistantLoading() when loading != null:
return loading(_that.messages);case AiAssistantSuccess() when success != null:
return success(_that.messages);case AiAssistantError() when error != null:
return error(_that.messages,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<AssistantMessage> messages)  initial,required TResult Function( List<AssistantMessage> messages)  loading,required TResult Function( List<AssistantMessage> messages)  success,required TResult Function( List<AssistantMessage> messages,  String message)  error,}) {final _that = this;
switch (_that) {
case AiAssistantInitial():
return initial(_that.messages);case AiAssistantLoading():
return loading(_that.messages);case AiAssistantSuccess():
return success(_that.messages);case AiAssistantError():
return error(_that.messages,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<AssistantMessage> messages)?  initial,TResult? Function( List<AssistantMessage> messages)?  loading,TResult? Function( List<AssistantMessage> messages)?  success,TResult? Function( List<AssistantMessage> messages,  String message)?  error,}) {final _that = this;
switch (_that) {
case AiAssistantInitial() when initial != null:
return initial(_that.messages);case AiAssistantLoading() when loading != null:
return loading(_that.messages);case AiAssistantSuccess() when success != null:
return success(_that.messages);case AiAssistantError() when error != null:
return error(_that.messages,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AiAssistantInitial implements AiAssistantState {
  const AiAssistantInitial({final  List<AssistantMessage> messages = const []}): _messages = messages;
  

 final  List<AssistantMessage> _messages;
@override@JsonKey() List<AssistantMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAssistantInitialCopyWith<AiAssistantInitial> get copyWith => _$AiAssistantInitialCopyWithImpl<AiAssistantInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAssistantInitial&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'AiAssistantState.initial(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $AiAssistantInitialCopyWith<$Res> implements $AiAssistantStateCopyWith<$Res> {
  factory $AiAssistantInitialCopyWith(AiAssistantInitial value, $Res Function(AiAssistantInitial) _then) = _$AiAssistantInitialCopyWithImpl;
@override @useResult
$Res call({
 List<AssistantMessage> messages
});




}
/// @nodoc
class _$AiAssistantInitialCopyWithImpl<$Res>
    implements $AiAssistantInitialCopyWith<$Res> {
  _$AiAssistantInitialCopyWithImpl(this._self, this._then);

  final AiAssistantInitial _self;
  final $Res Function(AiAssistantInitial) _then;

/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(AiAssistantInitial(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<AssistantMessage>,
  ));
}


}

/// @nodoc


class AiAssistantLoading implements AiAssistantState {
  const AiAssistantLoading({required final  List<AssistantMessage> messages}): _messages = messages;
  

 final  List<AssistantMessage> _messages;
@override List<AssistantMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAssistantLoadingCopyWith<AiAssistantLoading> get copyWith => _$AiAssistantLoadingCopyWithImpl<AiAssistantLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAssistantLoading&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'AiAssistantState.loading(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $AiAssistantLoadingCopyWith<$Res> implements $AiAssistantStateCopyWith<$Res> {
  factory $AiAssistantLoadingCopyWith(AiAssistantLoading value, $Res Function(AiAssistantLoading) _then) = _$AiAssistantLoadingCopyWithImpl;
@override @useResult
$Res call({
 List<AssistantMessage> messages
});




}
/// @nodoc
class _$AiAssistantLoadingCopyWithImpl<$Res>
    implements $AiAssistantLoadingCopyWith<$Res> {
  _$AiAssistantLoadingCopyWithImpl(this._self, this._then);

  final AiAssistantLoading _self;
  final $Res Function(AiAssistantLoading) _then;

/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(AiAssistantLoading(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<AssistantMessage>,
  ));
}


}

/// @nodoc


class AiAssistantSuccess implements AiAssistantState {
  const AiAssistantSuccess({required final  List<AssistantMessage> messages}): _messages = messages;
  

 final  List<AssistantMessage> _messages;
@override List<AssistantMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAssistantSuccessCopyWith<AiAssistantSuccess> get copyWith => _$AiAssistantSuccessCopyWithImpl<AiAssistantSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAssistantSuccess&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'AiAssistantState.success(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $AiAssistantSuccessCopyWith<$Res> implements $AiAssistantStateCopyWith<$Res> {
  factory $AiAssistantSuccessCopyWith(AiAssistantSuccess value, $Res Function(AiAssistantSuccess) _then) = _$AiAssistantSuccessCopyWithImpl;
@override @useResult
$Res call({
 List<AssistantMessage> messages
});




}
/// @nodoc
class _$AiAssistantSuccessCopyWithImpl<$Res>
    implements $AiAssistantSuccessCopyWith<$Res> {
  _$AiAssistantSuccessCopyWithImpl(this._self, this._then);

  final AiAssistantSuccess _self;
  final $Res Function(AiAssistantSuccess) _then;

/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(AiAssistantSuccess(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<AssistantMessage>,
  ));
}


}

/// @nodoc


class AiAssistantError implements AiAssistantState {
  const AiAssistantError({required final  List<AssistantMessage> messages, required this.message}): _messages = messages;
  

 final  List<AssistantMessage> _messages;
@override List<AssistantMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  String message;

/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAssistantErrorCopyWith<AiAssistantError> get copyWith => _$AiAssistantErrorCopyWithImpl<AiAssistantError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAssistantError&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),message);

@override
String toString() {
  return 'AiAssistantState.error(messages: $messages, message: $message)';
}


}

/// @nodoc
abstract mixin class $AiAssistantErrorCopyWith<$Res> implements $AiAssistantStateCopyWith<$Res> {
  factory $AiAssistantErrorCopyWith(AiAssistantError value, $Res Function(AiAssistantError) _then) = _$AiAssistantErrorCopyWithImpl;
@override @useResult
$Res call({
 List<AssistantMessage> messages, String message
});




}
/// @nodoc
class _$AiAssistantErrorCopyWithImpl<$Res>
    implements $AiAssistantErrorCopyWith<$Res> {
  _$AiAssistantErrorCopyWithImpl(this._self, this._then);

  final AiAssistantError _self;
  final $Res Function(AiAssistantError) _then;

/// Create a copy of AiAssistantState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? message = null,}) {
  return _then(AiAssistantError(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<AssistantMessage>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
