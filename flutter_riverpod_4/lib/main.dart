import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

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

class Person {
  final String name;
  final int age;
  final String uuid;

  Person({required this.name, required this.age, String? uuid})
      : uuid = uuid ?? const Uuid().v4();

  Person updated({String? name, int? age}) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      uuid: uuid,
    );
  }

  String get getDisplayName => '$name ($age years old)';
}

class DataModel extends ChangeNotifier {
  final List<Person> _people = [];

  int get count => _people.length;

  List get person => _people;

  void addPerson(Person person) {
    _people.add(person);
    notifyListeners();
  }

  void removePerson(Person person) {
    _people.remove(person);
    notifyListeners();
  }

  void updatePerson(Person updatePerson) {
    final index = _people.indexOf(updatePerson);
    _people[index] = updatePerson;
    notifyListeners();
  }
}

final dataModelProvider = ChangeNotifierProvider((ref) => DataModel());

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod 4'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final dataModel = ref.watch(dataModelProvider);
        return ListView.builder(
          itemCount: dataModel.count,
          itemBuilder: (context, index) {
            final person = dataModel.person[index];
            return ListTile(
              title: Text(person.getDisplayName),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  dataModel.removePerson(person);
                },
              ),
              onTap: () async {
                final newPerson = await createOrUpdatePerson(context, person);
                if (newPerson != null) {
                  dataModel.updatePerson(newPerson);
                }
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async{
        final person = await createOrUpdatePerson(context);
        if(person != null) ref.read(dataModelProvider).addPerson(person);
      }),
    );
  }
}

final nameController = TextEditingController();
final ageController = TextEditingController();

Future<Person?> createOrUpdatePerson(BuildContext context, [Person? person]) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(person == null ? 'Create Person' : 'Update Person'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = nameController.text;
              final age = int.parse(ageController.text);
              final newPerson = person?.updated(name: name, age: age) ??
                  Person(name: name, age: age);
              Navigator.of(context).pop(newPerson);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
