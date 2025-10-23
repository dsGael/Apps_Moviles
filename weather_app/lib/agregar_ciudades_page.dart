import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_scaffold.dart';

class AgregarCiudadesPage extends StatelessWidget {
  const AgregarCiudadesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Agregar Ciudades',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Aquí puedes agregar nuevas ciudades',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Divider(color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
