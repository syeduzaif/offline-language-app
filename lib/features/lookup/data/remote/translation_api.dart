import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_config.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/services/connectivity_service.dart';
import 'dto/translation_dto.dart';

class TranslationApi extends ApiService {
  TranslationApi(super.client, super.connectivity)
      : super(host: ApiHosts.translation, name: 'TranslationApi');

  Future<TranslationDto> translate({
    required String text,
    required String targetLangCode,
  }) {
    return getJson(
      TranslationEndpoints.translate,
      query: {'q': text, 'langpair': 'en|$targetLangCode'},
      fromJson: TranslationDto.fromJson,
    );
  }
}

final translationApiProvider = Provider<TranslationApi>((ref) {
  return TranslationApi(
    ref.watch(apiClientProvider),
    ref.watch(connectivityServiceProvider),
  );
});
