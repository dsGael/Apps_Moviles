import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TemaJuego { base, futurista }

class SettingsController extends GetxController {
  var tema = 0;
  Map<String, String> temaBase = {
    'nombre': 'Base',
    'background': './assets/base/background.png',
  };
  Map<String, String> temaFuturista = {
    'nombre': 'Futurista',
    'background': './assets/futurista/background.png',
  };
  List<Map<String, String>> get temas => [temaBase, temaFuturista];
  actualizaTema(int nuevoTema) {
    if (nuevoTema >= 0 && nuevoTema < 2) {
      tema = nuevoTema;
      update();
    }
  }

  int getTema() {
    return tema;
  }

  Image showTemaBackground(double h) {
    Map<String, String> temaActual = temas[tema];
    String background = temaActual['background']!;
    return Image.asset(
      background,
      height: h,
      width: 400,
      alignment: Alignment.center,
    );
  }

  String getTemaNombre(int indice) {
    Map<String, String> temaActual = temas[indice];
    return temaActual['nombre']!;
  }
}
