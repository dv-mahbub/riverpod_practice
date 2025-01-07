import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/8_types_provider/change_notifier_provider/couter_notifier.dart';

final countChangeNotifierProvider =
    ChangeNotifierProvider<CouterNotifier>((ref) {
  return CouterNotifier();
});

class ChangeNotifierProviderExample extends StatelessWidget {
  const ChangeNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (__, ref, _) {
          final countProvider = ref.watch(countChangeNotifierProvider);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count: ${ref.watch(countChangeNotifierProvider).getCount}'),
              FilledButton(
                  onPressed: () {
                    ref.read(countChangeNotifierProvider).increment();
                  },
                  child: const Text('Increment')),
              FilledButton(
                  onPressed: () {
                    ref.read(countChangeNotifierProvider).decrement();
                  },
                  child: const Text('Decrement')),
            ],
          );
        }),
      ),
    );
  }
}
