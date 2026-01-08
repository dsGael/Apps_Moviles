import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height=170;
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left:16,right: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundComponent,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
          children: [
            SizedBox(height: 16,),
            Text("Altura", style: TextStyles.bigText,),
            Text("${height.toStringAsFixed(0)} cm", style: TextStyles.bigNumberText),
            Slider(value: height, onChanged: (value){
              setState(() {
                height=value;
                
              });
            },
            min:140,
            max: 220,
            divisions: 80,
            activeColor: AppColors.accent,
            label: "$height",
            )
          ],
              ),
        ),
      );
  }
}