import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:weather_icons/weather_icons.dart';

class ClimaCarouselView extends StatefulWidget{
  final Future<List<Map<String, dynamic>>> ciudadesGuardadas;
  final Function(Map<String, dynamic>) actualizarClima;
  consts ClimaCarouselView({
    Key? key,
    required this.ciudadesGuardadas,
    required this.actualizarClima,

  }): super (key: key);

  @override
  State<ClimaCarouselView> createState() => _ClimaCarouselViewState();

}

class _ClimaCarouselViewState extends State<ClimaCarouselView>{
  int _currentIndex=0;

  IconData _obtenerIconoClima(int simbolo){
     switch (simbolo){
      case 0:
        return WeatherIcons.cloudy;
      case 2:
        return WeatherIcons.day_sunny;
      case 3:
        return WeatherIcons.rain;
      case 4:
        return WeatherIcons.snow;
      case 5:
        return WeatherIcons.thunderstorm;
      default:
        return WeatherIcons.na;
     }

    
  }

  String _obtenerDescripcionClima(int simbolo){
    switch (simbolo){
      case 0:
        return "Nublado";
      case 2:
        return "Soleado";
      case 3:
        return "Lluvioso";
      case 4:
        return "Nevado";
      case 5:
        return "Tormenta";
      default:
        return "Desconocido";
     }
  }
}