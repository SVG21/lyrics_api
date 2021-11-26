import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class LyricsViewModel extends ViewModel {
  LyricsViewModel({
    required this.isLoading,
required this.artist,
    required this.title,
    required this.lyrics,
    required this.fetch,

  });

  final bool isLoading;

  final String lyrics;
  final ValueChanged<String> artist;
  final ValueChanged<String> title;

  final Future<void> Function() fetch;

  @override
  List<Object?> get props => [isLoading, lyrics];
}

class ArtistInput extends Input{
  final String artist;


  ArtistInput({required this.artist});
}
class TitleInput extends Input{
  final String title;

  TitleInput({required this.title});
}
