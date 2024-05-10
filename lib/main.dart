import 'package:flutter/material.dart';
import 'package:spontaneo_pro/router/router_config.dart';

void main() {
  runApp(const SpontaneoApp());
}

class SpontaneoApp extends StatelessWidget {
  const SpontaneoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Spontaneo App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
