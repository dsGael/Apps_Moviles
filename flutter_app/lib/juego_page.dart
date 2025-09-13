import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class JuegoPage extends StatefulWidget {
  JuegoPage({super.key});
  final SettingsController settingsController = Get.find();

  @override
  _JuegoPageState createState() => _JuegoPageState();
}

class _JuegoPageState extends State<JuegoPage> {
  final TextEditingController _controller = TextEditingController();
  String archivoPalabras = "assets/palabras/palabras.txt";
  List<String> palabras = [];
  String _palabra = "";
  String _espacios = " ";
  int idxpalabra = 0;
  int _intentos = 0;
  final _random = Random();
  String abecedario = "abcdefghijklmnñopqrstuvwxyz";
  String abc = "";

  @override
  void initState() {
    super.initState();
    _cargaPalabras();
  }

  Future<void> _cargaPalabras() async {
    final String contenido = await rootBundle.loadString(archivoPalabras);
    setState(() {
      palabras = contenido.split('\n');
    });
  }

  void _setEspacio() {
    setState(() {
      if (palabras.isNotEmpty) {
        _palabra = palabras[idxpalabra];
        _espacios = List.filled(_palabra.length, "_").join(" ");
      } else {
        _palabra = "";
        _espacios = "";
      }
    });
  }

  void _showDialog(String title, String content) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(content),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Play again'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _nuevoJuego();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _enviar() {
    String input = _controller.text.toLowerCase();
    setState(() {
      if (input.isEmpty) return;

      if (input.length == 1) {
        // input es una letra
        if (abc.contains(input)) {
          abc = abc.replaceAll(input, '*');
          if (_palabra.contains(input)) {
            String newEspacios = "";
            for (int i = 0; i < _palabra.length; i++) {
              if (_palabra[i] == input) {
                newEspacios += input + ' ';
              } else {
                newEspacios += _espacios[i * 2] + ' ';
              }
            }
            _espacios = newEspacios; // va fuera del ciclo
          } else {
            _intentos++;
            if (_intentos >= 6) {
              _showDialog("Perdiste", "La palabra era: $_palabra");
            }
          }
        }
      } else {
        // input es una palabra
        if (input == _palabra) {
          for (int i = 0; i < _palabra.length; i++) {
            _espacios = '$_palabra[i] ';
          }
          if (!_espacios.contains('_')) {
            _showDialog(
              "Ganaste",
              "Felicidades, adivinaste la palabra: $_palabra",
            );
          }
        } else {
          _intentos++;
          if (_intentos >= 6) {
            _showDialog("Perdiste", "La palabra era: $_palabra");
          }
        }
      }
      _controller.clear();
      if (!_espacios.contains('_')) {
        _showDialog("Ganaste", "Felicidades, adivinaste la palabra: $_palabra");
      }
    });
  }

  void _nuevoJuego() {
    setState(() {});
    idxpalabra = _random.nextInt(palabras.length);
    abc = abecedario;
    _intentos = 0;
    _setEspacio();
  }

  @override
  Widget build(BuildContext context) {
    bool isGameActive = _espacios.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: Text('Juego')),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(abc)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 600,
                  child: Stack(
                    children: <Widget>[
                      widget.settingsController.showTemaSelectedBackground(300),
                      Positioned(
                        top: widget.settingsController.getTemaTop(_intentos),
                        left: widget.settingsController.getTemaLeft(_intentos),
                        child: Container(
                          width: 160,
                          child: widget.settingsController.showAhorcado(
                            _intentos,
                            350,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(_espacios), Text(_palabra)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                    enabled: isGameActive,
                    decoration: InputDecoration(
                      labelText: "Adivina la palabra",
                      hintText: "Letra o palabra",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    autofocus: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: isGameActive ? _enviar : null,
                  child: Text("Enviar"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _nuevoJuego,
                  child: const Text("Nuevo Juego"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
