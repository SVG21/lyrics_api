import 'package:clean_framework/clean_framework_defaults.dart'
    hide FeatureState;
import 'package:lyrics_example/features.dart';

import 'package:lyrics_example/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:lyrics_example/providers.dart';

void main() {
  test('main', () {
    expect(() => app.main(), throwsAssertionError);
  });
  test('Load providers', () {
    loadProviders();

  });
  testWidgets('Main app', (tester) async {
    await tester.pumpWidget(
      app.ExampleApp(),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    // Uncomment this to see the widget tree on the console
    // debugDumpApp();

    expect(find.byType(app.ExampleApp), findsOneWidget);

    final featuresMap =
    providersContext().read(featureStatesProvider.featuresMap);

    expect(featuresMap.defaultState, isA<FeatureState>());
    expect(featuresMap.getStateFor(lyricsFeature), FeatureState.active);
  });
}
