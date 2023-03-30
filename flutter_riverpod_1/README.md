# flutter_riverpods exapmel 1

In This example we have used two types of Providers, **Simple Providers** and **StateNotifierProviders**

 ## What is a provider

 Providers are the most important components of `Riverpod`. In short, you can think
 of providers as an access point to a **shared state**.

 Providers solve the following problems:

 - Providers have the flexibility of global variables, without their downsides.\
   Providers can be accessed from anywhere, while ensuring testability and scalability.

 - Providers are safe to use.\
   As opposed to most service-locator solutions, using a provider, it is not
   possible to read a value in an uninitialized state.\
   If we can write the code to read a state, the code will execute properly.
   Even if the state is loaded asynchronously.

 - Providers allow easily and efficiently listening to a piece of state.\
   They can be accessed in a single line of code, and offer many ways to optimize
   your application.

 ## Creating a provider

 Providers come in many variants, but they all work the same way.

 The most common usage is to declare them as global variables like so:

 ```dart
 final myProvider = Provider((ref) {
   return MyValue();
 });
 ```
 This snippet consist of three components:

 - `final myProvider`, the declaration of a variable.\
   This variable is what we will use in the future to read the state of our provider.
   It should always be immutable.

 - `Provider`, the provider that we decided to use.\
   **Provider** is the most basic of all providers. *It exposes an object that never changes*.\
   We could replace [Provider] with other providers like [StreamProvider] or
   [StateNotifierProvider], to change how the value is interacted with.

 - A function that creates the shared state.\
   That function will always receive an object called `ref` as a parameter. This object
   allows us to read other providers or to perform some operations when the state
   of our provider will be destroyed.

 The type of the object created by the function passed to a provider depends on
 the provider used.\
 For example, the function of a [Provider] can create any object.
 On the other hand, [StreamProvider]'s callback will be expected to return a [Stream].

 **NOTE**:
 You can declare as many providers as you want, without limitations.\
 As opposed to when using `package:provider`, in `Riverpod` we can have two
 providers expose a state of the same "type":

 ```dart
 final cityProvider = Provider((ref) => 'London');
 final countryProvider = Provider((ref) => 'England');
 ```

 The fact that both providers create a `String` does not cause conflicts.
 We will be able to read both values independently from each other without issue.

 **WARNING**
 For providers to work, you need to add `ProviderScope` at the root of your
 Flutter applications:

 ```dart
 void main() {
   runApp(ProviderScope(child: MyApp()));
 }
 ```

## Getting Started

In this example **first** we have created a simple provider.

```dart
//it is simple provider which is returning the object of DateTime
final Provider<DateTime> currentDate = Provider((ref) => DateTime.now());

//then we can listen the to the provider by the below code and use it in anywhere
DateTime date = ref.watch(currentDate);

```

Then the **Second** Provider

```dart
//first we will create a class that extends StateNotifier
// State Notifier is An observable class that stores a single immutable [state].

class Counter extends StateNotifier<int?> {
  Counter() : super(null);

  void increment() => state = state == null ? 1 : state! + 1;
  int? get value => state;
}

```

##### StateNotifier
State Notifier is An observable class that stores a single immutable [state].

 By using immutable state, it becomes a lot simpler to:
 - compare previous and new state
 - implement undo-redo mechanism
 - debug the application state

```dart
// we will create a StateNofifier provider
final StateNotifierProvider<Counter, int?> counterProvider =
    StateNotifierProvider<Counter, int?>((ref) => Counter());

```

##### StatNotifierProvider
Creates a [StateNotifier] and exposes its current state.

Combined with [StateNotifier], [StateNotifierProvider] can be used to manipulate advanced states, that would otherwise be difficult to represent with simpler providers such as [Provider] or [FutureProvider].

```dart
//this will give the int type of value
  final count = ref.watch(counterProvider);
//and this will give the acces to class Counter
//which extends with state notifier so that we can
//have access to all available methods
   final ref = ref.read(counterProvider.notifier);

```