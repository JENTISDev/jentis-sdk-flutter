// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Consent {

 String get vendorId; JentisConsentValue get value;
/// Create a copy of Consent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsentCopyWith<Consent> get copyWith => _$ConsentCopyWithImpl<Consent>(this as Consent, _$identity);

  /// Serializes this Consent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Consent&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendorId,value);

@override
String toString() {
  return 'Consent(vendorId: $vendorId, value: $value)';
}


}

/// @nodoc
abstract mixin class $ConsentCopyWith<$Res>  {
  factory $ConsentCopyWith(Consent value, $Res Function(Consent) _then) = _$ConsentCopyWithImpl;
@useResult
$Res call({
 String vendorId, JentisConsentValue value
});




}
/// @nodoc
class _$ConsentCopyWithImpl<$Res>
    implements $ConsentCopyWith<$Res> {
  _$ConsentCopyWithImpl(this._self, this._then);

  final Consent _self;
  final $Res Function(Consent) _then;

/// Create a copy of Consent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vendorId = null,Object? value = null,}) {
  return _then(_self.copyWith(
vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as JentisConsentValue,
  ));
}

}


/// Adds pattern-matching-related methods to [Consent].
extension ConsentPatterns on Consent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Consent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Consent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Consent value)  $default,){
final _that = this;
switch (_that) {
case _Consent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Consent value)?  $default,){
final _that = this;
switch (_that) {
case _Consent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vendorId,  JentisConsentValue value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Consent() when $default != null:
return $default(_that.vendorId,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vendorId,  JentisConsentValue value)  $default,) {final _that = this;
switch (_that) {
case _Consent():
return $default(_that.vendorId,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vendorId,  JentisConsentValue value)?  $default,) {final _that = this;
switch (_that) {
case _Consent() when $default != null:
return $default(_that.vendorId,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Consent implements Consent {
  const _Consent({required this.vendorId, this.value = JentisConsentValue.deny});
  factory _Consent.fromJson(Map<String, dynamic> json) => _$ConsentFromJson(json);

@override final  String vendorId;
@override@JsonKey() final  JentisConsentValue value;

/// Create a copy of Consent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsentCopyWith<_Consent> get copyWith => __$ConsentCopyWithImpl<_Consent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Consent&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendorId,value);

@override
String toString() {
  return 'Consent(vendorId: $vendorId, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ConsentCopyWith<$Res> implements $ConsentCopyWith<$Res> {
  factory _$ConsentCopyWith(_Consent value, $Res Function(_Consent) _then) = __$ConsentCopyWithImpl;
@override @useResult
$Res call({
 String vendorId, JentisConsentValue value
});




}
/// @nodoc
class __$ConsentCopyWithImpl<$Res>
    implements _$ConsentCopyWith<$Res> {
  __$ConsentCopyWithImpl(this._self, this._then);

  final _Consent _self;
  final $Res Function(_Consent) _then;

/// Create a copy of Consent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vendorId = null,Object? value = null,}) {
  return _then(_Consent(
vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as JentisConsentValue,
  ));
}


}

// dart format on
