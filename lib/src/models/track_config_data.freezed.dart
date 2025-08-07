// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackConfigData {

/// The tracking domain used for sending events.
 String get trackDomain;/// The container ID for the Jentis SDK configuration.
 String get container;/// The environment (live or stage) for tracking.
 JentisEnvironment get environment;/// The authorization token for secure communication.
 String get authorizationToken;/// Optional version string
 String? get version;/// Optional debug code
 String? get debugCode;/// Optional session timeout in seconds.
 int? get sessionTimeoutInSeconds;/// Optional protocol (http or https) for requests.
 CustomProtocol? get customProtocol;/// Whether offline tracking is enabled (default: true).
 bool get enableOfflineTracking;/// Timeout in seconds for offline event submission.
 int get offlineTimeout;
/// Create a copy of TrackConfigData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackConfigDataCopyWith<TrackConfigData> get copyWith => _$TrackConfigDataCopyWithImpl<TrackConfigData>(this as TrackConfigData, _$identity);

  /// Serializes this TrackConfigData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackConfigData&&(identical(other.trackDomain, trackDomain) || other.trackDomain == trackDomain)&&(identical(other.container, container) || other.container == container)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.authorizationToken, authorizationToken) || other.authorizationToken == authorizationToken)&&(identical(other.version, version) || other.version == version)&&(identical(other.debugCode, debugCode) || other.debugCode == debugCode)&&(identical(other.sessionTimeoutInSeconds, sessionTimeoutInSeconds) || other.sessionTimeoutInSeconds == sessionTimeoutInSeconds)&&(identical(other.customProtocol, customProtocol) || other.customProtocol == customProtocol)&&(identical(other.enableOfflineTracking, enableOfflineTracking) || other.enableOfflineTracking == enableOfflineTracking)&&(identical(other.offlineTimeout, offlineTimeout) || other.offlineTimeout == offlineTimeout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackDomain,container,environment,authorizationToken,version,debugCode,sessionTimeoutInSeconds,customProtocol,enableOfflineTracking,offlineTimeout);

@override
String toString() {
  return 'TrackConfigData(trackDomain: $trackDomain, container: $container, environment: $environment, authorizationToken: $authorizationToken, version: $version, debugCode: $debugCode, sessionTimeoutInSeconds: $sessionTimeoutInSeconds, customProtocol: $customProtocol, enableOfflineTracking: $enableOfflineTracking, offlineTimeout: $offlineTimeout)';
}


}

