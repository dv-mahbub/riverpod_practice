import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Clock extends StateNotifier<DateTime> {
  Clock() : super(DateTime.now()) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
  }
  late Timer timer;
  get time => state;
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

class StateNotifierProviderExample extends StatelessWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, child) {
                    final clock = ref.watch(clockProvider);
                    return Text(
                      '${clock.hour}:${clock.minute}:${clock.second}',
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
