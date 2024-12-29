import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class StateNotifierProviderExample2 extends StatelessWidget {
  const StateNotifierProviderExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (BuildContext context, WidgetRef ref, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pressed the button for ${ref.watch(counterProvider)} times(s)',
              ),
              FilledButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: const Text('Increase'),
              ),
              FilledButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decrement();
                },
                child: const Text('Decrease'),
              ),
              FilledButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).reset();
                },
                child: const Text('Reset'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
