import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';

import 'features/lyrics/presentation/lyrics_ui.dart';
import 'home_page.dart';

enum Routes {
  home,
lyricsUI
}

final router = AppRouter<Routes>(
  routes: [
    AppRoute(
      name: Routes.home,
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        AppRoute(
          name: Routes.lyricsUI,
          path: 'lyrics',
          builder: (context, state) => LyricsUI(),
        ),

      ],
    ),
  ],
  errorBuilder: (context, state) => Page404(error: state.error),
);

class Page404 extends StatelessWidget {
  const Page404({Key? key, required this.error}) : super(key: key);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error.toString()),
      ),
    );
  }
}
