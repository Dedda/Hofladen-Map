import 'package:flutter/material.dart';

@immutable
class ShopListScreen extends StatelessWidget {

  const ShopListScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hofläden')),
      body: Column(
        children: const <Widget>[
          Text('Hof 1'),
          Text('Hof 2'),
        ],
      ),
    );
  }

}