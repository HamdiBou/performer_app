// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speaker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Speaker {

 String get id; String get name; String get role; String get bio;@JsonKey(name: 'image_url') String get imageUrl;
/// Create a copy of Speaker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerCopyWith<Speaker> get copyWith => _$SpeakerCopyWithImpl<Speaker>(this as Speaker, _$identity);

  /// Serializes this Speaker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Speaker&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,bio,imageUrl);

@override
String toString() {
  return 'Speaker(id: $id, name: $name, role: $role, bio: $bio, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $SpeakerCopyWith<$Res>  {
  factory $SpeakerCopyWith(Speaker value, $Res Function(Speaker) _then) = _$SpeakerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String role, String bio,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class _$SpeakerCopyWithImpl<$Res>
    implements $SpeakerCopyWith<$Res> {
  _$SpeakerCopyWithImpl(this._self, this._then);

  final Speaker _self;
  final $Res Function(Speaker) _then;

/// Create a copy of Speaker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? bio = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Speaker].
extension SpeakerPatterns on Speaker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Speaker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Speaker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Speaker value)  $default,){
final _that = this;
switch (_that) {
case _Speaker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Speaker value)?  $default,){
final _that = this;
switch (_that) {
case _Speaker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String bio, @JsonKey(name: 'image_url')  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Speaker() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.bio,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String bio, @JsonKey(name: 'image_url')  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Speaker():
return $default(_that.id,_that.name,_that.role,_that.bio,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String role,  String bio, @JsonKey(name: 'image_url')  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Speaker() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.bio,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Speaker implements Speaker {
  const _Speaker({required this.id, required this.name, required this.role, required this.bio, @JsonKey(name: 'image_url') required this.imageUrl});
  factory _Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);

@override final  String id;
@override final  String name;
@override final  String role;
@override final  String bio;
@override@JsonKey(name: 'image_url') final  String imageUrl;

/// Create a copy of Speaker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakerCopyWith<_Speaker> get copyWith => __$SpeakerCopyWithImpl<_Speaker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Speaker&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,bio,imageUrl);

@override
String toString() {
  return 'Speaker(id: $id, name: $name, role: $role, bio: $bio, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$SpeakerCopyWith<$Res> implements $SpeakerCopyWith<$Res> {
  factory _$SpeakerCopyWith(_Speaker value, $Res Function(_Speaker) _then) = __$SpeakerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String role, String bio,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class __$SpeakerCopyWithImpl<$Res>
    implements _$SpeakerCopyWith<$Res> {
  __$SpeakerCopyWithImpl(this._self, this._then);

  final _Speaker _self;
  final $Res Function(_Speaker) _then;

/// Create a copy of Speaker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? bio = null,Object? imageUrl = null,}) {
  return _then(_Speaker(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
