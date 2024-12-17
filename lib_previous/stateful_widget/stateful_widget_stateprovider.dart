import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class StatefulWidgetStateProvider extends ConsumerStatefulWidget {
  const StatefulWidgetStateProvider({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulWidgetStateProvider> createState() =>
      _StatefulWidgetStateProviderState();
}

class _StatefulWidgetStateProviderState
    extends ConsumerState<StatefulWidgetStateProvider> {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print(ref.read(number));
    }
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(number);

    ref.listen(number, (previous, next) {
      if (next == 5) {
        if (kDebugMode) {
          print('This is number $next');
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('4. Stateful Widget - StateProvider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pressed the button for $count time(s)'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //ref.watch(number.notifier).state++;
                ref.watch(number.notifier).update((state) => state + 1);
              },
              child: const Text(' + '),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(number);
                //ref.refresh(number);
              },
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
