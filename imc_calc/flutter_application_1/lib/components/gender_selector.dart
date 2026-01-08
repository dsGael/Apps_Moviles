import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender="Hombre";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left:16.0, right: 8.0, top: 16.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color:selectedGender== "Hombre"
                  ?AppColors.backgroundComponentSelected
                  :AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network("https://images-ext-1.discordapp.net/external/GlgficwI953pMp1vSkZ9KBJgRjW7hTowPRfl0zIaqa4/https/cdn-icons-png.flaticon.com/512/4253/4253081.png?format=webp&quality=lossless&width=640&height=640", height: 100,),
                      Text("Hombre", style:TextStyles.bodyText)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
          //mujer
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender="Mujer";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left:8.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color:selectedGender== "Mujer"
                  ?AppColors.backgroundComponentSelected
                  :AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     children: [
                      Image.network("https://media.discordapp.net/attachments/1457288739981103165/1458728158533521429/female.png?ex=6960b1f6&is=695f6076&hm=3b0b6996c181925635b5881539a97f87d73b2c78268c73d441f6410cb8f4bd89&=&format=webp&quality=lossless&width=625&height=625", height: 100,),
                      Text("Mujer", style:TextStyles.bodyText)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}