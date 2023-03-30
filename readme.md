
# Riverpos Flutter

Examples of Flutter State Managment package **Riverpos** from simple to advance.


## what are riverpods

**Riverpod** is a state management library for Flutter applications that makes it easier to manage the state of your application with less boilerplate code. It's built on top of Provider, another popular state management library in Flutter. Riverpod provides more control and scalability in managing state, as well as better performance over time.

With Riverpod, you can define providers, which are objects that contain state or logic that can be accessed by other widgets in your application. Providers can be easily updated and consumed throughout your app using the `Consumer` widget or the `ProviderListener` widget. This allows you to manage state in a more organized way, making it easier to test and debug your app.

Unlike Provider, which relies on dependency injection using an `InheritedWidget`, Riverpod uses Dart’s built-in global key-value store, which is simpler to use and has better performance. Additionally, Riverpod offers a feature called "auto-dispose", which will automatically clean up unused providers after they have been inactive for some time, freeing up memory and improving performance.

Overall, Riverpod is a powerful and flexible state management solution that can help you build complex applications with ease.

## Provider Scope
when you create **providers** with riverpod you also need to have something called **provider scope**.

It is an object that will allow you to work with providers. it allows various providers to be available in your application.

Providers are global functions and flutter does’nt know about global functions.
For providers to work, you need to add `ProviderScope` at the root of your
 Flutter applications:

 ```dart
 void main() {
   runApp(ProviderScope(child: MyApp()));
 }
 ```

**Flutter Hooks** allows you to reuse the code in a concise way.

**Providers** are global functions they have inputs and outputs sometimes they have multiple inputs but only one input.

### Consumer Widget
these are the special kind of widgets that listens to providers so that if any changes happens it UI automaticaly updates when needed.

### ref parameter
it is a parameter we can do a lot using this parameter.

you can use this ref to even depend on other providers so for instance you have a provider that gives you the date and time every second and in another provider you can depend on that provider to make an API call.

it’s your window to application. because these global functions will don’t have access to other things you see because they are not dependent on other things inside your application.

```dart
final currentDate = Provider((ref) => DateTime.now());
```

in this **ref** is:

The `ref` parameter is an instance of `ProviderReference`, which is basically a reference to the provider itself along with some additional functionalities like reading from and modifying state, as well as accessing other providers.

By using the `ref` parameter, we can perform advanced operations like interacting with external APIs, accessing database, or even depending on other providers. This makes it easy to manage the application state and allows us to create modular, testable and scalable code in Flutter. Overall, the `ref` parameter serves as a gateway to managing the global state of our application.

### State Notifier
**State Notifier** is an object that is already is a `class` that is shipped with flutter so it’s nothing that a riverpod has provided to us so it’s not inside te riverpod library.

**state notifier** is a class that has state object and you can listen to changes that happen to the state of the State Notifier. because that state is like a kind of stream so you can add value to this and set the value of the state and read the value of the state in kind of like of stream.

[Riverpod Documentation](https://riverpod.dev/docs/getting_started)




## Examples

 - [First Exmple](https://github.com/hamzaawan007/riverpod_flutter/tree/main/flutter_riverpod_1)
 - [Second Example](https://github.com/hamzaawan007/riverpod_flutter/tree/main/flutter_riverpod_2)
 - [Third Example](https://github.com/hamzaawan007/riverpod_flutter/tree/main/flutter_riverpod_3)
 - [Fourth Example](https://github.com/hamzaawan007/riverpod_flutter/tree/main/flutter_riverpod_4)
 - [Fifth Example](https://github.com/hamzaawan007/riverpod_flutter/tree/main/flutter_riverpod_5)