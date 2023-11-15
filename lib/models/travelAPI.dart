import 'dart:convert';

import 'package:flutter_application_travel/models/travel.dart';
import 'package:http/http.dart' as http;

class TravelAPI {
  static Future<List<Travel>> getTravel() async {
    Map<String, String> params = {
      'text': 'hanoi',
      'languagecode': 'en-us',
    };

    var uri = Uri.https(
      "apidojo-booking-v1.p.rapidapi.com",
      "/locations/auto-complete",
      params,
    );

    try {
      final response = await http.get(uri, headers: {
        "x-rapidapi-key": "1819085d78msh61c0f1706bd9efap195c4bjsnb87021662733",
        "x-rapidapi-host": "apidojo-booking-v1.p.rapidapi.com"
      });

      if (response.statusCode == 200) {
        String jsonsDataString = response.body.toString();
        print(jsonsDataString);

        List<dynamic> result = json.decode(response.body);
        List<Travel> travels = result.map((json) => Travel.fromJson(json)).toList();

        return travels;
      } else {
  
        print('Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
   
      print('Error: $error');
    }

 
    return [];
  }
}
