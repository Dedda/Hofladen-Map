import 'package:flutter/material.dart';
import 'package:hofladen/screens/settings_screen.dart';
import 'package:hofladen/screens/shop_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/shoplist': (context) => const ShopListScreen(),
      },
    );
  }
}

@immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hofladen Map')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
                child: const Text('Hofläden'),
                onPressed: () {
                  Navigator.pushNamed(context, '/shoplist');
                }),
            MaterialButton(
                child: const Text('Settings'),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                }),
          ],
        ),
      ),
    );
  }
}
