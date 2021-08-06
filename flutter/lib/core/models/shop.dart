import 'package:hofladen/core/models/address.dart';
import 'package:hofladen/core/models/opening_hours.dart';

class Shop {
  final String id;
  final String name;
  final Address address;
  final List<OpeningHours> openingHours;
  final List<OpeningHoursHolidays> openingHoursHolidays;

  Shop({
    required this.id,
    required this.name,
    required this.address,
    required this.openingHours,
    required this.openingHoursHolidays,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      name: json['name'],
      address: Address.fromJson(json['address']),
      openingHours: [],
      openingHoursHolidays: [],
      // openingHours: json['opening_hours']
      //     .map((ooJson) => OpeningHours.fromJson(ooJson))
      //     .toList(growable: false) as List<OpeningHours>,
      // openingHoursHolidays: json['opening_hours']
      //     .map((oohJson) => OpeningHoursHolidays.fromJson(oohJson))
      //     .toList(growable: false) as List<OpeningHoursHolidays>,
    );
  }
}

class ShopHeader {
  final String id;
  final String name;

  ShopHeader({
    required this.id,
    required this.name,
  });

  factory ShopHeader.fromJson(Map<String, dynamic> json) {
    return ShopHeader(id: json['id'], name: json['name']);
  }
}
