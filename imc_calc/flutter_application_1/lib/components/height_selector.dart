import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChanged;
  const HeightSelector({super.key, required this.selectedHeight, required this.onHeightChanged});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  
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
            Text("${widget.selectedHeight.toStringAsFixed(0)} cm", style: TextStyles.bigNumberText),
            Slider(
              value: widget.selectedHeight, 
              onChanged: (value){
                setState(() {
                  widget.onHeightChanged(value);
                  
                });
              },
              min:140,
              max: 220,
              divisions: 80,
              activeColor: AppColors.accent,
              label: "${widget.selectedHeight}",
            )
          ],
          ),
        ),
      );
  }
}