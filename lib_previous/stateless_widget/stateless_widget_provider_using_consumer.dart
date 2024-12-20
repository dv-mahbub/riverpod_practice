import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class StatelessWidgetUsingConsumer extends StatelessWidget {
  const StatelessWidgetUsingConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2. Stateless Widget Using Consumer - Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final message = ref.watch(welcome);
          return Text(message);
        }),
      ),
    );
  }
}
