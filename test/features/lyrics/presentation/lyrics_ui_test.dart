import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_tests.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyrics_example/features/lyrics/presentation/lyrics_ui.dart';
import 'package:lyrics_example/providers.dart';

import '../domain/lyrics_use_case_test.dart';

void main() {
  final gateway = lyricsGatewayProvider.getGateway(providersContext);

  gateway.transport = (request) async {
    return Right(
      RestSuccessResponse(
        data: const {"lyrics": lyrics},
      ),
    );
  };

  group('LyricsUI tests :: ', () {
    uiTest(
      'lyrics for default artist and title',
      context: providersContext,
      builder: () => LyricsUI(),
      verify: (tester) async {
        final textFinder = find.byType(Text);

        expect(textFinder, findsOneWidget);

        final lyricsTextFinder = textFinder.first;

        expect(
          find.descendant(of: lyricsTextFinder, matching: find.text(lyrics)),
          findsOneWidget,
        );


      },
    );
  });
}
