import 'package:bloopa/ui/themes/bloopaDarkTheme.dart';
import 'package:bloopa/ui/themes/bloopaLightTheme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:bloopa/router.dart';
import 'global.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
void main() {
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bloopa',
      theme: bloopaLightTheme(),
      darkTheme: bloopaDarkTheme(),
      debugShowCheckedModeBanner: debugMode,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
