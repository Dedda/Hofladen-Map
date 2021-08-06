
import 'package:flutter_test/flutter_test.dart';
import 'package:hofladen/core/models/address.dart';

void main() {
  test('Correctly parses from json dict', () {
    final data = {
      'address': 'Test road 1',
      'city': 'Test city',
      'zipcode': '99999',
      'country': 'US',
      'lat': 12.0,
      'lon': 13.0,
    };
    final parsed = Address.fromJson(data);
    expect(parsed, Address(
      address: 'Test road 1',
      city: 'Test city',
      zipCode: '99999',
      country: 'US',
      lat: 12.0,
      lon: 13.0,
    ));
  });

  test('Format address', () {
    final address = Address(
      address: 'Test road 1',
      city: 'Test city',
      zipCode: '99999',
      country: 'US',
      lat: 12.0,
      lon: 13.0,
    );
    expect(address.formatted, 'Test road 1, 99999 Test city, US');
  });
}