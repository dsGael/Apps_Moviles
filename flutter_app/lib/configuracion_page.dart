import 'package:flutter/material.dart';
import 'package:flutter_app/settings_controller.dart';
import 'package:get/get.dart';

List<String> imagenes = [
  './assets/base/background.png',
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
                  items: <DropdownMenuItem<TemaJuego>>[
                    DropdownMenuItem<TemaJuego>(
                      value: TemaJuego.base,
                      child: Text(
                        widget.settingsController.getTemaNombre(
                          TemaJuego.base.index,
                        ),
                      ),
                    ),
                    DropdownMenuItem<TemaJuego>(
                      value: TemaJuego.futurista,
                      child: Text(
                        widget.settingsController.getTemaNombre(
                          TemaJuego.futurista.index,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(children: [widget.settingsController.showTemaBackground(200)]),
            Row(
              children: [
                SizedBox(height: 25, width: 20),
                ElevatedButton(
                  onPressed: () {
                    widget.settingsController.actualizaTema(
                      _temaSeleccionado!.index,
                    );
                    setState(() {});
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
