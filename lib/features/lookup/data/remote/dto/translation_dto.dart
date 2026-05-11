import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_dto.freezed.dart';
part 'translation_dto.g.dart';

@freezed
abstract class TranslationDto with _$TranslationDto {
  const factory TranslationDto({
    required TranslationResponseData responseData,
    int? responseStatus,
  }) = _TranslationDto;

  factory TranslationDto.fromJson(Map<String, dynamic> json) =>
      _$TranslationDtoFromJson(json);
}

@freezed
abstract class TranslationResponseData with _$TranslationResponseData {
  const factory TranslationResponseData({
    required String translatedText,
    double? match,
  }) = _TranslationResponseData;

  factory TranslationResponseData.fromJson(Map<String, dynamic> json) =>
      _$TranslationResponseDataFromJson(json);
}
