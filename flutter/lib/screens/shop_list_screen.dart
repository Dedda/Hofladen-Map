import 'package:flutter/material.dart';
import 'package:hofladen/ui/shop_list.dart';

@immutable
class ShopListScreen extends StatelessWidget {

  const ShopListScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hofläden')),
      body: ShopList(),
    );
  }

}