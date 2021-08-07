import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hofladen/screens/settings_screen.dart';
import 'package:hofladen/screens/shop_detail_screen.dart';
import 'package:hofladen/screens/shop_list_screen.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Logger log = Logger();
  static Logger prettyLog = Logger(
      printer: PrettyPrinter(
        colors: true,
        printEmojis: true,
        lineLength: 120,
      )
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('de', ''),
      ],
      home: const HomePage(),
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/shoplist': (context) => const ShopListScreen(),
        '/shop': (context) => ShopDetailScreen(),
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: const Text('Hofläden'),
                onPressed: () {
                  Navigator.pushNamed(context, '/shoplist');
                }),
            SizedBox(height: 10),
            ElevatedButton(
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
