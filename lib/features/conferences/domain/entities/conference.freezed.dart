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

 String get id; String get name;@JsonKey(name: 'logo_url') String get logoUrl; String get location; DateTime get startDate; DateTime get endDate; String? get description;@JsonKey(name: 'is_demo') bool get isDemo;
/// Create a copy of Conference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConferenceCopyWith<Conference> get copyWith => _$ConferenceCopyWithImpl<Conference>(this as Conference, _$identity);

  /// Serializes this Conference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conference&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDemo, isDemo) || other.isDemo == isDemo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,location,startDate,endDate,description,isDemo);

@override
String toString() {
  return 'Conference(id: $id, name: $name, logoUrl: $logoUrl, location: $location, startDate: $startDate, endDate: $endDate, description: $description, isDemo: $isDemo)';
}


}

/// @nodoc
abstract mixin class $ConferenceCopyWith<$Res>  {
  factory $ConferenceCopyWith(Conference value, $Res Function(Conference) _then) = _$ConferenceCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'logo_url') String logoUrl, String location, DateTime startDate, DateTime endDate, String? description,@JsonKey(name: 'is_demo') bool isDemo
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? location = null,Object? startDate = null,Object? endDate = null,Object? description = freezed,Object? isDemo = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isDemo: null == isDemo ? _self.isDemo : isDemo // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'logo_url')  String logoUrl,  String location,  DateTime startDate,  DateTime endDate,  String? description, @JsonKey(name: 'is_demo')  bool isDemo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conference() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.location,_that.startDate,_that.endDate,_that.description,_that.isDemo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'logo_url')  String logoUrl,  String location,  DateTime startDate,  DateTime endDate,  String? description, @JsonKey(name: 'is_demo')  bool isDemo)  $default,) {final _that = this;
switch (_that) {
case _Conference():
return $default(_that.id,_that.name,_that.logoUrl,_that.location,_that.startDate,_that.endDate,_that.description,_that.isDemo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'logo_url')  String logoUrl,  String location,  DateTime startDate,  DateTime endDate,  String? description, @JsonKey(name: 'is_demo')  bool isDemo)?  $default,) {final _that = this;
switch (_that) {
case _Conference() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.location,_that.startDate,_that.endDate,_that.description,_that.isDemo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conference implements Conference {
  const _Conference({required this.id, required this.name, @JsonKey(name: 'logo_url') required this.logoUrl, required this.location, required this.startDate, required this.endDate, this.description, @JsonKey(name: 'is_demo') this.isDemo = false});
  factory _Conference.fromJson(Map<String, dynamic> json) => _$ConferenceFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'logo_url') final  String logoUrl;
@override final  String location;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String? description;
@override@JsonKey(name: 'is_demo') final  bool isDemo;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conference&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDemo, isDemo) || other.isDemo == isDemo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,location,startDate,endDate,description,isDemo);

@override
String toString() {
  return 'Conference(id: $id, name: $name, logoUrl: $logoUrl, location: $location, startDate: $startDate, endDate: $endDate, description: $description, isDemo: $isDemo)';
}


}

/// @nodoc
abstract mixin class _$ConferenceCopyWith<$Res> implements $ConferenceCopyWith<$Res> {
  factory _$ConferenceCopyWith(_Conference value, $Res Function(_Conference) _then) = __$ConferenceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'logo_url') String logoUrl, String location, DateTime startDate, DateTime endDate, String? description,@JsonKey(name: 'is_demo') bool isDemo
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? location = null,Object? startDate = null,Object? endDate = null,Object? description = freezed,Object? isDemo = null,}) {
  return _then(_Conference(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isDemo: null == isDemo ? _self.isDemo : isDemo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
