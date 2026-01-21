import 'dart:convert';

import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:http/http.dart' as http;
class Repository {

  Future<SuperheroResponse?> fetchSuperheroByName(String name) async {
    final response = await http.get(Uri.parse('https://superheroapi.com/api/569086ecea2c3a98426623a0ac592e5c/search/$name'));
  
  
    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body);
      return SuperheroResponse.fromJson(decodeJson);
    } else {
      return null;
    }

  }


}
