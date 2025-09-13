import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MyHomePage(title: 'Inicio'),
        ),
        GoRoute(path: '/agenda', builder: (context, state) => agendaPage()),
        GoRoute(
          path: '/configuracion',
          builder: (context, state) => configuracionPage(),
        ),
      ],
    );

    return MaterialApp.router(routerConfig: router);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: Text('Agenda')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: const Text('Menu'),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () => {context.go('/')},
            ),
            ListTile(
              title: const Text('Agenda'),
              onTap: () => {context.go('/agenda')},
            ),
            ListTile(
              title: const Text('Configuracion'),
              onTap: () => {context.go('/configuracion')},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
