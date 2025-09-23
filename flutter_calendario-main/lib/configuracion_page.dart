import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';
import 'app_scaffold.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'app_text.dart';

class ConfiguracionPage extends StatelessWidget {
  ConfiguracionPage({super.key});

  final SettingsController settingsController = Get.put(SettingsController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    _loadPersistentData();
    return AppScaffold(
      title: 'Configuración',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AppText(
              'Personaliza tu app',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Nombre de la Veterinaria',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _saveCustomText(value);
              },
            ),
            RadioGroup<ThemeMode>(
              groupValue: themeProvider.themeMode,
              onChanged: (mode) => themeProvider.setTheme(mode!),
              child: Column(
                children: <Widget>[
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.light,
                    title: Text('Claro'),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.dark,
                    title: Text('Oscuro'),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.system,
                    title: Text('Seguir sistema'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveCustomText(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('customText', text);
  }

  void _loadPersistentData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedText = prefs.getString('customText') ?? '';
    textController.text = savedText;
  }
}
