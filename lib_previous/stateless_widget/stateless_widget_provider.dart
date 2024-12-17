import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class StatelessWidgetRiverpod extends ConsumerWidget {
  const StatelessWidgetRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(welcome);

    return Scaffold(
      appBar: AppBar(
        title: const Text('1. Stateless Widget - Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
