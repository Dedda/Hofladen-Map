import 'package:flutter/material.dart';

@immutable
class SettingsScreen extends StatelessWidget {

  const SettingsScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(
          child: Text('Settings content')
      ),
    );
  }

}