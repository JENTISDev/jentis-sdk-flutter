// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jentis_event_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JentisEventData {

/// Optional map of boolean attributes for the event.
 Map<String, bool>? get boolAttributes;/// Optional map of string attributes for the event.
 Map<String, String>? get stringAttributes;/// Optional map of integer attributes for the event.
 Map<String, int>? get intAttributes;/// Optional map of double attributes for the event.
 Map<String, double>? get doubleAttributes;
/// Create a copy of JentisEventData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JentisEventDataCopyWith<JentisEventData> get copyWith => _$JentisEventDataCopyWithImpl<JentisEventData>(this as JentisEventData, _$identity);

  /// Serializes this JentisEventData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JentisEventData&&const DeepCollectionEquality().equals(other.boolAttributes, boolAttributes)&&const DeepCollectionEquality().equals(other.stringAttributes, stringAttributes)&&const DeepCollectionEquality().equals(other.intAttributes, intAttributes)&&const DeepCollectionEquality().equals(other.doubleAttributes, doubleAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(boolAttributes),const DeepCollectionEquality().hash(stringAttributes),const DeepCollectionEquality().hash(intAttributes),const DeepCollectionEquality().hash(doubleAttributes));

@override
String toString() {
  return 'JentisEventData(boolAttributes: $boolAttributes, stringAttributes: $stringAttributes, intAttributes: $intAttributes, doubleAttributes: $doubleAttributes)';
}


}

