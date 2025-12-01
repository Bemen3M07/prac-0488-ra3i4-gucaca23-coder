import 'package:flutter/material.dart';
import 'package:prac_0488_ra3i4_gucaca23_coder/Examen_Carpio_Guillem/moto_provider.dart';
import 'package:provider/provider.dart';


class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final kmInicialCtrl = TextEditingController();
  final kmActualCtrl = TextEditingController();
  double? resultado;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MotoProvider>(context);
    final moto = state.seleccionada!;

    return Scaffold(
      appBar: AppBar(title: Text("Datos de ${moto.marcaModelo}")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Depósito: ${moto.fuelTankLiters} L",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Consumo: ${moto.consumptionL100} L/100km",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: kmInicialCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Km al llenar depósito"),
            ),
            TextField(
              controller: kmActualCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Km actuales de la moto"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double kmInicial = double.tryParse(kmInicialCtrl.text) ?? 0;
                double kmActual = double.tryParse(kmActualCtrl.text) ?? 0;
                double consumidos = kmActual - kmInicial;

                double autonomiaTotal =
                    (moto.fuelTankLiters / moto.consumptionL100) * 100;
                double restantes = autonomiaTotal - consumidos;

                setState(() {
                  resultado = restantes < 0 ? 0 : restantes;
                });
              },
              child: const Text("Calcular kilómetros restantes"),
            ),
            const SizedBox(height: 20),
            if (resultado != null)
              Text(
                "Puedes recorrer todavía: ${resultado!.toStringAsFixed(1)} km",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
