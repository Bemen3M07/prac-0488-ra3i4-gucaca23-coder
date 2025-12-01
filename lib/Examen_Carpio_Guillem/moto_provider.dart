import 'package:flutter/material.dart';
import 'moto.dart';

class MotoProvider extends ChangeNotifier {
  List<Moto> motos = [
    Moto(marcaModelo: 'Honda PCX 125', fuelTankLiters: 2.8, consumptionL100: 2.0),
    Moto(marcaModelo: 'Yamaha NMAX 125', fuelTankLiters: 7.1, consumptionL100: 2.2),
    Moto(marcaModelo: 'Kymco Agility City 125', fuelTankLiters: 7.0, consumptionL100: 2.5),
    Moto(marcaModelo: 'Sym Symphony 125', fuelTankLiters: 6.0, consumptionL100: 2.3),
    Moto(marcaModelo: 'Vespa Primavera 125', fuelTankLiters: 5.5, consumptionL100: 2.4),
    Moto(marcaModelo: 'Kawasaki J125', fuelTankLiters: 11.0, consumptionL100: 3.5),
    Moto(marcaModelo: 'Peugeot Pulsion 125', fuelTankLiters: 5.0, consumptionL100: 2.8),
  ];

  Moto? seleccionada;

  void seleccionarMoto(Moto moto) {
    seleccionada = moto;
    notifyListeners();
  }
}
