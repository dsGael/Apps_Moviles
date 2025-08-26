import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Starwars'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use the Image.network constructor to display an image from the internet
              Image.network(
                'https://lumiere-a.akamaihd.net/v1/images/Star-Wars-Empire-Strikes-Back-V-Poster_878f7fce.jpeg',
                width: 250,
                height: 450,
              ),
              // Use the Text widget to display some text below the image
              Text(
                'El Imperio Contraataca es una de las mejores películas de la serie',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      );
  }
}