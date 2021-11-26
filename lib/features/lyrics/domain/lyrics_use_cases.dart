import 'package:clean_framework/clean_framework_providers.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_entity.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_view_model.dart';
import 'package:lyrics_example/features/lyrics/external_interface/lyrics_gateway.dart';

class LyricsUseCase extends UseCase<LyricsEntity> {
  LyricsUseCase()
      : super(
          entity: LyricsEntity(),
          outputFilters: {
            LyricsUIOutput: (LyricsEntity e) {
              return LyricsUIOutput(isLoading: e.isLoading, lyrics: e.lyrics);
            },
          },
          inputFilters: {
          },
        );

  void onCreate() {
    request(LyricsGatewayOutput(),
        onSuccess: (LyricsSuccessInput i) {
          return LyricsEntity(lyrics: i.lyrics);
        },
        onFailure: (_) => entity);
  }

  Future<void> fetch() async {
    entity = entity.merge(isLoading: true);

    return request<LyricsGatewayOutput, LyricsSuccessInput>(
      LyricsGatewayOutput(),
      onSuccess: (successInput) => entity.merge(
        isLoading: false,
        lyrics: successInput.lyrics,
      ),
      onFailure: (failure) => entity.merge(isLoading: false),
    );
  }
}

class LyricsUIOutput extends Output {
  LyricsUIOutput({
    required this.isLoading,
    required this.lyrics,
  });

  final bool isLoading;

  final String lyrics;

  @override
  List<Object?> get props => [isLoading, lyrics];
}

class LyricsGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class LyricsSuccessInput extends SuccessInput {
  final String lyrics;

  LyricsSuccessInput({
    required this.lyrics,
  });

  factory LyricsSuccessInput.fromJson(Map<String, dynamic> json) {
    return LyricsSuccessInput(lyrics: json['lyrics']);
  }
}
