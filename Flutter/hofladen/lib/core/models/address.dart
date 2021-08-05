import 'package:sprintf/sprintf.dart';

class Address {
  final String address;
  final String city;
  final String zipCode;
  final String country;
  final double lat;
  final double lon;

  Address({
    required this.address,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.lat,
    required this.lon,
  });

  String get formatted =>
      sprintf('%s, %s %s, %s', [address, zipCode, city, country]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          city == other.city &&
          zipCode == other.zipCode &&
          country == other.country &&
          lat == other.lat &&
          lon == other.lon;

  @override
  int get hashCode =>
      address.hashCode ^
      city.hashCode ^
      zipCode.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      lon.hashCode;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json['address'],
      city: json['city'],
      zipCode: json['zipcode'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}