import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InformacionPage extends StatelessWidget {
  const InformacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Información')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('aaa', style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/foto.jpg', width: 100, height: 100),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Dart Vader'), Text('Lord of the Sith ')],
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('Menú'),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                context.go('/');
              },
            ),
            ListTile(
              title: const Text('Juego'),
              onTap: () {
                context.go('/juego');
              },
            ),
            ListTile(
              title: const Text('Configuración'),
              onTap: () {
                context.go('/configuracion');
              },
            ),
            ListTile(
              title: const Text('Información'),
              onTap: () {
                context.go('/informacion');
              },
            ),
          ],
        ),
      ),
    );
  }
}
