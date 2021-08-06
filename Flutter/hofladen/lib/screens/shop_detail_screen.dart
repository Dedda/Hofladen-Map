import 'package:flutter/material.dart';
import 'package:hofladen/core/api.dart';
import 'package:hofladen/core/models/shop.dart';

class ShopDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopDetailScreen();
}

class _ShopDetailScreen extends State<ShopDetailScreen> {
  Shop? _shop;

  @override
  Widget build(BuildContext context) {
    if (_shop == null) {
      final shopHeader =
          ModalRoute.of(context)!.settings.arguments as ShopHeader;
      loadShop(shopHeader.id);

      return Scaffold(
        appBar: AppBar(title: Text(shopHeader.name)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircularProgressIndicator(),
                const SizedBox(width: 8),
                const Text('Loading...'),
              ],
            ),
          ],
        )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text(_shop!.name)),
        body: Text('ID: ${_shop!.id}'),
      );
    }
  }

  void loadShop(final String id) async {
    final shop = await OnlineApi().loadShopDetails(id);
    setState(() {
      _shop = shop;
    });
  }
}
