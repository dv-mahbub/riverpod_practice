import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/8_types_provider/2.0/listen2.dart';

final countNotifierProvider = StateProvider<int>((ref) => 0);

class ListenExample extends ConsumerWidget {
  const ListenExample({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (__, ref, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count: ${ref.watch(countNotifierProvider)}'),
              FilledButton(
                onPressed: () {
                  ref.read(countNotifierProvider.notifier).state++;
                },
                child: const Text('Increment'),
              ),
              FilledButton(
                onPressed: () {
                  ref.read(countNotifierProvider.notifier).state--;
                },
                child: const Text('Decrement'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Listen2()),
                  );
                },
                child: const Text('Go to 2nd Page'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
