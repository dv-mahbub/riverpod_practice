import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_practice/8_types_provider/future_provider/data_model.dart';

FutureProvider<List<DataModel>> futureProvider =
    FutureProvider<List<DataModel>>(
  (ref) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return dataModelFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  },
);

class FutureProvider2ndExample extends StatelessWidget {
  const FutureProvider2ndExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, child) {
              final future = ref.watch(futureProvider);
              return future.when(
                data: (dataList) => Column(
                  children: dataList
                      .map((data) => Text('${data.id}: ${data.title}'))
                      .toList(),
                ),
                error: (error, stackTrace) => Text('$error'),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
