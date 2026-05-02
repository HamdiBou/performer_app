// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conference_shell_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConferenceShellConfig {

 String get conferenceId; String get primaryColorHex; String get logoUrl; List<ShellSection> get enabledSections; Map<String, dynamic> get metadata;
/// Create a copy of ConferenceShellConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConferenceShellConfigCopyWith<ConferenceShellConfig> get copyWith => _$ConferenceShellConfigCopyWithImpl<ConferenceShellConfig>(this as ConferenceShellConfig, _$identity);

  /// Serializes this ConferenceShellConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConferenceShellConfig&&(identical(other.conferenceId, conferenceId) || other.conferenceId == conferenceId)&&(identical(other.primaryColorHex, primaryColorHex) || other.primaryColorHex == primaryColorHex)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&const DeepCollectionEquality().equals(other.enabledSections, enabledSections)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conferenceId,primaryColorHex,logoUrl,const DeepCollectionEquality().hash(enabledSections),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ConferenceShellConfig(conferenceId: $conferenceId, primaryColorHex: $primaryColorHex, logoUrl: $logoUrl, enabledSections: $enabledSections, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ConferenceShellConfigCopyWith<$Res>  {
  factory $ConferenceShellConfigCopyWith(ConferenceShellConfig value, $Res Function(ConferenceShellConfig) _then) = _$ConferenceShellConfigCopyWithImpl;
@useResult
$Res call({
 String conferenceId, String primaryColorHex, String logoUrl, List<ShellSection> enabledSections, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$ConferenceShellConfigCopyWithImpl<$Res>
    implements $ConferenceShellConfigCopyWith<$Res> {
  _$ConferenceShellConfigCopyWithImpl(this._self, this._then);

  final ConferenceShellConfig _self;
  final $Res Function(ConferenceShellConfig) _then;

/// Create a copy of ConferenceShellConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conferenceId = null,Object? primaryColorHex = null,Object? logoUrl = null,Object? enabledSections = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
conferenceId: null == conferenceId ? _self.conferenceId : conferenceId // ignore: cast_nullable_to_non_nullable
as String,primaryColorHex: null == primaryColorHex ? _self.primaryColorHex : primaryColorHex // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,enabledSections: null == enabledSections ? _self.enabledSections : enabledSections // ignore: cast_nullable_to_non_nullable
as List<ShellSection>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConferenceShellConfig].
extension ConferenceShellConfigPatterns on ConferenceShellConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConferenceShellConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConferenceShellConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConferenceShellConfig value)  $default,){
final _that = this;
switch (_that) {
case _ConferenceShellConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConferenceShellConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ConferenceShellConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conferenceId,  String primaryColorHex,  String logoUrl,  List<ShellSection> enabledSections,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConferenceShellConfig() when $default != null:
return $default(_that.conferenceId,_that.primaryColorHex,_that.logoUrl,_that.enabledSections,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conferenceId,  String primaryColorHex,  String logoUrl,  List<ShellSection> enabledSections,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _ConferenceShellConfig():
return $default(_that.conferenceId,_that.primaryColorHex,_that.logoUrl,_that.enabledSections,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conferenceId,  String primaryColorHex,  String logoUrl,  List<ShellSection> enabledSections,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ConferenceShellConfig() when $default != null:
return $default(_that.conferenceId,_that.primaryColorHex,_that.logoUrl,_that.enabledSections,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConferenceShellConfig implements ConferenceShellConfig {
  const _ConferenceShellConfig({required this.conferenceId, required this.primaryColorHex, required this.logoUrl, required final  List<ShellSection> enabledSections, required final  Map<String, dynamic> metadata}): _enabledSections = enabledSections,_metadata = metadata;
  factory _ConferenceShellConfig.fromJson(Map<String, dynamic> json) => _$ConferenceShellConfigFromJson(json);

@override final  String conferenceId;
@override final  String primaryColorHex;
@override final  String logoUrl;
 final  List<ShellSection> _enabledSections;
@override List<ShellSection> get enabledSections {
  if (_enabledSections is EqualUnmodifiableListView) return _enabledSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enabledSections);
}

 final  Map<String, dynamic> _metadata;
@override Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ConferenceShellConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConferenceShellConfigCopyWith<_ConferenceShellConfig> get copyWith => __$ConferenceShellConfigCopyWithImpl<_ConferenceShellConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConferenceShellConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConferenceShellConfig&&(identical(other.conferenceId, conferenceId) || other.conferenceId == conferenceId)&&(identical(other.primaryColorHex, primaryColorHex) || other.primaryColorHex == primaryColorHex)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&const DeepCollectionEquality().equals(other._enabledSections, _enabledSections)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conferenceId,primaryColorHex,logoUrl,const DeepCollectionEquality().hash(_enabledSections),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ConferenceShellConfig(conferenceId: $conferenceId, primaryColorHex: $primaryColorHex, logoUrl: $logoUrl, enabledSections: $enabledSections, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ConferenceShellConfigCopyWith<$Res> implements $ConferenceShellConfigCopyWith<$Res> {
  factory _$ConferenceShellConfigCopyWith(_ConferenceShellConfig value, $Res Function(_ConferenceShellConfig) _then) = __$ConferenceShellConfigCopyWithImpl;
@override @useResult
$Res call({
 String conferenceId, String primaryColorHex, String logoUrl, List<ShellSection> enabledSections, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$ConferenceShellConfigCopyWithImpl<$Res>
    implements _$ConferenceShellConfigCopyWith<$Res> {
  __$ConferenceShellConfigCopyWithImpl(this._self, this._then);

  final _ConferenceShellConfig _self;
  final $Res Function(_ConferenceShellConfig) _then;

/// Create a copy of ConferenceShellConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conferenceId = null,Object? primaryColorHex = null,Object? logoUrl = null,Object? enabledSections = null,Object? metadata = null,}) {
  return _then(_ConferenceShellConfig(
conferenceId: null == conferenceId ? _self.conferenceId : conferenceId // ignore: cast_nullable_to_non_nullable
as String,primaryColorHex: null == primaryColorHex ? _self.primaryColorHex : primaryColorHex // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,enabledSections: null == enabledSections ? _self._enabledSections : enabledSections // ignore: cast_nullable_to_non_nullable
as List<ShellSection>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
