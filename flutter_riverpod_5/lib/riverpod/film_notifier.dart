import 'package:flutter_riverpod_5/Model/film.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<Film> filmList = [
  Film(
    id: "1",
    title: "Star Wars: Episode IV - A New Hope",
    description:
        "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a wookiee and two droids to save the galaxy from the Empire's world-destroying battle-station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.",
    isFavourite: false,
  ),
  Film(
    id: "2",
    title: "The Matrix",
    description:
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
    isFavourite: false,
  ),
  Film(
    id: "3",
    title: "Forrest Gump",
    description:
        "The presidencies of Kennedy and Johnson, Vietnam, Watergate and other history unfold through the perspective of an Alabama man with an IQ of 75.",
    isFavourite: false,
  ),
];

class FilmNotifier extends StateNotifier<List<Film>> {
  FilmNotifier() : super(filmList);

  void updateFilm(Film film, bool isFavourite) {
    state = state
        .map((thisFilm) => thisFilm.id == film.id
            ? thisFilm.copyWith(isFavourite: isFavourite)
            : thisFilm)
        .toList();
  }
}