import 'package:flutter/material.dart';
import 'package:flutter_riverpod_5/film_list_widget.dart';
import 'package:flutter_riverpod_5/riverpod/global_riverpods.dart';
import 'package:flutter_riverpod_5/widgets/filter_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Films'),
        ),
        body: Column(
          children: [
            const FilterWidget(),
            Consumer(
              builder: (context, ref, child) {
                final favouriteStatus = ref.watch(favouriteStatusProvider);
                switch (favouriteStatus) {
                  case FavouriteStatus.all:
                    return FilmsWidget(provider: allFilmsProvider);

                  case FavouriteStatus.favourite:
                    return FilmsWidget(provider: favouriteFilmsProvider);

                  case FavouriteStatus.notFavourite:
                    return FilmsWidget(provider: notFavouriteFilmsProvider);
                }
              },
            )
          ],
        ));
  }
}
