import 'package:flutter/material.dart';
import 'package:hofladen/core/models/address.dart';

@immutable
class AddressView extends StatelessWidget {
  final Address address;

  const AddressView({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const Text('Adresse:', style: TextStyle(fontWeight: FontWeight.bold))
    ];
    children.addAll(address.formattedLines.map((line) => Text(line)));
    return Column(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
