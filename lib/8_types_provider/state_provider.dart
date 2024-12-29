import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countStateProvider = StateProvider<int>((ref) => 0);

class StateProviderExample extends StatelessWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'You have pressed the button for ${ref.watch(countStateProvider)} times(s)'),
                FilledButton(
                  onPressed: () {
                    ref.read(countStateProvider.notifier).state =
                        ref.watch(countStateProvider) + 1;
                  },
                  child: const Text('Increase'),
                ),
                FilledButton(
                  onPressed: () {
                    ref.read(countStateProvider.notifier).state = 0;
                  },
                  child: const Text('Reset'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
