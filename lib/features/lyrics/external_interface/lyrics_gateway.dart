import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';


import 'package:lyrics_example/features/lyrics/domain/lyrics_use_cases.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_view_model.dart';

import '../../../providers.dart';


class LyricsGateway extends RestGateway<LyricsGatewayOutput,
    LyricsRequest, LyricsSuccessInput> {
  LyricsGateway()
      : super(
    context: providersContext,
    provider: lyricsUseCaseProvider,
  );

  @override
  LyricsRequest buildRequest(LyricsGatewayOutput output) {
    return LyricsRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: 'test');
  }

  @override
  LyricsSuccessInput onSuccess(RestSuccessResponse response) {
    return LyricsSuccessInput.fromJson(response.data);
  }
}

class LyricsRequest extends GetRestRequest {


  @override
  String get path => '/tool/rosetta stoned';


}

