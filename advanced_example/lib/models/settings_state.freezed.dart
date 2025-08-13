// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsState {

 String? get domain;// The tracked domain (important for web views)
 CustomProtocol? get customProtocol; String get trackDomain; String get container; String? get version; String? get debugCode; int? get sessionTimeoutInSeconds; String get authorizationToken; JentisEnvironment get environment; bool get enableOfflineTracking; int get offlineTimeout;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);

  /// Serializes this SettingsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.customProtocol, customProtocol) || other.customProtocol == customProtocol)&&(identical(other.trackDomain, trackDomain) || other.trackDomain == trackDomain)&&(identical(other.container, container) || other.container == container)&&(identical(other.version, version) || other.version == version)&&(identical(other.debugCode, debugCode) || other.debugCode == debugCode)&&(identical(other.sessionTimeoutInSeconds, sessionTimeoutInSeconds) || other.sessionTimeoutInSeconds == sessionTimeoutInSeconds)&&(identical(other.authorizationToken, authorizationToken) || other.authorizationToken == authorizationToken)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.enableOfflineTracking, enableOfflineTracking) || other.enableOfflineTracking == enableOfflineTracking)&&(identical(other.offlineTimeout, offlineTimeout) || other.offlineTimeout == offlineTimeout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,customProtocol,trackDomain,container,version,debugCode,sessionTimeoutInSeconds,authorizationToken,environment,enableOfflineTracking,offlineTimeout);

@override
String toString() {
  return 'SettingsState(domain: $domain, customProtocol: $customProtocol, trackDomain: $trackDomain, container: $container, version: $version, debugCode: $debugCode, sessionTimeoutInSeconds: $sessionTimeoutInSeconds, authorizationToken: $authorizationToken, environment: $environment, enableOfflineTracking: $enableOfflineTracking, offlineTimeout: $offlineTimeout)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 String? domain, CustomProtocol? customProtocol, String trackDomain, String container, String? version, String? debugCode, int? sessionTimeoutInSeconds, String authorizationToken, JentisEnvironment environment, bool enableOfflineTracking, int offlineTimeout
});




}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = freezed,Object? customProtocol = freezed,Object? trackDomain = null,Object? container = null,Object? version = freezed,Object? debugCode = freezed,Object? sessionTimeoutInSeconds = freezed,Object? authorizationToken = null,Object? environment = null,Object? enableOfflineTracking = null,Object? offlineTimeout = null,}) {
  return _then(_self.copyWith(
domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,customProtocol: freezed == customProtocol ? _self.customProtocol : customProtocol // ignore: cast_nullable_to_non_nullable
as CustomProtocol?,trackDomain: null == trackDomain ? _self.trackDomain : trackDomain // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,debugCode: freezed == debugCode ? _self.debugCode : debugCode // ignore: cast_nullable_to_non_nullable
as String?,sessionTimeoutInSeconds: freezed == sessionTimeoutInSeconds ? _self.sessionTimeoutInSeconds : sessionTimeoutInSeconds // ignore: cast_nullable_to_non_nullable
as int?,authorizationToken: null == authorizationToken ? _self.authorizationToken : authorizationToken // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as JentisEnvironment,enableOfflineTracking: null == enableOfflineTracking ? _self.enableOfflineTracking : enableOfflineTracking // ignore: cast_nullable_to_non_nullable
as bool,offlineTimeout: null == offlineTimeout ? _self.offlineTimeout : offlineTimeout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? domain,  CustomProtocol? customProtocol,  String trackDomain,  String container,  String? version,  String? debugCode,  int? sessionTimeoutInSeconds,  String authorizationToken,  JentisEnvironment environment,  bool enableOfflineTracking,  int offlineTimeout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.domain,_that.customProtocol,_that.trackDomain,_that.container,_that.version,_that.debugCode,_that.sessionTimeoutInSeconds,_that.authorizationToken,_that.environment,_that.enableOfflineTracking,_that.offlineTimeout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? domain,  CustomProtocol? customProtocol,  String trackDomain,  String container,  String? version,  String? debugCode,  int? sessionTimeoutInSeconds,  String authorizationToken,  JentisEnvironment environment,  bool enableOfflineTracking,  int offlineTimeout)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.domain,_that.customProtocol,_that.trackDomain,_that.container,_that.version,_that.debugCode,_that.sessionTimeoutInSeconds,_that.authorizationToken,_that.environment,_that.enableOfflineTracking,_that.offlineTimeout);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? domain,  CustomProtocol? customProtocol,  String trackDomain,  String container,  String? version,  String? debugCode,  int? sessionTimeoutInSeconds,  String authorizationToken,  JentisEnvironment environment,  bool enableOfflineTracking,  int offlineTimeout)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.domain,_that.customProtocol,_that.trackDomain,_that.container,_that.version,_that.debugCode,_that.sessionTimeoutInSeconds,_that.authorizationToken,_that.environment,_that.enableOfflineTracking,_that.offlineTimeout);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingsState extends SettingsState {
  const _SettingsState({this.domain, this.customProtocol, required this.trackDomain, required this.container, this.version, this.debugCode, this.sessionTimeoutInSeconds, required this.authorizationToken, required this.environment, this.enableOfflineTracking = true, this.offlineTimeout = 3600}): super._();
  factory _SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);

