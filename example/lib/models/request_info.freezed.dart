// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestInfo {

 DateTime get timestamp; String get url; String? get body;
/// Create a copy of RequestInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestInfoCopyWith<RequestInfo> get copyWith => _$RequestInfoCopyWithImpl<RequestInfo>(this as RequestInfo, _$identity);

  /// Serializes this RequestInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestInfo&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.url, url) || other.url == url)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,url,body);

@override
String toString() {
  return 'RequestInfo(timestamp: $timestamp, url: $url, body: $body)';
}


}

/// @nodoc
abstract mixin class $RequestInfoCopyWith<$Res>  {
  factory $RequestInfoCopyWith(RequestInfo value, $Res Function(RequestInfo) _then) = _$RequestInfoCopyWithImpl;
@useResult
$Res call({
 String url, String? body
});




}
/// @nodoc
class _$RequestInfoCopyWithImpl<$Res>
    implements $RequestInfoCopyWith<$Res> {
  _$RequestInfoCopyWithImpl(this._self, this._then);

  final RequestInfo _self;
  final $Res Function(RequestInfo) _then;

/// Create a copy of RequestInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? body = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestInfo].
extension RequestInfoPatterns on RequestInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestInfo value)  $default,){
final _that = this;
switch (_that) {
case _RequestInfo():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RequestInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String? body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestInfo() when $default != null:
return $default(_that.url,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String? body)  $default,) {final _that = this;
switch (_that) {
case _RequestInfo():
return $default(_that.url,_that.body);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String? body)?  $default,) {final _that = this;
switch (_that) {
case _RequestInfo() when $default != null:
return $default(_that.url,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestInfo extends RequestInfo {
   _RequestInfo({required this.url, this.body}): super._();
  factory _RequestInfo.fromJson(Map<String, dynamic> json) => _$RequestInfoFromJson(json);

@override final  String url;
@override final  String? body;

/// Create a copy of RequestInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestInfoCopyWith<_RequestInfo> get copyWith => __$RequestInfoCopyWithImpl<_RequestInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestInfo&&(identical(other.url, url) || other.url == url)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,body);

@override
String toString() {
  return 'RequestInfo(url: $url, body: $body)';
}


}

/// @nodoc
abstract mixin class _$RequestInfoCopyWith<$Res> implements $RequestInfoCopyWith<$Res> {
  factory _$RequestInfoCopyWith(_RequestInfo value, $Res Function(_RequestInfo) _then) = __$RequestInfoCopyWithImpl;
@override @useResult
$Res call({
 String url, String? body
});




}
/// @nodoc
class __$RequestInfoCopyWithImpl<$Res>
    implements _$RequestInfoCopyWith<$Res> {
  __$RequestInfoCopyWithImpl(this._self, this._then);

  final _RequestInfo _self;
  final $Res Function(_RequestInfo) _then;

/// Create a copy of RequestInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? body = freezed,}) {
  return _then(_RequestInfo(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
