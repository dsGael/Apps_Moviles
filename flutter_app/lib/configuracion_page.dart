import 'package:flutter/material.dart';
import 'package:flutter_app/settings_controller.dart';
import 'package:get/get.dart';

enum TemaJuego { base, futurista }

List<String> imagenes = [
  './assets/base/backgroung.png',
  './assets/futurista/background.png',
];

class ConfiguracionPage extends StatefulWidget {
  ConfiguracionPage({super.key});

  final SettingsController settingsController = Get.find();

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  //creamos e inicializamos
  late TemaJuego? _temaSeleccionado; // inicializamos con null (es late)

  @override
  void initState() {
    super.initState();
    _temaSeleccionado = TemaJuego.values[widget.settingsController.getTema()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Selecciona el tema:',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            Row(
              children: [
                DropdownButton<TemaJuego>(
                  value: _temaSeleccionado,
                  onChanged: (TemaJuego? nuevoValor) {
                    setState(() {
                      _temaSeleccionado = nuevoValor;
                    });
                  },
                  items: const <DropdownMenuItem<TemaJuego>>[
                    DropdownMenuItem<TemaJuego>(
                      value: TemaJuego.base,
                      child: Text('Base'),
                    ),
                    DropdownMenuItem<TemaJuego>(
                      value: TemaJuego.futurista,
                      child: Text('Futurista'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(imagenes[_temaSeleccionado!.index], width: 500),
              ],
            ),
            Row(
              children: [
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    widget.settingsController.actualizaTema(
                      _temaSeleccionado!.index,
                    );
                  },
                  child: Text("Guardar Cambios"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
