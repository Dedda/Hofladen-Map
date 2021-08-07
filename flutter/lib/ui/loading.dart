import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
  }
}
