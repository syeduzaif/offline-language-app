// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslationDto _$TranslationDtoFromJson(Map<String, dynamic> json) =>
    _TranslationDto(
      responseData: TranslationResponseData.fromJson(
        json['responseData'] as Map<String, dynamic>,
      ),
      responseStatus: (json['responseStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TranslationDtoToJson(_TranslationDto instance) =>
    <String, dynamic>{
      'responseData': instance.responseData,
      'responseStatus': instance.responseStatus,
    };

_TranslationResponseData _$TranslationResponseDataFromJson(
  Map<String, dynamic> json,
) => _TranslationResponseData(
  translatedText: json['translatedText'] as String,
  match: (json['match'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TranslationResponseDataToJson(
  _TranslationResponseData instance,
) => <String, dynamic>{
  'translatedText': instance.translatedText,
  'match': instance.match,
};
