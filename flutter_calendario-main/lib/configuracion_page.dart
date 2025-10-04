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
  final TextEditingController calendarIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    _loadPersistedData();
    return AppScaffold(
      title: 'Configuración',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AppText(
              text: 'Personaliza tu aplicación',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Nombre de veterinaria',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _saveCustomText(value);
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: calendarIdController,
              decoration: InputDecoration(
                labelText: 'ID de calendario (Google Calendar)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _saveCalendarID(value);
              },
            ),
            const SizedBox(height: 20),
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
    await prefs.setString('custom_text', text);
  }

  void _saveCalendarID(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('calendar_id', text);
  }

  void _loadPersistedData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedText = prefs.getString('custom_text') ?? '';
    textController.text = savedText;
    final savedCalendarId = prefs.getString('calendar_id') ?? '';
    calendarIdController.text = savedCalendarId;
    if (calendarIdController.text.isEmpty) {
      calendarIdController.text = savedCalendarId;
    }
  }
}
