import 'package:clean_framework/clean_framework_providers.dart';

class LyricsEntity extends Entity {
  LyricsEntity(
      {this.isLoading = false,
        this.artist = '',
        this.title = '',
      this.lyrics = ''});

  final bool isLoading;
  final String artist;
  final String title;
  final String lyrics;

  @override
  List<Object?> get props => [isLoading, artist, title, lyrics];

  LyricsEntity merge({
    bool? isLoading,
    String? lyrics, String? artist,
    String?title
  }) {
    return LyricsEntity(
      isLoading: isLoading ?? this.isLoading,
      lyrics: lyrics ?? this.lyrics,
      artist: artist??this.artist,
      title: title??this.title
    );
  }
}
