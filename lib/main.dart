import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import 'package:lyrics_example/providers.dart';
import 'package:lyrics_example/routes.dart';

void main() {
  loadProviders();
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppProvidersContainer(
      providersContext: providersContext,
      onBuild: (context, _) {
        providersContext().read(featureStatesProvider.featuresMap).load({
          'features': [
            {'name': 'lyrics', 'state': 'ACTIVE'},
          ]
        });
      },
      child: MaterialApp.router(
        routeInformationParser: router.informationParser,
        routerDelegate: router.delegate,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}