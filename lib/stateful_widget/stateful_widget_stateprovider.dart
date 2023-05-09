import 'package:flutter/material.dart';

class StatefulWidgetStateProvider extends StatefulWidget {
  const StatefulWidgetStateProvider({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetStateProvider> createState() => _StatefulWidgetStateProviderState();
}

class _StatefulWidgetStateProviderState extends State<StatefulWidgetStateProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('stateful widget stateProvider'),));
  }
}
