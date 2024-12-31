# riverpod_practice

I am practicing Riverpod in this project with the 8 different types of providers in Riverpod:

1. **Provider**: A simple provider that exposes a value.
2. **StateProvider (Legacy)**: A provider that exposes a value and allows it to be modified.
3. **FutureProvider**: A provider that exposes a `Future` and rebuilds when the future completes.
4. **StreamProvider**: A provider that exposes a `Stream` and rebuilds when the stream emits new values.
5. **StateNotifierProvider (Legacy)**: A provider that uses a `StateNotifier` to expose state and allows it to be modified.
6. **ChangeNotifierProvider (Legacy)**: A provider that uses a `ChangeNotifier` to expose state and allows it to be modified.
7. **NotifierProvider (new in Riverpod 2.0)**: A provider that uses a `Notifier` to expose state and allows it to be modified.
8. **AsyncNotifierProvider (new in Riverpod 2.0)**: A provider that uses an `AsyncNotifier` to expose asynchronous state and allows it to be modified.

This project aims to demonstrate the usage and configuration of these providers in a Flutter application.

## Project Configuration

- **Flutter**: 3.27.1
- **Dart**: 3.6.0
- **Java**: 23.0.1