/// @nodoc
abstract mixin class $JentisEventDataCopyWith<$Res>  {
  factory $JentisEventDataCopyWith(JentisEventData value, $Res Function(JentisEventData) _then) = _$JentisEventDataCopyWithImpl;
@useResult
$Res call({
 Map<String, bool>? boolAttributes, Map<String, String>? stringAttributes, Map<String, int>? intAttributes, Map<String, double>? doubleAttributes
});




}
/// @nodoc
class _$JentisEventDataCopyWithImpl<$Res>
    implements $JentisEventDataCopyWith<$Res> {
  _$JentisEventDataCopyWithImpl(this._self, this._then);

  final JentisEventData _self;
  final $Res Function(JentisEventData) _then;

/// Create a copy of JentisEventData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boolAttributes = freezed,Object? stringAttributes = freezed,Object? intAttributes = freezed,Object? doubleAttributes = freezed,}) {
  return _then(_self.copyWith(
boolAttributes: freezed == boolAttributes ? _self.boolAttributes : boolAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,stringAttributes: freezed == stringAttributes ? _self.stringAttributes : stringAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,intAttributes: freezed == intAttributes ? _self.intAttributes : intAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,doubleAttributes: freezed == doubleAttributes ? _self.doubleAttributes : doubleAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}

}


/// Adds pattern-matching-related methods to [JentisEventData].
extension JentisEventDataPatterns on JentisEventData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JentisEventData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JentisEventData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JentisEventData value)  $default,){
final _that = this;
switch (_that) {
case _JentisEventData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JentisEventData value)?  $default,){
final _that = this;
switch (_that) {
case _JentisEventData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, bool>? boolAttributes,  Map<String, String>? stringAttributes,  Map<String, int>? intAttributes,  Map<String, double>? doubleAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JentisEventData() when $default != null:
return $default(_that.boolAttributes,_that.stringAttributes,_that.intAttributes,_that.doubleAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, bool>? boolAttributes,  Map<String, String>? stringAttributes,  Map<String, int>? intAttributes,  Map<String, double>? doubleAttributes)  $default,) {final _that = this;
switch (_that) {
case _JentisEventData():
return $default(_that.boolAttributes,_that.stringAttributes,_that.intAttributes,_that.doubleAttributes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, bool>? boolAttributes,  Map<String, String>? stringAttributes,  Map<String, int>? intAttributes,  Map<String, double>? doubleAttributes)?  $default,) {final _that = this;
switch (_that) {
case _JentisEventData() when $default != null:
return $default(_that.boolAttributes,_that.stringAttributes,_that.intAttributes,_that.doubleAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JentisEventData implements JentisEventData {
  const _JentisEventData({final  Map<String, bool>? boolAttributes, final  Map<String, String>? stringAttributes, final  Map<String, int>? intAttributes, final  Map<String, double>? doubleAttributes}): _boolAttributes = boolAttributes,_stringAttributes = stringAttributes,_intAttributes = intAttributes,_doubleAttributes = doubleAttributes;
  factory _JentisEventData.fromJson(Map<String, dynamic> json) => _$JentisEventDataFromJson(json);

/// Optional map of boolean attributes for the event.
 final  Map<String, bool>? _boolAttributes;
/// Optional map of boolean attributes for the event.
@override Map<String, bool>? get boolAttributes {
  final value = _boolAttributes;
  if (value == null) return null;
  if (_boolAttributes is EqualUnmodifiableMapView) return _boolAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Optional map of string attributes for the event.
 final  Map<String, String>? _stringAttributes;
/// Optional map of string attributes for the event.
@override Map<String, String>? get stringAttributes {
  final value = _stringAttributes;
  if (value == null) return null;
  if (_stringAttributes is EqualUnmodifiableMapView) return _stringAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Optional map of integer attributes for the event.
 final  Map<String, int>? _intAttributes;
/// Optional map of integer attributes for the event.
@override Map<String, int>? get intAttributes {
  final value = _intAttributes;
  if (value == null) return null;
  if (_intAttributes is EqualUnmodifiableMapView) return _intAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Optional map of double attributes for the event.
 final  Map<String, double>? _doubleAttributes;
/// Optional map of double attributes for the event.
@override Map<String, double>? get doubleAttributes {
  final value = _doubleAttributes;
  if (value == null) return null;
  if (_doubleAttributes is EqualUnmodifiableMapView) return _doubleAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of JentisEventData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JentisEventDataCopyWith<_JentisEventData> get copyWith => __$JentisEventDataCopyWithImpl<_JentisEventData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JentisEventDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JentisEventData&&const DeepCollectionEquality().equals(other._boolAttributes, _boolAttributes)&&const DeepCollectionEquality().equals(other._stringAttributes, _stringAttributes)&&const DeepCollectionEquality().equals(other._intAttributes, _intAttributes)&&const DeepCollectionEquality().equals(other._doubleAttributes, _doubleAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_boolAttributes),const DeepCollectionEquality().hash(_stringAttributes),const DeepCollectionEquality().hash(_intAttributes),const DeepCollectionEquality().hash(_doubleAttributes));

@override
String toString() {
  return 'JentisEventData(boolAttributes: $boolAttributes, stringAttributes: $stringAttributes, intAttributes: $intAttributes, doubleAttributes: $doubleAttributes)';
}


}

/// @nodoc
abstract mixin class _$JentisEventDataCopyWith<$Res> implements $JentisEventDataCopyWith<$Res> {
  factory _$JentisEventDataCopyWith(_JentisEventData value, $Res Function(_JentisEventData) _then) = __$JentisEventDataCopyWithImpl;
@override @useResult
$Res call({
 Map<String, bool>? boolAttributes, Map<String, String>? stringAttributes, Map<String, int>? intAttributes, Map<String, double>? doubleAttributes
});




}
/// @nodoc
class __$JentisEventDataCopyWithImpl<$Res>
    implements _$JentisEventDataCopyWith<$Res> {
  __$JentisEventDataCopyWithImpl(this._self, this._then);

  final _JentisEventData _self;
  final $Res Function(_JentisEventData) _then;

/// Create a copy of JentisEventData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boolAttributes = freezed,Object? stringAttributes = freezed,Object? intAttributes = freezed,Object? doubleAttributes = freezed,}) {
  return _then(_JentisEventData(
boolAttributes: freezed == boolAttributes ? _self._boolAttributes : boolAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,stringAttributes: freezed == stringAttributes ? _self._stringAttributes : stringAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,intAttributes: freezed == intAttributes ? _self._intAttributes : intAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,doubleAttributes: freezed == doubleAttributes ? _self._doubleAttributes : doubleAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}


}

// dart format on
