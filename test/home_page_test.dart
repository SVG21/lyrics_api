import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyrics_example/features/lyrics/presentation/lyrics_ui.dart';
import 'package:lyrics_example/home_page.dart';
import 'package:lyrics_example/providers.dart';
import 'package:lyrics_example/routes.dart';

void main() {
  tearDown(() {
    router.reset();
  });
  group('HomePage tests | ', () {
    testWidgets(
      'correct UI',
          (tester) async {
        await tester.pumpWidget(buildWidget(HomePage()));

        final appBarFinder = find.byType(AppBar);
        expect(
          find.descendant(
            of: appBarFinder,
            matching: find.text('Type Song'),
          ),
          findsOneWidget,
        );

        final textFormFieldFinder = find.byType(TextFormField);
        expect(textFormFieldFinder, findsNWidgets(2));

        expect(
          find.descendant(
            of: textFormFieldFinder.at(0),
            matching: find.text('Enter artist'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: textFormFieldFinder.at(1),
            matching: find.text('Enter title'),
          ),
          findsOneWidget,
        );
        
        final raisedButtonFinder = find.byType(RaisedButton);
        expect(raisedButtonFinder,findsOneWidget);
        
        expect(
          find.descendant(of: raisedButtonFinder, matching: find.text("Search")),
          findsOneWidget
        );

      },
    );

    testWidgets(
      'tap on Search button should redirect to LyricsUI',
          (tester) async {
        await tester.pumpWidget(buildWidget(LyricsUI()));

        final searchButtonFinder = find.text('Search');
        expect(searchButtonFinder, findsOneWidget);

        await tester.tap(searchButtonFinder);
        await tester.pumpAndSettle();

        expect(find.byType(LyricsUI), findsOneWidget);
      },
    );




  });
}

Widget buildWidget(Widget widget) {
  return AppProvidersContainer(
    providersContext: providersContext,
    onBuild: (_, __) {},
    child: MaterialApp.router(
      routeInformationParser: router.informationParser,
      routerDelegate: router.delegate,
    ),
  );
}


