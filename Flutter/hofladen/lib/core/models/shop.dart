import 'package:hofladen/core/models/address.dart';
import 'package:hofladen/core/models/opening_hours.dart';

class Shop {
  final String name;
  final Address address;
  final List<OpeningHours> openingHours;
  final List<OpeningHoursHolidays> openingHoursHolidays;

  Shop({
    required this.name,
    required this.address,
    required this.openingHours,
    required this.openingHoursHolidays,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
        name: json['name'], 
        address: Address.fromJson(json['address']),
        openingHours: json['opening_hours'].map((ooJson) => OpeningHours.fromJson(ooJson)),
        openingHoursHolidays: json['opening_hours'].map((oohJson) => OpeningHoursHolidays.fromJson(oohJson)),
    );
  }
}