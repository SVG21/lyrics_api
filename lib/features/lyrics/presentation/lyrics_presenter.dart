import 'package:clean_framework/clean_framework_providers.dart';

import 'package:flutter/material.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_use_cases.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_view_model.dart';
import 'package:lyrics_example/providers.dart';

class LyricsPresenter
    extends Presenter<LyricsViewModel, LyricsUIOutput, LyricsUseCase> {
  LyricsPresenter({required PresenterBuilder<LyricsViewModel> builder})
      : super(
          builder: builder,
          provider: lyricsUseCaseProvider,
        );

  @override
  void onLayoutReady(BuildContext context, LyricsUseCase useCase) {
    useCase.fetch();
  }

  @override
  LyricsViewModel createViewModel(
          LyricsUseCase useCase, LyricsUIOutput output) =>
      LyricsViewModel(
          isLoading: output.isLoading,
          lyrics: output.lyrics,
          artist: (artist) => _artist(useCase, artist),
          title: (title) => _title(useCase, title),
          fetch: useCase.fetch,

      );


  void _artist(LyricsUseCase useCase, String artist) {
    useCase.setInput(ArtistInput(artist: artist));
  }

  void _title(LyricsUseCase useCase, String title) {
    useCase.setInput(TitleInput(title: title));
  }
}
