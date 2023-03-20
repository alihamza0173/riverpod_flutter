import 'package:flutter/material.dart';
import 'package:flutter_riverpod_5/riverpod/global_riverpods.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'Model/film.dart';

class FilmsWidget extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmsWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);
    return Expanded(
      child: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films.elementAt(index);
          final favouriteIcon = film.isFavourite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border);
          return ListTile(
              title: Text(film.title),
              subtitle: Text(film.description),
              trailing: IconButton(
                icon: favouriteIcon,
                onPressed: () {
                  final isFarourite = !film.isFavourite;
                  ref
                      .read(allFilmsProvider.notifier)
                      .updateFilm(film, isFarourite);
                },
              ));
        },
      ),
    );
  }
}
