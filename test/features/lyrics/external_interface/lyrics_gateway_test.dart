import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_entity.dart';
import 'package:lyrics_example/providers.dart';

import '../domain/lyrics_use_case_test.dart';

void main() {
  group('LyricsGateway tests :: ', () {
    test('fetches lyrics successfully', () async {
      final useCase = lyricsUseCaseProvider.getUseCaseFromContext(
        providersContext,
      );
      final gateway = lyricsGatewayProvider.getGateway(providersContext);

      gateway.transport = (request) async {
        return Right(
          RestSuccessResponse(
            data: const {"lyrics": lyrics},
          ),
        );
      };

      await useCase.fetch();

      expect(
        useCase.entity,
        LyricsEntity(artist: artist, title: title, lyrics: lyrics),
      );
    });
  });
}
