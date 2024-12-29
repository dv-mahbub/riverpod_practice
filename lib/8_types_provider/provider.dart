import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) => 'Mahbub Al Hasan');

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (BuildContext context, WidgetRef ref, child) {
          return Text(ref.watch(nameProvider));
        }),
      ),
    );
  }
}
