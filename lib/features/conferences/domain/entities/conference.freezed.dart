// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Conference {

 String get id; String get name;@JsonKey(name: 'logo_url') String get logoUrl; String get location; String? get description;@JsonKey(name: 'website_url') String? get websiteUrl;@JsonKey(name: 'performer_url') String? get performerUrl; String get state; String? get date; String? get time;@JsonKey(name: 'is_demo') bool get isDemo; List<Session>? get sessions; List<Speaker>? get speakers; List<Sponsor>? get sponsors;
/// Create a copy of Conference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConferenceCopyWith<Conference> get copyWith => _$ConferenceCopyWithImpl<Conference>(this as Conference, _$identity);

  /// Serializes this Conference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conference&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.performerUrl, performerUrl) || other.performerUrl == performerUrl)&&(identical(other.state, state) || other.state == state)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.isDemo, isDemo) || other.isDemo == isDemo)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&const DeepCollectionEquality().equals(other.sponsors, sponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,location,description,websiteUrl,performerUrl,state,date,time,isDemo,const DeepCollectionEquality().hash(sessions),const DeepCollectionEquality().hash(speakers),const DeepCollectionEquality().hash(sponsors));

@override
String toString() {
  return 'Conference(id: $id, name: $name, logoUrl: $logoUrl, location: $location, description: $description, websiteUrl: $websiteUrl, performerUrl: $performerUrl, state: $state, date: $date, time: $time, isDemo: $isDemo, sessions: $sessions, speakers: $speakers, sponsors: $sponsors)';
}


}

/// @nodoc
abstract mixin class $ConferenceCopyWith<$Res>  {
  factory $ConferenceCopyWith(Conference value, $Res Function(Conference) _then) = _$ConferenceCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'logo_url') String logoUrl, String location, String? description,@JsonKey(name: 'website_url') String? websiteUrl,@JsonKey(name: 'performer_url') String? performerUrl, String state, String? date, String? time,@JsonKey(name: 'is_demo') bool isDemo, List<Session>? sessions, List<Speaker>? speakers, List<Sponsor>? sponsors
});




}
/// @nodoc
class _$ConferenceCopyWithImpl<$Res>
    implements $ConferenceCopyWith<$Res> {
  _$ConferenceCopyWithImpl(this._self, this._then);

  final Conference _self;
  final $Res Function(Conference) _then;

/// Create a copy of Conference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? location = null,Object? description = freezed,Object? websiteUrl = freezed,Object? performerUrl = freezed,Object? state = null,Object? date = freezed,Object? time = freezed,Object? isDemo = null,Object? sessions = freezed,Object? speakers = freezed,Object? sponsors = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,performerUrl: freezed == performerUrl ? _self.performerUrl : performerUrl // ignore: cast_nullable_to_non_nullable
as String?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,isDemo: null == isDemo ? _self.isDemo : isDemo // ignore: cast_nullable_to_non_nullable
as bool,sessions: freezed == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>?,speakers: freezed == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>?,sponsors: freezed == sponsors ? _self.sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Conference].
extension ConferencePatterns on Conference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conference value)  $default,){
final _that = this;
switch (_that) {
case _Conference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conference value)?  $default,){
final _that = this;
switch (_that) {
case _Conference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'logo_url')  String logoUrl,  String location,  String? description, @JsonKey(name: 'website_url')  String? websiteUrl, @JsonKey(name: 'performer_url')  String? performerUrl,  String state,  String? date,  String? time, @JsonKey(name: 'is_demo')  bool isDemo,  List<Session>? sessions,  List<Speaker>? speakers,  List<Sponsor>? sponsors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conference() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.location,_that.description,_that.websiteUrl,_that.performerUrl,_that.state,_that.date,_that.time,_that.isDemo,_that.sessions,_that.speakers,_that.sponsors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'logo_url')  String logoUrl,  String location,  String? description, @JsonKey(name: 'website_url')  String? websiteUrl, @JsonKey(name: 'performer_url')  String? performerUrl,  String state,  String? date,  String? time, @JsonKey(name: 'is_demo')  bool isDemo,  List<Session>? sessions,  List<Speaker>? speakers,  List<Sponsor>? sponsors)  $default,) {final _that = this;
switch (_that) {
case _Conference():
return $default(_that.id,_that.name,_that.logoUrl,_that.location,_that.description,_that.websiteUrl,_that.performerUrl,_that.state,_that.date,_that.time,_that.isDemo,_that.sessions,_that.speakers,_that.sponsors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'logo_url')  String logoUrl,  String location,  String? description, @JsonKey(name: 'website_url')  String? websiteUrl, @JsonKey(name: 'performer_url')  String? performerUrl,  String state,  String? date,  String? time, @JsonKey(name: 'is_demo')  bool isDemo,  List<Session>? sessions,  List<Speaker>? speakers,  List<Sponsor>? sponsors)?  $default,) {final _that = this;
switch (_that) {
case _Conference() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.location,_that.description,_that.websiteUrl,_that.performerUrl,_that.state,_that.date,_that.time,_that.isDemo,_that.sessions,_that.speakers,_that.sponsors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conference extends Conference {
  const _Conference({required this.id, required this.name, @JsonKey(name: 'logo_url') required this.logoUrl, required this.location, this.description, @JsonKey(name: 'website_url') this.websiteUrl, @JsonKey(name: 'performer_url') this.performerUrl, this.state = 'Ongoing', this.date, this.time, @JsonKey(name: 'is_demo') this.isDemo = false, final  List<Session>? sessions, final  List<Speaker>? speakers, final  List<Sponsor>? sponsors}): _sessions = sessions,_speakers = speakers,_sponsors = sponsors,super._();
  factory _Conference.fromJson(Map<String, dynamic> json) => _$ConferenceFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'logo_url') final  String logoUrl;
@override final  String location;
@override final  String? description;
@override@JsonKey(name: 'website_url') final  String? websiteUrl;
@override@JsonKey(name: 'performer_url') final  String? performerUrl;
@override@JsonKey() final  String state;
@override final  String? date;
@override final  String? time;
@override@JsonKey(name: 'is_demo') final  bool isDemo;
 final  List<Session>? _sessions;
@override List<Session>? get sessions {
  final value = _sessions;
  if (value == null) return null;
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Speaker>? _speakers;
@override List<Speaker>? get speakers {
  final value = _speakers;
  if (value == null) return null;
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Sponsor>? _sponsors;
@override List<Sponsor>? get sponsors {
  final value = _sponsors;
  if (value == null) return null;
  if (_sponsors is EqualUnmodifiableListView) return _sponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Conference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConferenceCopyWith<_Conference> get copyWith => __$ConferenceCopyWithImpl<_Conference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conference&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.performerUrl, performerUrl) || other.performerUrl == performerUrl)&&(identical(other.state, state) || other.state == state)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.isDemo, isDemo) || other.isDemo == isDemo)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&const DeepCollectionEquality().equals(other._sponsors, _sponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,location,description,websiteUrl,performerUrl,state,date,time,isDemo,const DeepCollectionEquality().hash(_sessions),const DeepCollectionEquality().hash(_speakers),const DeepCollectionEquality().hash(_sponsors));

@override
String toString() {
  return 'Conference(id: $id, name: $name, logoUrl: $logoUrl, location: $location, description: $description, websiteUrl: $websiteUrl, performerUrl: $performerUrl, state: $state, date: $date, time: $time, isDemo: $isDemo, sessions: $sessions, speakers: $speakers, sponsors: $sponsors)';
}


}

