import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart'
    hide FeatureState;
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

import 'features.dart';
import 'features/lyrics/domain/lyrics_entity.dart';
import 'features/lyrics/domain/lyrics_use_cases.dart';
import 'features/lyrics/external_interface/lyrics_gateway.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

@visibleForTesting
void resetProvidersContext([ProvidersContext? context]) {
  _providersContext = context ?? ProvidersContext();
}

final featureStatesProvider =
    FeatureStateProvider<FeatureState, ExampleFeatureMapper>(
  (_) => ExampleFeatureMapper(),
);

final lyricsUseCaseProvider = UseCaseProvider<LyricsEntity, LyricsUseCase>(
  (_) => LyricsUseCase(),
);

final lyricsGatewayProvider = GatewayProvider<LyricsGateway>(
  (_) => LyricsGateway(),
);

final restExternalInterface = ExternalInterfaceProvider(
  (_) => RestExternalInterface(
    baseUrl: 'https://api.lyrics.ovh/v1',
    gatewayConnections: [
      () => lyricsGatewayProvider.getGateway(providersContext),
    ],
  ),
);

void loadProviders() {
  lyricsUseCaseProvider.getUseCaseFromContext(providersContext);
  lyricsGatewayProvider.getGateway(providersContext);

  restExternalInterface.getExternalInterface(providersContext);
}
