import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countNotifierProvider = StateProvider<int>((ref) => 0);

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(countNotifierProvider, (previous, current) {
      if (current == 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The count is: $current'),
          ),
        );
      }
    });

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
            ],
          );
        }),
      ),
    );
  }
}