/// @nodoc
abstract mixin class $TrackConfigDataCopyWith<$Res>  {
  factory $TrackConfigDataCopyWith(TrackConfigData value, $Res Function(TrackConfigData) _then) = _$TrackConfigDataCopyWithImpl;
@useResult
$Res call({
 String trackDomain, String container, JentisEnvironment environment, String authorizationToken, String? version, String? debugCode, int? sessionTimeoutInSeconds, CustomProtocol? customProtocol, bool enableOfflineTracking, int offlineTimeout
});




}
/// @nodoc
class _$TrackConfigDataCopyWithImpl<$Res>
    implements $TrackConfigDataCopyWith<$Res> {
  _$TrackConfigDataCopyWithImpl(this._self, this._then);

  final TrackConfigData _self;
  final $Res Function(TrackConfigData) _then;

/// Create a copy of TrackConfigData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackDomain = null,Object? container = null,Object? environment = null,Object? authorizationToken = null,Object? version = freezed,Object? debugCode = freezed,Object? sessionTimeoutInSeconds = freezed,Object? customProtocol = freezed,Object? enableOfflineTracking = null,Object? offlineTimeout = null,}) {
  return _then(_self.copyWith(
trackDomain: null == trackDomain ? _self.trackDomain : trackDomain // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as JentisEnvironment,authorizationToken: null == authorizationToken ? _self.authorizationToken : authorizationToken // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,debugCode: freezed == debugCode ? _self.debugCode : debugCode // ignore: cast_nullable_to_non_nullable
as String?,sessionTimeoutInSeconds: freezed == sessionTimeoutInSeconds ? _self.sessionTimeoutInSeconds : sessionTimeoutInSeconds // ignore: cast_nullable_to_non_nullable
as int?,customProtocol: freezed == customProtocol ? _self.customProtocol : customProtocol // ignore: cast_nullable_to_non_nullable
as CustomProtocol?,enableOfflineTracking: null == enableOfflineTracking ? _self.enableOfflineTracking : enableOfflineTracking // ignore: cast_nullable_to_non_nullable
as bool,offlineTimeout: null == offlineTimeout ? _self.offlineTimeout : offlineTimeout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackConfigData].
extension TrackConfigDataPatterns on TrackConfigData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackConfigData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackConfigData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackConfigData value)  $default,){
final _that = this;
switch (_that) {
case _TrackConfigData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackConfigData value)?  $default,){
final _that = this;
switch (_that) {
case _TrackConfigData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trackDomain,  String container,  JentisEnvironment environment,  String authorizationToken,  String? version,  String? debugCode,  int? sessionTimeoutInSeconds,  CustomProtocol? customProtocol,  bool enableOfflineTracking,  int offlineTimeout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackConfigData() when $default != null:
return $default(_that.trackDomain,_that.container,_that.environment,_that.authorizationToken,_that.version,_that.debugCode,_that.sessionTimeoutInSeconds,_that.customProtocol,_that.enableOfflineTracking,_that.offlineTimeout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trackDomain,  String container,  JentisEnvironment environment,  String authorizationToken,  String? version,  String? debugCode,  int? sessionTimeoutInSeconds,  CustomProtocol? customProtocol,  bool enableOfflineTracking,  int offlineTimeout)  $default,) {final _that = this;
switch (_that) {
case _TrackConfigData():
return $default(_that.trackDomain,_that.container,_that.environment,_that.authorizationToken,_that.version,_that.debugCode,_that.sessionTimeoutInSeconds,_that.customProtocol,_that.enableOfflineTracking,_that.offlineTimeout);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trackDomain,  String container,  JentisEnvironment environment,  String authorizationToken,  String? version,  String? debugCode,  int? sessionTimeoutInSeconds,  CustomProtocol? customProtocol,  bool enableOfflineTracking,  int offlineTimeout)?  $default,) {final _that = this;
switch (_that) {
case _TrackConfigData() when $default != null:
return $default(_that.trackDomain,_that.container,_that.environment,_that.authorizationToken,_that.version,_that.debugCode,_that.sessionTimeoutInSeconds,_that.customProtocol,_that.enableOfflineTracking,_that.offlineTimeout);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackConfigData implements TrackConfigData {
  const _TrackConfigData({required this.trackDomain, required this.container, required this.environment, required this.authorizationToken, this.version, this.debugCode, this.sessionTimeoutInSeconds, this.customProtocol, this.enableOfflineTracking = true, required this.offlineTimeout});
  factory _TrackConfigData.fromJson(Map<String, dynamic> json) => _$TrackConfigDataFromJson(json);

/// The tracking domain used for sending events.
@override final  String trackDomain;
/// The container ID for the Jentis SDK configuration.
@override final  String container;
/// The environment (live or stage) for tracking.
@override final  JentisEnvironment environment;
/// The authorization token for secure communication.
@override final  String authorizationToken;
/// Optional version string
@override final  String? version;
/// Optional debug code
@override final  String? debugCode;
/// Optional session timeout in seconds.
@override final  int? sessionTimeoutInSeconds;
/// Optional protocol (http or https) for requests.
@override final  CustomProtocol? customProtocol;
/// Whether offline tracking is enabled (default: true).
@override@JsonKey() final  bool enableOfflineTracking;
/// Timeout in seconds for offline event submission.
@override final  int offlineTimeout;

/// Create a copy of TrackConfigData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackConfigDataCopyWith<_TrackConfigData> get copyWith => __$TrackConfigDataCopyWithImpl<_TrackConfigData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackConfigDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackConfigData&&(identical(other.trackDomain, trackDomain) || other.trackDomain == trackDomain)&&(identical(other.container, container) || other.container == container)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.authorizationToken, authorizationToken) || other.authorizationToken == authorizationToken)&&(identical(other.version, version) || other.version == version)&&(identical(other.debugCode, debugCode) || other.debugCode == debugCode)&&(identical(other.sessionTimeoutInSeconds, sessionTimeoutInSeconds) || other.sessionTimeoutInSeconds == sessionTimeoutInSeconds)&&(identical(other.customProtocol, customProtocol) || other.customProtocol == customProtocol)&&(identical(other.enableOfflineTracking, enableOfflineTracking) || other.enableOfflineTracking == enableOfflineTracking)&&(identical(other.offlineTimeout, offlineTimeout) || other.offlineTimeout == offlineTimeout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackDomain,container,environment,authorizationToken,version,debugCode,sessionTimeoutInSeconds,customProtocol,enableOfflineTracking,offlineTimeout);

@override
String toString() {
  return 'TrackConfigData(trackDomain: $trackDomain, container: $container, environment: $environment, authorizationToken: $authorizationToken, version: $version, debugCode: $debugCode, sessionTimeoutInSeconds: $sessionTimeoutInSeconds, customProtocol: $customProtocol, enableOfflineTracking: $enableOfflineTracking, offlineTimeout: $offlineTimeout)';
}


}

/// @nodoc
abstract mixin class _$TrackConfigDataCopyWith<$Res> implements $TrackConfigDataCopyWith<$Res> {
  factory _$TrackConfigDataCopyWith(_TrackConfigData value, $Res Function(_TrackConfigData) _then) = __$TrackConfigDataCopyWithImpl;
@override @useResult
$Res call({
 String trackDomain, String container, JentisEnvironment environment, String authorizationToken, String? version, String? debugCode, int? sessionTimeoutInSeconds, CustomProtocol? customProtocol, bool enableOfflineTracking, int offlineTimeout
});




}
/// @nodoc
class __$TrackConfigDataCopyWithImpl<$Res>
    implements _$TrackConfigDataCopyWith<$Res> {
  __$TrackConfigDataCopyWithImpl(this._self, this._then);

  final _TrackConfigData _self;
  final $Res Function(_TrackConfigData) _then;

/// Create a copy of TrackConfigData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackDomain = null,Object? container = null,Object? environment = null,Object? authorizationToken = null,Object? version = freezed,Object? debugCode = freezed,Object? sessionTimeoutInSeconds = freezed,Object? customProtocol = freezed,Object? enableOfflineTracking = null,Object? offlineTimeout = null,}) {
  return _then(_TrackConfigData(
trackDomain: null == trackDomain ? _self.trackDomain : trackDomain // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as JentisEnvironment,authorizationToken: null == authorizationToken ? _self.authorizationToken : authorizationToken // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,debugCode: freezed == debugCode ? _self.debugCode : debugCode // ignore: cast_nullable_to_non_nullable
as String?,sessionTimeoutInSeconds: freezed == sessionTimeoutInSeconds ? _self.sessionTimeoutInSeconds : sessionTimeoutInSeconds // ignore: cast_nullable_to_non_nullable
as int?,customProtocol: freezed == customProtocol ? _self.customProtocol : customProtocol // ignore: cast_nullable_to_non_nullable
as CustomProtocol?,enableOfflineTracking: null == enableOfflineTracking ? _self.enableOfflineTracking : enableOfflineTracking // ignore: cast_nullable_to_non_nullable
as bool,offlineTimeout: null == offlineTimeout ? _self.offlineTimeout : offlineTimeout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
