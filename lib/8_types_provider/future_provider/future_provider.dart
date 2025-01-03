import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final numberFutureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return Random().nextInt(100);
});

class FutureProviderExample extends StatelessWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (__, WidgetRef ref, _) {
                return ref.watch(numberFutureProvider).when(
                    data: (data) => Text('The number is: $data'),
                    error: (error, stackTrace) {
                      Logger().e(error);
                      return Text(
                          'Error: $error, Stack trace: ${stackTrace.toString()}');
                    },
                    loading: () => const CircularProgressIndicator());
              },
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FutureProviderExample2ndPage(),
                  ),
                );
              },
              child: const Text('Go'),
            ),
          ],
        ),
      ),
    );
  }
}

class FutureProviderExample2ndPage extends StatelessWidget {
  const FutureProviderExample2ndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (__, WidgetRef ref, _) {
                return Column(
                  children: [
                    ref.watch(numberFutureProvider).when(
                        data: (data) => Text('The number is: $data'),
                        error: (error, stackTrace) {
                          Logger().e(error);
                          return Text(
                              'Error: $error, Stack trace: ${stackTrace.toString()}');
                        },
                        loading: () => const CircularProgressIndicator()),
                    FilledButton(
                      onPressed: () {
                        // ref.invalidate(numberFutureProvider);
                        final refreshedValue =
                            ref.refresh(numberFutureProvider);
                        Logger().i('Provider refreshed: $refreshedValue');
                      },
                      child: const Text('Refresh'),
                    ),
                  ],
                );
              },
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
