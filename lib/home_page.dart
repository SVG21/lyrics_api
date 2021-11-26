import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import 'package:lyrics_example/features/lyrics/domain/lyrics_view_model.dart';

import 'features/lyrics/presentation/lyrics_presenter.dart';

class HomePage extends UI<LyricsViewModel> {

  @override
  Presenter create(builder) => LyricsPresenter(builder: builder);

  @override
  Widget build(BuildContext context, LyricsViewModel lyricsViewModel) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Type Song'),
        ),
        body: _LazyLyricsWidget(
          isLoading: lyricsViewModel.isLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                  child: RaisedButton(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    onPressed: () {
                      lyricsViewModel.artist("bruno mars");
                      lyricsViewModel.title("lazy song");
                      lyricsViewModel.fetch;
                    }



                     ,
                    child: const Text("Search"),
                  ),
                ),
                lyricsViewModel.lyrics.isEmpty
                    ? const Text("Loading")
                    : Text(lyricsViewModel.lyrics)
              ],
            ),
          ),
        ));
  }
}

class _LazyLyricsWidget extends StatelessWidget {
  const _LazyLyricsWidget({
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
          ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 1),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Loading',
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            )
          : child,
    );
  }
}
// Column(
// children: [
// TextFormField(
// controller: artistController,
// textAlign: TextAlign.start,
// decoration: InputDecoration(
// hintText: "Enter artist",
//
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5.0),
// borderSide: const BorderSide(
// color: Colors.black,
// width: 5,
// ),
// ),
// //fillColor: Colors.green
// ),
// ),
// const SizedBox(
// height: 10,
// ),
// TextFormField(
// controller: titleController,
// textAlign: TextAlign.start,
// decoration: InputDecoration(
// hintText: "Enter title of song",
//
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5.0),
// borderSide: const BorderSide(
// color: Colors.black,
// width: 5,
// ),
// ),
// //fillColor: Colors.green
// ),
// ),
// const SizedBox(
// height: 10,
// ),
// SizedBox(
// width: 100,
// height: 20,
// child: RaisedButton(
// elevation: 0.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(6),
// ),
// onPressed: () => router.to(Routes.lyricsUI),
// child: const Text("Search"),
// ),
// )
// ],
// )
