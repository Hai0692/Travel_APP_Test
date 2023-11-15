import 'package:flutter/foundation.dart';

class Travel {
  final String image;
  final int hotels;
  final String country;
  Travel({required this.hotels,required this.image,required this.country});
  factory Travel.fromJson(dynamic json) {
    return Travel(
      hotels: json['hotels'] as int,
      image: json['image_url'] as String,
      country: json['country'] as String,
    );
  }

  // static List<Travel> recipesFromSnapshot(List snapshot) {
  //   return snapshot.map((data) {
  //     return Travel.fromJson(data);
  //   }).toList();
  // }

  @override
  String toString() {
    return 'Travel {image: $image, hotel: $hotels, contry: $country}';
  }
}
