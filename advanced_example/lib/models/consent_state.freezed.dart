// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsentState {

 List<Consent> get consents;
/// Create a copy of ConsentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsentStateCopyWith<ConsentState> get copyWith => _$ConsentStateCopyWithImpl<ConsentState>(this as ConsentState, _$identity);

  /// Serializes this ConsentState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsentState&&const DeepCollectionEquality().equals(other.consents, consents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(consents));

@override
String toString() {
  return 'ConsentState(consents: $consents)';
}


}

/// @nodoc
abstract mixin class $ConsentStateCopyWith<$Res>  {
  factory $ConsentStateCopyWith(ConsentState value, $Res Function(ConsentState) _then) = _$ConsentStateCopyWithImpl;
@useResult
$Res call({
 List<Consent> consents
});




}
/// @nodoc
class _$ConsentStateCopyWithImpl<$Res>
    implements $ConsentStateCopyWith<$Res> {
  _$ConsentStateCopyWithImpl(this._self, this._then);

  final ConsentState _self;
  final $Res Function(ConsentState) _then;

/// Create a copy of ConsentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consents = null,}) {
  return _then(_self.copyWith(
consents: null == consents ? _self.consents : consents // ignore: cast_nullable_to_non_nullable
as List<Consent>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsentState].
extension ConsentStatePatterns on ConsentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsentState value)  $default,){
final _that = this;
switch (_that) {
case _ConsentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsentState value)?  $default,){
final _that = this;
switch (_that) {
case _ConsentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Consent> consents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsentState() when $default != null:
return $default(_that.consents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Consent> consents)  $default,) {final _that = this;
switch (_that) {
case _ConsentState():
return $default(_that.consents);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Consent> consents)?  $default,) {final _that = this;
switch (_that) {
case _ConsentState() when $default != null:
return $default(_that.consents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsentState implements ConsentState {
  const _ConsentState({required final  List<Consent> consents}): _consents = consents;
  factory _ConsentState.fromJson(Map<String, dynamic> json) => _$ConsentStateFromJson(json);

 final  List<Consent> _consents;
@override List<Consent> get consents {
  if (_consents is EqualUnmodifiableListView) return _consents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consents);
}


/// Create a copy of ConsentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsentStateCopyWith<_ConsentState> get copyWith => __$ConsentStateCopyWithImpl<_ConsentState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsentStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsentState&&const DeepCollectionEquality().equals(other._consents, _consents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_consents));

@override
String toString() {
  return 'ConsentState(consents: $consents)';
}


}

/// @nodoc
abstract mixin class _$ConsentStateCopyWith<$Res> implements $ConsentStateCopyWith<$Res> {
  factory _$ConsentStateCopyWith(_ConsentState value, $Res Function(_ConsentState) _then) = __$ConsentStateCopyWithImpl;
@override @useResult
$Res call({
 List<Consent> consents
});




}
/// @nodoc
class __$ConsentStateCopyWithImpl<$Res>
    implements _$ConsentStateCopyWith<$Res> {
  __$ConsentStateCopyWithImpl(this._self, this._then);

  final _ConsentState _self;
  final $Res Function(_ConsentState) _then;

/// Create a copy of ConsentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consents = null,}) {
  return _then(_ConsentState(
consents: null == consents ? _self._consents : consents // ignore: cast_nullable_to_non_nullable
as List<Consent>,
  ));
}


}

// dart format on
