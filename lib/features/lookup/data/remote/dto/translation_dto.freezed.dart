// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslationDto {

 TranslationResponseData get responseData; int? get responseStatus;
/// Create a copy of TranslationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationDtoCopyWith<TranslationDto> get copyWith => _$TranslationDtoCopyWithImpl<TranslationDto>(this as TranslationDto, _$identity);

  /// Serializes this TranslationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationDto&&(identical(other.responseData, responseData) || other.responseData == responseData)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responseData,responseStatus);

@override
String toString() {
  return 'TranslationDto(responseData: $responseData, responseStatus: $responseStatus)';
}


}

/// @nodoc
abstract mixin class $TranslationDtoCopyWith<$Res>  {
  factory $TranslationDtoCopyWith(TranslationDto value, $Res Function(TranslationDto) _then) = _$TranslationDtoCopyWithImpl;
@useResult
$Res call({
 TranslationResponseData responseData, int? responseStatus
});


$TranslationResponseDataCopyWith<$Res> get responseData;

}
/// @nodoc
class _$TranslationDtoCopyWithImpl<$Res>
    implements $TranslationDtoCopyWith<$Res> {
  _$TranslationDtoCopyWithImpl(this._self, this._then);

  final TranslationDto _self;
  final $Res Function(TranslationDto) _then;

/// Create a copy of TranslationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? responseData = null,Object? responseStatus = freezed,}) {
  return _then(_self.copyWith(
responseData: null == responseData ? _self.responseData : responseData // ignore: cast_nullable_to_non_nullable
as TranslationResponseData,responseStatus: freezed == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of TranslationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslationResponseDataCopyWith<$Res> get responseData {
  
  return $TranslationResponseDataCopyWith<$Res>(_self.responseData, (value) {
    return _then(_self.copyWith(responseData: value));
  });
}
}


/// Adds pattern-matching-related methods to [TranslationDto].
extension TranslationDtoPatterns on TranslationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationDto value)  $default,){
final _that = this;
switch (_that) {
case _TranslationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationDto value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TranslationResponseData responseData,  int? responseStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationDto() when $default != null:
return $default(_that.responseData,_that.responseStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TranslationResponseData responseData,  int? responseStatus)  $default,) {final _that = this;
switch (_that) {
case _TranslationDto():
return $default(_that.responseData,_that.responseStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TranslationResponseData responseData,  int? responseStatus)?  $default,) {final _that = this;
switch (_that) {
case _TranslationDto() when $default != null:
return $default(_that.responseData,_that.responseStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslationDto implements TranslationDto {
  const _TranslationDto({required this.responseData, this.responseStatus});
  factory _TranslationDto.fromJson(Map<String, dynamic> json) => _$TranslationDtoFromJson(json);

@override final  TranslationResponseData responseData;
@override final  int? responseStatus;

/// Create a copy of TranslationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationDtoCopyWith<_TranslationDto> get copyWith => __$TranslationDtoCopyWithImpl<_TranslationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationDto&&(identical(other.responseData, responseData) || other.responseData == responseData)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responseData,responseStatus);

@override
String toString() {
  return 'TranslationDto(responseData: $responseData, responseStatus: $responseStatus)';
}


}

/// @nodoc
abstract mixin class _$TranslationDtoCopyWith<$Res> implements $TranslationDtoCopyWith<$Res> {
  factory _$TranslationDtoCopyWith(_TranslationDto value, $Res Function(_TranslationDto) _then) = __$TranslationDtoCopyWithImpl;
@override @useResult
$Res call({
 TranslationResponseData responseData, int? responseStatus
});


@override $TranslationResponseDataCopyWith<$Res> get responseData;

}
/// @nodoc
class __$TranslationDtoCopyWithImpl<$Res>
    implements _$TranslationDtoCopyWith<$Res> {
  __$TranslationDtoCopyWithImpl(this._self, this._then);

  final _TranslationDto _self;
  final $Res Function(_TranslationDto) _then;

/// Create a copy of TranslationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? responseData = null,Object? responseStatus = freezed,}) {
  return _then(_TranslationDto(
responseData: null == responseData ? _self.responseData : responseData // ignore: cast_nullable_to_non_nullable
as TranslationResponseData,responseStatus: freezed == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of TranslationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslationResponseDataCopyWith<$Res> get responseData {
  
  return $TranslationResponseDataCopyWith<$Res>(_self.responseData, (value) {
    return _then(_self.copyWith(responseData: value));
  });
}
}


/// @nodoc
mixin _$TranslationResponseData {

 String get translatedText; double? get match;
/// Create a copy of TranslationResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationResponseDataCopyWith<TranslationResponseData> get copyWith => _$TranslationResponseDataCopyWithImpl<TranslationResponseData>(this as TranslationResponseData, _$identity);

  /// Serializes this TranslationResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationResponseData&&(identical(other.translatedText, translatedText) || other.translatedText == translatedText)&&(identical(other.match, match) || other.match == match));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,translatedText,match);

@override
String toString() {
  return 'TranslationResponseData(translatedText: $translatedText, match: $match)';
}


}

/// @nodoc
abstract mixin class $TranslationResponseDataCopyWith<$Res>  {
  factory $TranslationResponseDataCopyWith(TranslationResponseData value, $Res Function(TranslationResponseData) _then) = _$TranslationResponseDataCopyWithImpl;
@useResult
$Res call({
 String translatedText, double? match
});




}
/// @nodoc
class _$TranslationResponseDataCopyWithImpl<$Res>
    implements $TranslationResponseDataCopyWith<$Res> {
  _$TranslationResponseDataCopyWithImpl(this._self, this._then);

  final TranslationResponseData _self;
  final $Res Function(TranslationResponseData) _then;

/// Create a copy of TranslationResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? translatedText = null,Object? match = freezed,}) {
  return _then(_self.copyWith(
translatedText: null == translatedText ? _self.translatedText : translatedText // ignore: cast_nullable_to_non_nullable
as String,match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslationResponseData].
extension TranslationResponseDataPatterns on TranslationResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationResponseData value)  $default,){
final _that = this;
switch (_that) {
case _TranslationResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String translatedText,  double? match)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationResponseData() when $default != null:
return $default(_that.translatedText,_that.match);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String translatedText,  double? match)  $default,) {final _that = this;
switch (_that) {
case _TranslationResponseData():
return $default(_that.translatedText,_that.match);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String translatedText,  double? match)?  $default,) {final _that = this;
switch (_that) {
case _TranslationResponseData() when $default != null:
return $default(_that.translatedText,_that.match);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslationResponseData implements TranslationResponseData {
  const _TranslationResponseData({required this.translatedText, this.match});
  factory _TranslationResponseData.fromJson(Map<String, dynamic> json) => _$TranslationResponseDataFromJson(json);

@override final  String translatedText;
@override final  double? match;

/// Create a copy of TranslationResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationResponseDataCopyWith<_TranslationResponseData> get copyWith => __$TranslationResponseDataCopyWithImpl<_TranslationResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslationResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationResponseData&&(identical(other.translatedText, translatedText) || other.translatedText == translatedText)&&(identical(other.match, match) || other.match == match));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,translatedText,match);

@override
String toString() {
  return 'TranslationResponseData(translatedText: $translatedText, match: $match)';
}


}

/// @nodoc
abstract mixin class _$TranslationResponseDataCopyWith<$Res> implements $TranslationResponseDataCopyWith<$Res> {
  factory _$TranslationResponseDataCopyWith(_TranslationResponseData value, $Res Function(_TranslationResponseData) _then) = __$TranslationResponseDataCopyWithImpl;
@override @useResult
$Res call({
 String translatedText, double? match
});




}
/// @nodoc
class __$TranslationResponseDataCopyWithImpl<$Res>
    implements _$TranslationResponseDataCopyWith<$Res> {
  __$TranslationResponseDataCopyWithImpl(this._self, this._then);

  final _TranslationResponseData _self;
  final $Res Function(_TranslationResponseData) _then;

/// Create a copy of TranslationResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? translatedText = null,Object? match = freezed,}) {
  return _then(_TranslationResponseData(
translatedText: null == translatedText ? _self.translatedText : translatedText // ignore: cast_nullable_to_non_nullable
as String,match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
