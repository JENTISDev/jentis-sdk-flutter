// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jentis_enrichment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JentisEnrichment {

/// The plugin ID used
 String get pluginId;/// Optional arguments
 Map<String, Object?>? get arguments;/// Optional list of variable names to be enriched.
 List<String>? get variables;
/// Create a copy of JentisEnrichment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JentisEnrichmentCopyWith<JentisEnrichment> get copyWith => _$JentisEnrichmentCopyWithImpl<JentisEnrichment>(this as JentisEnrichment, _$identity);

  /// Serializes this JentisEnrichment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JentisEnrichment&&(identical(other.pluginId, pluginId) || other.pluginId == pluginId)&&const DeepCollectionEquality().equals(other.arguments, arguments)&&const DeepCollectionEquality().equals(other.variables, variables));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pluginId,const DeepCollectionEquality().hash(arguments),const DeepCollectionEquality().hash(variables));

@override
String toString() {
  return 'JentisEnrichment(pluginId: $pluginId, arguments: $arguments, variables: $variables)';
}


}

/// @nodoc
abstract mixin class $JentisEnrichmentCopyWith<$Res>  {
  factory $JentisEnrichmentCopyWith(JentisEnrichment value, $Res Function(JentisEnrichment) _then) = _$JentisEnrichmentCopyWithImpl;
@useResult
$Res call({
 String pluginId, Map<String, Object?>? arguments, List<String>? variables
});




}
/// @nodoc
class _$JentisEnrichmentCopyWithImpl<$Res>
    implements $JentisEnrichmentCopyWith<$Res> {
  _$JentisEnrichmentCopyWithImpl(this._self, this._then);

  final JentisEnrichment _self;
  final $Res Function(JentisEnrichment) _then;

/// Create a copy of JentisEnrichment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pluginId = null,Object? arguments = freezed,Object? variables = freezed,}) {
  return _then(_self.copyWith(
pluginId: null == pluginId ? _self.pluginId : pluginId // ignore: cast_nullable_to_non_nullable
as String,arguments: freezed == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,variables: freezed == variables ? _self.variables : variables // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [JentisEnrichment].
extension JentisEnrichmentPatterns on JentisEnrichment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JentisEnrichment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JentisEnrichment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JentisEnrichment value)  $default,){
final _that = this;
switch (_that) {
case _JentisEnrichment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JentisEnrichment value)?  $default,){
final _that = this;
switch (_that) {
case _JentisEnrichment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pluginId,  Map<String, Object?>? arguments,  List<String>? variables)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JentisEnrichment() when $default != null:
return $default(_that.pluginId,_that.arguments,_that.variables);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pluginId,  Map<String, Object?>? arguments,  List<String>? variables)  $default,) {final _that = this;
switch (_that) {
case _JentisEnrichment():
return $default(_that.pluginId,_that.arguments,_that.variables);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pluginId,  Map<String, Object?>? arguments,  List<String>? variables)?  $default,) {final _that = this;
switch (_that) {
case _JentisEnrichment() when $default != null:
return $default(_that.pluginId,_that.arguments,_that.variables);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JentisEnrichment implements JentisEnrichment {
  const _JentisEnrichment({required this.pluginId, final  Map<String, Object?>? arguments, final  List<String>? variables}): _arguments = arguments,_variables = variables;
  factory _JentisEnrichment.fromJson(Map<String, dynamic> json) => _$JentisEnrichmentFromJson(json);

/// The plugin ID used
@override final  String pluginId;
/// Optional arguments
 final  Map<String, Object?>? _arguments;
/// Optional arguments
@override Map<String, Object?>? get arguments {
  final value = _arguments;
  if (value == null) return null;
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Optional list of variable names to be enriched.
 final  List<String>? _variables;
/// Optional list of variable names to be enriched.
@override List<String>? get variables {
  final value = _variables;
  if (value == null) return null;
  if (_variables is EqualUnmodifiableListView) return _variables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of JentisEnrichment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JentisEnrichmentCopyWith<_JentisEnrichment> get copyWith => __$JentisEnrichmentCopyWithImpl<_JentisEnrichment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JentisEnrichmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JentisEnrichment&&(identical(other.pluginId, pluginId) || other.pluginId == pluginId)&&const DeepCollectionEquality().equals(other._arguments, _arguments)&&const DeepCollectionEquality().equals(other._variables, _variables));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pluginId,const DeepCollectionEquality().hash(_arguments),const DeepCollectionEquality().hash(_variables));

@override
String toString() {
  return 'JentisEnrichment(pluginId: $pluginId, arguments: $arguments, variables: $variables)';
}


}

/// @nodoc
abstract mixin class _$JentisEnrichmentCopyWith<$Res> implements $JentisEnrichmentCopyWith<$Res> {
  factory _$JentisEnrichmentCopyWith(_JentisEnrichment value, $Res Function(_JentisEnrichment) _then) = __$JentisEnrichmentCopyWithImpl;
@override @useResult
$Res call({
 String pluginId, Map<String, Object?>? arguments, List<String>? variables
});




}
/// @nodoc
class __$JentisEnrichmentCopyWithImpl<$Res>
    implements _$JentisEnrichmentCopyWith<$Res> {
  __$JentisEnrichmentCopyWithImpl(this._self, this._then);

  final _JentisEnrichment _self;
  final $Res Function(_JentisEnrichment) _then;

/// Create a copy of JentisEnrichment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pluginId = null,Object? arguments = freezed,Object? variables = freezed,}) {
  return _then(_JentisEnrichment(
pluginId: null == pluginId ? _self.pluginId : pluginId // ignore: cast_nullable_to_non_nullable
as String,arguments: freezed == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,variables: freezed == variables ? _self._variables : variables // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
