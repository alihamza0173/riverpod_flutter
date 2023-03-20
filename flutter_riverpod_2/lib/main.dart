import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

enum Cities {
  stolkhom,
  paris,
  tokyo,
}

Future<String> getCityWeather(Cities city) async {
  await Future.delayed(const Duration(seconds: 1));
  return {
        Cities.stolkhom: '❄️',
        Cities.paris: '🌧️',
        Cities.tokyo: '⛈️',
      }[city] ??
      'Unknown';
}

//UI writes to this and reads from it
final StateProvider<Cities?> currentCityProvider = StateProvider<Cities?>((ref) => null);

//UI reads this
final FutureProvider<String> weatherProvider = FutureProvider<String>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getCityWeather(city);
  } else {
    return '??';
  }
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          currentWeather.when(
            data: (data) {
              return Text(
                data,
                style: Theme.of(context).textTheme.displaySmall,
              );
            },
            error: (error, stackTrace) => const Text('Error'),
            loading: () => const Center(child: CupertinoActivityIndicator()),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: Cities.values.length,
            itemBuilder: (context, index) {
              final city = Cities.values[index];
              final isSelected = city == ref.watch(currentCityProvider);
              return ListTile(
                title: Text(city.toString()),
                trailing: isSelected ? const Icon(Icons.check) : null,
                onTap: () =>
                    ref.read(currentCityProvider.notifier).state = city,
              );
            },
          ))
        ],
      ),
    );
  }
}
