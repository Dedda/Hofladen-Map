import 'package:flutter/material.dart';
import 'package:hofladen/core/api.dart';
import 'package:hofladen/core/models/shop.dart';
import 'package:hofladen/ui/address_view.dart';
import 'package:hofladen/ui/loading.dart';
import 'package:hofladen/ui/opening_hours_view.dart';

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
        body: Loading(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text(_shop!.name)),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AddressView(address: _shop!.address),
              SizedBox(height: 12),
              OpeningHoursView(openingHours: _shop!.openingHours),
            ],
          ),
        ),
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
