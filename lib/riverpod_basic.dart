import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider<String>((ref) {
  return 'Hello World';
});

final helloProvider = Provider<String>((ref) => 'hello');
final textProvider = Provider<String>((ref) {
  return 'text';
});

final countStateProvider = StateProvider<int>((ref) {
  return 0;
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp4(),
    ),
  );
}

//3 different ways to obtain ref

//....................................
//the 1st way is ConsumerWidget
//....................................

//..........extend ConsumerWidet
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  //add additional parameter WidgetRef
  Widget build(BuildContext context, WidgetRef ref) {
    //use ref.watch to get the value of a provider
    final helloWorldText = ref.watch(helloWorldProvider);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(helloWorldText),
        ),
      ),
    );
  }
}

//....................................
//the 2nd way is using Consumer
//....................................
class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          //use Consumer...
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, child) {
              final helloWorldText = ref.watch(helloProvider);
              return Text(helloWorldText);
            },
          ),
        ),
      ),
    );
  }
}

//.............................................
//the 3rd way is using ConsumerStatefulWidget
//.............................................

class MyApp3 extends ConsumerStatefulWidget {
  const MyApp3({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyApp3State();
}

class _MyApp3State extends ConsumerState<MyApp3> {
  @override
  void initState() {
    final helloWoldText = ref.read(helloWorldProvider);
    log(helloWoldText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            ref.watch(textProvider),
          ),
        ),
      ),
    );
  }
}

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (_, WidgetRef ref, __) {
                final count = ref.watch(countStateProvider);
                return Text('Count: $count');
              }),
              Consumer(builder: (_, WidgetRef ref, __) {
                return FilledButton(
                  onPressed: () {
                    ref.read(countStateProvider.notifier).state =
                        ref.read(countStateProvider.notifier).state + 3;
                  },
                  child: const Text('Change'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
