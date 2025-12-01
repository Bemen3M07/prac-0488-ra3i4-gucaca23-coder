import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'moto_provider.dart';
import 'pagina1.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MotoProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Pagina1(),
    );
  }
}
