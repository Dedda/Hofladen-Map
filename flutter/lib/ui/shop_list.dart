import 'package:flutter/material.dart';
import 'package:hofladen/core/api.dart';
import 'package:hofladen/core/models/address.dart';
import 'package:hofladen/core/models/shop.dart';
import 'package:hofladen/ui/loading.dart';

class ShopList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  List<ShopHeader>? _shops;

  @override
  Widget build(BuildContext context) {
    if (_shops == null) {
      loadShops();
      return Loading();
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _shops!.length,
        itemBuilder: (context, index) {
          return _ShopListItem(shop: _shops![index]);
        },
      );
    }
  }

  void loadShops() async {
    final shops = await OnlineApi().loadShopList();
    setState(() {
      _shops = shops;
    });
  }
}

@immutable
class _ShopListItem extends StatelessWidget {
  final ShopHeader shop;

  const _ShopListItem({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(shop.name),
      onPressed: () {
        Navigator.pushNamed(context, '/shop', arguments: shop);
      },
    );
  }
}