/// @nodoc
abstract mixin class _$ConferenceCopyWith<$Res> implements $ConferenceCopyWith<$Res> {
  factory _$ConferenceCopyWith(_Conference value, $Res Function(_Conference) _then) = __$ConferenceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'logo_url') String logoUrl, String location, String? description,@JsonKey(name: 'website_url') String? websiteUrl,@JsonKey(name: 'performer_url') String? performerUrl, String state, String? date, String? time,@JsonKey(name: 'is_demo') bool isDemo, List<Session>? sessions, List<Speaker>? speakers, List<Sponsor>? sponsors
});




}
/// @nodoc
class __$ConferenceCopyWithImpl<$Res>
    implements _$ConferenceCopyWith<$Res> {
  __$ConferenceCopyWithImpl(this._self, this._then);

  final _Conference _self;
  final $Res Function(_Conference) _then;

/// Create a copy of Conference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? location = null,Object? description = freezed,Object? websiteUrl = freezed,Object? performerUrl = freezed,Object? state = null,Object? date = freezed,Object? time = freezed,Object? isDemo = null,Object? sessions = freezed,Object? speakers = freezed,Object? sponsors = freezed,}) {
  return _then(_Conference(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,performerUrl: freezed == performerUrl ? _self.performerUrl : performerUrl // ignore: cast_nullable_to_non_nullable
as String?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,isDemo: null == isDemo ? _self.isDemo : isDemo // ignore: cast_nullable_to_non_nullable
as bool,sessions: freezed == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>?,speakers: freezed == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>?,sponsors: freezed == sponsors ? _self._sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>?,
  ));
}


}

// dart format on
