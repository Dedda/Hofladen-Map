import 'package:flutter/material.dart';
import 'package:hofladen/core/models/shop.dart';

@immutable
class ShopDetailScreen extends StatelessWidget {

  const ShopDetailScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final shop = ModalRoute.of(context)!.settings.arguments as Shop;

    return Scaffold(
      appBar: AppBar(title: Text(shop.name)),
      body: Text(shop.address.formatted),
    );
  }
  
}