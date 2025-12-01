import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'moto_provider.dart';
import 'pagina2.dart';
import 'moto.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Selecciona una moto")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: const Text('Elige una moto'),
              value: seleccionada,
              items: motos
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
              onChanged: (m) => setState(() => seleccionada = m),
            ),
            const SizedBox(height: 16),
              Text(
                'Moto seleccionada: $seleccionada',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (seleccionada != null) {
                  final provider = Provider.of<MotoProvider>(context, listen: false);
                  try {
                    final moto = provider.motos.firstWhere((m) => m.marcaModelo == seleccionada);
                    provider.seleccionarMoto(moto);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Pagina2()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No se encontró la moto en el proveedor')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Selecciona primero una moto')),
                  );
                }
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
  String? seleccionada;
  final List<String> motos = [
  'Honda PCX 125',
  'Yamaha NMAX 125',
  'Kymco Agility City 125',
  'Sym Symphony 125',
  'Vespa Primavera 125',
  'Kawasaki J125',
  'Peugeot Pulsion 125',
  ];
}
