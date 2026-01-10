import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  final int age;
  const ImcResultScreen({super.key, required this.height, required this.weight, required this.age });

  @override
  Widget build(BuildContext context) {
    double imcResult= weight / ((height/100) * (height/100));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: toolbarResult(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
        children: [
          Text("Tu Resultado", style: TextStyles.bigText),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:32,bottom:32.0, left:16, right:16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("IMC: ${imcResult.toStringAsFixed(2)}", style: TextStyles.resultNumberText, textAlign: TextAlign.center),
              ),
            ),
          ),
         SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(onPressed: (){}, 
              style: ButtonStyle(
                
                backgroundColor: WidgetStateProperty.all(AppColors.accent),
              ),
              child: Text(  "Finalizar", style: TextStyles.buttonText)
              
           ),
         )
        ],
      ),
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
        foregroundColor: AppColors.primary , 
        backgroundColor:AppColors.accent ,
        title: Text("IMC Results"), 
        centerTitle: true,);
  }
}