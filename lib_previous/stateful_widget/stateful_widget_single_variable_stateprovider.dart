import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class StatefulWidgetSingleVariableStateProvider extends ConsumerStatefulWidget {
  const StatefulWidgetSingleVariableStateProvider({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulWidgetSingleVariableStateProvider> createState() =>
      _StatefulWidgetSingleVariableStateProviderState();
}

class _StatefulWidgetSingleVariableStateProviderState
    extends ConsumerState<StatefulWidgetSingleVariableStateProvider> {
  // ignore: prefer_typing_uninitialized_variables
  var count;

  @override
  void initState() {
    super.initState();
    count = ref.read(number);
    if (kDebugMode) {
      print(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    count = ref.watch(number);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget - Single Variable - StateProvider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pressed this button for $count time(s)'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.watch(number.notifier).update((state) => state + 1);
                //ref.read(number.notifier).state+1;
              },
              child: const Text(' + '),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              //refresh
              onPressed: () {
                //ref.invalidate(number);

                // ignore: unused_result
                ref.refresh(number);
              },
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
