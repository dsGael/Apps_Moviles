import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/text_styles.dart';

class NumberSelector extends StatefulWidget {

  final String title;
  final int value;
  final Function () onIncrement;
  final Function () onDecrement;
  const NumberSelector({super.key, required this.title, required this.value,required this.onIncrement, required this.onDecrement});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
               Text(widget.title, style: TextStyles.bigText,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: (){
                  widget.onDecrement();
                }, shape: CircleBorder(), backgroundColor: AppColors.primary, child: Icon(Icons.remove),),
                SizedBox(width: 12,),
                Text(widget.value.toString(), style: TextStyles.bigNumberText),
                SizedBox(width: 16,),
                FloatingActionButton(onPressed: (){
                  widget.onIncrement();
                }, shape: CircleBorder(), backgroundColor: AppColors.primary, child: Icon(Icons.add),)
                
        
              ],
            )
          ],
        ),
      ),
    );
  }
}