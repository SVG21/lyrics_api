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
            ArtistInput:( LyricsEntity i){
              return ArtistInput(artist: i.artist);
            },
            TitleInput:( LyricsEntity i){
              return TitleInput(title: i.title);
            }
          },
        );

  void onCreate() {

    request(LyricsGatewayOutput(entity.artist, entity.title),
        onSuccess: (LyricsSuccessInput i) {
          return LyricsEntity(lyrics: i.lyrics);
        },
        onFailure: (_) => entity);
  }

  Future<void> fetch() async {
    entity = entity.merge(isLoading: true);

    return request<LyricsGatewayOutput, LyricsSuccessInput>(
      LyricsGatewayOutput(entity.artist, entity.title),
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
 final String artist;
 final String title;
  LyricsGatewayOutput(this.artist, this.title);

  @override
  List<Object?> get props => [artist, title];
}

class LyricsSuccessInput extends SuccessInput {
  final String lyrics;


  LyricsSuccessInput( {
    required this.lyrics,
  });

  factory LyricsSuccessInput.fromJson(Map<String, dynamic> json) {
    return LyricsSuccessInput(lyrics: json['lyrics']);
  }
}
