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
      body: _lazyLyricsWidget(
        isLoading: viewModel.isLoading,
        child: viewModel.lyrics.isEmpty?const Center(child: Text("Loading"),):Center(child: Text(viewModel.lyrics),)
      )
    );
  }
}

class _lazyLyricsWidget extends StatelessWidget{
  const _lazyLyricsWidget({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? const Center(
        child: CircularProgressIndicator()
      )
          : child,
    );

  }
}
