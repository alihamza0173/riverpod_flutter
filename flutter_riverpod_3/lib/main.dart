import 'package:flutter/material.dart';
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

const names = [
  "Sneezy",
  "Sleepy",
  "Dopey",
  "Doc",
  "Happy",
  "Bashful",
  "Grumpy",
];

final StreamProvider<int> tickerProvider = StreamProvider(
  (ref) => Stream.periodic(const Duration(seconds: 1), (i) => i + 1),
);

final namesProvider = StreamProvider(
  (ref) => ref
      .watch(tickerProvider.future)
      .then((count) => names.getRange(0, count))
      .asStream(),
);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: names.when(
          data: (names) {
            return ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  names.elementAt(index),
                ),
              ),
            );
          },
          error: (error, stackTrace) =>
              const Text('Reached at the end of List!'),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
