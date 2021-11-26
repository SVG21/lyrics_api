import 'package:clean_framework/clean_framework_providers.dart';

import 'package:flutter/material.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_view_model.dart';
import 'package:lyrics_example/features/lyrics/presentation/lyrics_presenter.dart';

class LyricsUI extends UI<LyricsViewModel> {
  @override
  Presenter create(builder) => LyricsPresenter(builder: builder);

  @override
  Widget build(BuildContext context, LyricsViewModel viewModel) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lyrics'),
      ),
      body: Center(
        child: Text(viewModel.lyrics,style: const TextStyle(color: Colors.black),),
      ),
    );
  }
}
