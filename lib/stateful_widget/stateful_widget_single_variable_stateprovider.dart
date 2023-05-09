import 'package:flutter/material.dart';

class StatefulWidgetSignleVariableStateProvider extends StatefulWidget {
  const StatefulWidgetSignleVariableStateProvider({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetSignleVariableStateProvider> createState() => _StatefulWidgetSignleVariableStateProviderState();
}

class _StatefulWidgetSignleVariableStateProviderState extends State<StatefulWidgetSignleVariableStateProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('StatefulWidget Single Variable StateProvider'),));
  }
}
