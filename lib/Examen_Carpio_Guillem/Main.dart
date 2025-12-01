import 'package:flutter/material.dart';
import 'package:prac_0488_ra3i4_gucaca23_coder/Examen_Carpio_Guillem/pagina1.dart';
import 'package:provider/provider.dart';
import 'moto_provider.dart';

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
