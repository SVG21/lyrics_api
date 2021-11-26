import 'package:clean_framework/clean_framework_providers.dart';

class LyricsEntity extends Entity {
  LyricsEntity(
      {this.isLoading = false,
      this.lyrics = ''});

  final bool isLoading;
  final String lyrics;

  @override
  List<Object?> get props => [isLoading, lyrics];

  LyricsEntity merge({
    bool? isLoading,
    String? lyrics,
  }) {
    return LyricsEntity(
      isLoading: isLoading ?? this.isLoading,
      lyrics: lyrics ?? this.lyrics,
    );
  }
}
