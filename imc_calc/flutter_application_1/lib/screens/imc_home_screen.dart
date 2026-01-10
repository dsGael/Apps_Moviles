import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/gender_selector.dart';
import 'package:flutter_application_1/components/height_selector.dart';
import 'package:flutter_application_1/components/number_selector.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/text_styles.dart';
import 'package:flutter_application_1/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedEdad = 20;
  int selectedPeso= 60;
  double selectedHeight = 170;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(selectedHeight: selectedHeight, onHeightChanged: (newHeight){
          setState(() {
            selectedHeight=newHeight;
          });
        },),
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Row(
             children: [
              Expanded(child: NumberSelector(title: "Peso",value:selectedPeso , 
              
              onDecrement: () => setState(() {
                selectedPeso--;
              }), 
              
              onIncrement: () => 
              setState(() {
                selectedPeso++;
              }), )),
              SizedBox(width: 16,),
              Expanded(child: NumberSelector(title: "Edad", value: selectedEdad, 
              onDecrement: (){
                setState(() {
                  selectedEdad--;
                  print(selectedEdad);
                });
              }, 
              onIncrement: () => 
              setState(() {
                selectedEdad++;
                print(selectedEdad);
              }), )),
           
             ],
           ),
         ),

        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              onPressed:(){
                Navigator.push(context,
                MaterialPageRoute(builder:
                (context)=> ImcResultScreen(
                  height: selectedHeight,
                  weight: selectedPeso,
                  age: selectedEdad,
                ) )
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.accent),
              ),
              child: Text("Calcular", style: TextStyles.buttonText,))),
        )

      ],
    );
  }
}