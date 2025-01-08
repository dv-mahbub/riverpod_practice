import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/8_types_provider/2.0/listen.dart';

class Listen2 extends ConsumerWidget {
  const Listen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${ref.watch(countNotifierProvider)}'),
            FilledButton(
              onPressed: () {
                ref.read(countNotifierProvider.notifier).state++;
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
