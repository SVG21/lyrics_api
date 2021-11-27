
import 'package:flutter_test/flutter_test.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_entity.dart';
import 'package:lyrics_example/features/lyrics/domain/lyrics_use_cases.dart';
import 'package:lyrics_example/providers.dart';

const String artist = "adele";
const String title = "rolling in the deep";
const String lyrics = "Paroles de la chanson Rolling In The Deep par Adele "
"There's a fire starting in my heart "
"Reaching a fever pitch, and it's bringing me out the dark "
"Finally I can see you crystal clear "
"Go ahead and sell me out and I'll lay your sheet bare "
"See how I'll leave with every piece of you "
"Don't underestimate the things that I will do "
"There's a fire starting in my heart "
"Reaching a fever pitch "
"And it's bringing me out the dark "

"The scars of your love remind me of us "
"They keep me thinking that we almost had it all "
"The scars of your love, they leave me breathless "

"I can't help feeling "
"We could have had it all "
"Rolling in the deep "
"(Tears are gonna fall, rolling in the deep) "
"You had my heart inside of your hand "
"(You're gonna wish you never had met me) "
"And you played it to the beat "
"(Tears are gonna fall, rolling in the deep) "

"Baby, I have no story to be told "
"But I've heard one of you "
"And I'm gonna make your head burn "
"Think of me in the depths of your despair "
"Making a home down there "
"As mine sure won't be shared "

"The scars of your love remind me of us "
"They keep me thinking that we almost had it all "

"The scars of your love, they leave me breathless "
"I can't help feeling "
"We could have had it all "
"Rolling in the deep "
"(Tears are gonna fall, rolling in the deep) "
"You had my heart inside of your hand "
"(You're gonna wish you never had met me) "
"And you played it to the beat "
"(Tears are gonna fall, rolling in the deep) "
"We could have had it all "
"Rolling in the deep "
"You had my heart inside of your hand "
"And you played it to the beat "

"Throw your soul through every open door "
"Count your blessings to find what you look for "
"Turn my sorrow into treasured gold "
"You pay me back in kind and reap just what you sow "


"(You're gonna wish you never had met me) "
"We could have had it all "
"(Tears are gonna fall, rolling in the deep) "
"We could have had it all "
"(You're gonna wish you never had met me) "
"It all, it all, it all "
"(Tears are gonna fall, rolling in the deep) "

"We could have had it all "
"(You're gonna wish you never had met me) "
"Rolling in the deep "
"(Tears are gonna fall, rolling in the deep) "
"You had my heart inside of your hand "
"(You're gonna wish you never had met me) "
"And you played it to the beat "
"(Tears are gonna fall, rolling in the deep) "


"You could have had it all "
"(You're gonna wish you never had met me) "
"Rolling in the deep "
"(Tears are gonna fall, rolling in the deep) "
"You had my heart inside of your hand "
"(You're gonna wish you never had met me) "

"But you played it "
"You played it "
"You played it "
"You played it to the beat.";

void main() {
  LyricsUseCase getLyricsUseCase() {
    return lyricsUseCaseProvider.getUseCaseFromContext(
      providersContext,
    );
  }

  setUp(() {
    resetProvidersContext();
    restExternalInterface.getExternalInterface(providersContext);
  });

  group('LyricsUseCase tests :: ', () {
    test('fetches lyrics for default artist and title successfully', () async {
      final useCase = getLyricsUseCase();

      expect(
        useCase.entity,
        LyricsEntity(
          isLoading: false,
          artist:artist,
          title: title,
          lyrics: lyrics
        ),
      );

      expectLater(
        useCase.stream,
        emitsInOrder(
          [
            LyricsEntity(isLoading: true, artist: artist,title: title),
            isA<LyricsEntity>()
                .having((e) => e.isLoading, 'isLoading', isFalse).having((e) => e.artist,'artist',artist).having((e) =>e.title, title, title).having((e) => e.lyrics, "lyrics", lyrics)

          ],
        ),
      );

      await useCase.fetch();
      useCase.dispose();
    });
    test('fetches lyrics for specified artist and title successfully', () async {
      final useCase = getLyricsUseCase();

      expect(
        useCase.entity,
        LyricsEntity(
          isLoading: false,
    artist: artist,
          title: title,
          lyrics: lyrics
        ),
      );

      expectLater(
        useCase.stream,
        emitsInOrder(
          [
            LyricsEntity(isLoading: true, artist: artist,title: title),
            isA<LyricsEntity>()
                .having((e) => e.isLoading, 'isLoading', isFalse).having((e) => e.artist,'artist',artist).having((e) =>e.title, title, title).having((e) => e.lyrics, "lyrics", lyrics)

          ],
        ),
      );

      await useCase.fetch();
      useCase.dispose();
    });


  });
}
