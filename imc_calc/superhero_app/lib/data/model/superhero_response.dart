// https://superheroapi.com/api/569086ecea2c3a98426623a0ac592e5c/search/name

import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroResponse {

  final String response;
  final List<SuperheroDetailResponse?> result;

  SuperheroResponse({required this.response, this.result = const []});

  factory SuperheroResponse.fromJson(Map<String, dynamic> json){
    var list = json['results'] as List;
    List<SuperheroDetailResponse> heroList= list.map((hero) => SuperheroDetailResponse.fromJson(hero)).toList();

    return SuperheroResponse(response: json['response'], result: heroList);
    
  }


}