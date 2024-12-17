import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class StatefulWidgetRiverpod extends ConsumerStatefulWidget {
  const StatefulWidgetRiverpod({super.key});

  @override
  ConsumerState<StatefulWidgetRiverpod> createState() =>
      _StatefulWidgetRiverpodState();
}

class _StatefulWidgetRiverpodState
    extends ConsumerState<StatefulWidgetRiverpod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3. Stateful Widget - Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final message = ref.watch(welcome);
            return Text(message);
          },
        ),
      ),
    );
  }
}
