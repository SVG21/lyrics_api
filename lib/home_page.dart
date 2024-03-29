import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import 'package:lyrics_example/features/lyrics/domain/lyrics_view_model.dart';
import 'package:lyrics_example/routes.dart';

import 'features/lyrics/presentation/lyrics_presenter.dart';

class HomePage extends UI<LyricsViewModel> {
  @override
  Presenter create(builder) => LyricsPresenter(builder: builder);

  @override
  Widget build(BuildContext context, LyricsViewModel lyricsViewModel) {
    TextEditingController artistController = TextEditingController();
    TextEditingController titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Type Song'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: artistController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "Enter artist",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),

              ),
            ),
            TextFormField(
              controller: titleController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "Enter title",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),

              ),
            ),
            RaisedButton(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              onPressed: () {
                lyricsViewModel.artist(artistController.value.text.trim());
                lyricsViewModel.title(titleController.value.text.trim());
                lyricsViewModel.fetch;
                router.to(Routes.lyricsUI);
              },
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}


