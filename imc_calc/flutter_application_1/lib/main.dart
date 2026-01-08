import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/screens/imc_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(foregroundColor: AppColors.primary , backgroundColor:AppColors.accent ,title: Text("IMC Calculator"), centerTitle: true,),
        backgroundColor: AppColors.backgroundColor,
        body: ImcHomeScreen(),
        
      ),
    );
  }
}
