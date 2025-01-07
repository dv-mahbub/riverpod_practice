import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<int> getNumber() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1), () {});

    yield Random().nextInt(100);
  }
}

final numProvider = StreamProvider.autoDispose<int>((ref) {
  return getNumber();
});

class StreamProviderExample extends StatelessWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (__, ref, _) {
          return Text('${ref.watch(numProvider).value}');
        }),
      ),
    );
  }
}
