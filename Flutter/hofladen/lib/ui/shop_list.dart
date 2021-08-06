import 'package:flutter/material.dart';
import 'package:hofladen/core/models/address.dart';
import 'package:hofladen/core/models/shop.dart';

class ShopList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  List<Shop>? _shops;

  @override
  Widget build(BuildContext context) {
    if (_shops == null) {
      loadShops();
      return Center(
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
      ));
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
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _shops = [
        Shop(
            id: '1',
            name: 'Testshop 1',
            address: Address(
                address: '',
                city: '',
                zipCode: '',
                country: '',
                lat: 0.0,
                lon: 0.0),
            openingHours: [],
            openingHoursHolidays: []),
        Shop(
            id: '2',
            name: 'Testshop 2',
            address: Address(
                address: '',
                city: '',
                zipCode: '',
                country: '',
                lat: 0.0,
                lon: 0.0),
            openingHours: [],
            openingHoursHolidays: []),
      ];
    });
  }
}

@immutable
class _ShopListItem extends StatelessWidget {
  final Shop shop;

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
