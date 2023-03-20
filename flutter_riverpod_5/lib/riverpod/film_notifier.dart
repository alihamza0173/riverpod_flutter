import 'package:flutter_riverpod_5/Model/film.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final filmList = [
  Film(
    id: '1',
    title: 'The Lion King',
    description: 'The Lion King is a 1994 American animated musical '
        'comedy-drama film produced by Walt Disney Feature Animation '
        'and released by Walt Disney Pictures. ',
    isFavourite: false,
  ),
  Film(
    id: '2',
    title: 'Titanic',
    description: 'Titanic is a 1997 American epic romance and disaster film '
        'directed, written, co-produced and co-edited by James Cameron. ',
    isFavourite: false,
  ),
  Film(
    id: '3',
    title: 'Inception',
    description: 'Inception is a 2010 science fiction action film written, '
        'directed, and produced by Christopher Nolan, who also served as '
        'executive producer. ',
    isFavourite: false,
  ),
  Film(
    id: '4',
    title: 'The Matrix',
    description: 'The Matrix is a 1999 science fiction action film written '
        'and directed by The Wachowskis. It stars Keanu Reeves, Laurence Fishburne, '
        'Carrie-Anne Moss, Hugo Weaving, and Joe Pantoliano. ',
    isFavourite: false,
  ),
  Film(
    id: '5',
    title: 'Star Wars: The Rise of Skywalker',
    description: 'Star Wars: The Rise of Skywalker is a 2019 American epic space-opera'
        'film produced, co-written, directed by J. J. Abrams. It is the third installment of',
    isFavourite: false,
  ),
  Film(
    id: '6',
    title: 'Avengers: Endgame',
    description: 'Avengers: Endgame is a 2019 American superhero film based on the '
        'Marvel Comics superhero team the Avengers, produced by Marvel Studios and '
        'distributed by Walt Disney Studios Motion Pictures. It is the direct sequel '
        'to Avengers: Infinity War',
    isFavourite: false,
  ),
  Film(
    id: '7',
    title: 'Lion King',
    description: 'A classic story of a lion cub whose uncle kills',
    isFavourite: false,
  ),
  Film(
    id: '8',
    title: 'Snow White',
    description: 'A young princess must be saved by a prince',
    isFavourite: false,
  ),
  Film(
    id: '9',
    title: 'The Little Mermaid',
    description: 'A mermaid must make a bargain to get legs',
    isFavourite: false,
  ),
  Film(
    id: '10',
    title: 'Cinderella',
    description: 'A poor girl dreams of attending a grand ball',
    isFavourite: false,
  ),
  Film(
    id: '11',
    title: 'Beauty and the Beast',
    description: 'A beast is transformed by a woman\'s love',
    isFavourite: false,
  ),
  Film(
    id: '12',
    title: 'The Jungle Book',
    description: 'A boy is raised by wolves in the jungle',
    isFavourite: false,
  ),
  Film(
    id: '13',
    title: 'Aladdin',
    description: 'A thief discovers a magical lamp in a cave',
    isFavourite: false,
  ),
  Film(
    id: '14',
    title: 'Mulan',
    description: 'A woman disguises herself as a man to fight in war',
    isFavourite: false,
  ),
  Film(
    id: '15',
    title: 'The Princess and the Frog',
    description: 'A frog helps a waitress become a princess',
    isFavourite: false,
  ),
  Film(
    id: '16',
    title: 'Frozen',
    description: 'Two sisters realize the power of sisterly love',
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