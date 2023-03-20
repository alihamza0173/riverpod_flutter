import 'package:flutter_riverpod_5/Model/film.dart';
import 'package:flutter_riverpod_5/riverpod/film_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum FavouriteStatus { all, favourite, notFavourite }

final favouriteStatusProvider =
    StateProvider<FavouriteStatus>((ref) => FavouriteStatus.all);

final allFilmsProvider = StateNotifierProvider<FilmNotifier, List<Film>>((ref) {
  return FilmNotifier();
});

final favouriteFilmsProvider = Provider((ref) {
  final films = ref.watch(allFilmsProvider);
  return films.where((film) => film.isFavourite);
});

final notFavouriteFilmsProvider = Provider((ref) {
  final films = ref.watch(allFilmsProvider);
  return films.where((film) => !film.isFavourite);
});