@override final  String? domain;
// The tracked domain (important for web views)
@override final  CustomProtocol? customProtocol;
@override final  String trackDomain;
@override final  String container;
@override final  String? version;
@override final  String? debugCode;
@override final  int? sessionTimeoutInSeconds;
@override final  String authorizationToken;
@override final  JentisEnvironment environment;
@override@JsonKey() final  bool enableOfflineTracking;
@override@JsonKey() final  int offlineTimeout;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.customProtocol, customProtocol) || other.customProtocol == customProtocol)&&(identical(other.trackDomain, trackDomain) || other.trackDomain == trackDomain)&&(identical(other.container, container) || other.container == container)&&(identical(other.version, version) || other.version == version)&&(identical(other.debugCode, debugCode) || other.debugCode == debugCode)&&(identical(other.sessionTimeoutInSeconds, sessionTimeoutInSeconds) || other.sessionTimeoutInSeconds == sessionTimeoutInSeconds)&&(identical(other.authorizationToken, authorizationToken) || other.authorizationToken == authorizationToken)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.enableOfflineTracking, enableOfflineTracking) || other.enableOfflineTracking == enableOfflineTracking)&&(identical(other.offlineTimeout, offlineTimeout) || other.offlineTimeout == offlineTimeout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,customProtocol,trackDomain,container,version,debugCode,sessionTimeoutInSeconds,authorizationToken,environment,enableOfflineTracking,offlineTimeout);

@override
String toString() {
  return 'SettingsState(domain: $domain, customProtocol: $customProtocol, trackDomain: $trackDomain, container: $container, version: $version, debugCode: $debugCode, sessionTimeoutInSeconds: $sessionTimeoutInSeconds, authorizationToken: $authorizationToken, environment: $environment, enableOfflineTracking: $enableOfflineTracking, offlineTimeout: $offlineTimeout)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 String? domain, CustomProtocol? customProtocol, String trackDomain, String container, String? version, String? debugCode, int? sessionTimeoutInSeconds, String authorizationToken, JentisEnvironment environment, bool enableOfflineTracking, int offlineTimeout
});




}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = freezed,Object? customProtocol = freezed,Object? trackDomain = null,Object? container = null,Object? version = freezed,Object? debugCode = freezed,Object? sessionTimeoutInSeconds = freezed,Object? authorizationToken = null,Object? environment = null,Object? enableOfflineTracking = null,Object? offlineTimeout = null,}) {
  return _then(_SettingsState(
domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,customProtocol: freezed == customProtocol ? _self.customProtocol : customProtocol // ignore: cast_nullable_to_non_nullable
as CustomProtocol?,trackDomain: null == trackDomain ? _self.trackDomain : trackDomain // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,debugCode: freezed == debugCode ? _self.debugCode : debugCode // ignore: cast_nullable_to_non_nullable
as String?,sessionTimeoutInSeconds: freezed == sessionTimeoutInSeconds ? _self.sessionTimeoutInSeconds : sessionTimeoutInSeconds // ignore: cast_nullable_to_non_nullable
as int?,authorizationToken: null == authorizationToken ? _self.authorizationToken : authorizationToken // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as JentisEnvironment,enableOfflineTracking: null == enableOfflineTracking ? _self.enableOfflineTracking : enableOfflineTracking // ignore: cast_nullable_to_non_nullable
as bool,offlineTimeout: null == offlineTimeout ? _self.offlineTimeout : offlineTimeout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
