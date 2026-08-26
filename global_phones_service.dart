import 'package:flutter/material.dart';

class GlobalPhoneModel {
  final String name;
  final String brand;
  final String price;
  final String processor;
  final String battery;
  final String imageId;

  GlobalPhoneModel({
    required this.name,
    required this.brand,
    required this.price,
    required this.processor,
    required this.battery,
    required this.imageId,
  });
}

class GlobalPhonesService {
  static const String cloudName = 'j1f5vm0p';

  static List<GlobalPhoneModel> getAllGlobalPhones() {
    return [
      GlobalPhoneModel(
        name: 'iPhone 17 Pro Max',
        brand: 'Apple',
        price: '\$1,199',
        processor: 'Apple A19 Pro (3nm)',
        battery: '4850 mAh',
        imageId: 'sample',
      ),
      GlobalPhoneModel(
        name: 'Samsung Galaxy S26 Ultra',
        brand: 'Samsung',
        price: '\$1,099',
        processor: 'Snapdragon 8 Elite Gen 2',
        battery: '5000 mAh',
        imageId: 'sample',
      ),
      GlobalPhoneModel(
        name: 'Xiaomi 16 Ultra AI',
        brand: 'Xiaomi',
        price: '\$999',
        processor: 'Snapdragon 8 Elite',
        battery: '5300 mAh',
        imageId: 'sample',
      ),
      GlobalPhoneModel(
        name: 'Honor X9d AI Edition',
        brand: 'Honor',
        price: '\$599',
        processor: 'Snapdragon 6 Gen 3',
        battery: '5800 mAh',
        imageId: 'sample',
      ),
      GlobalPhoneModel(
        name: 'Poco X8 Pro Gaming',
        brand: 'Poco',
        price: '\$449',
        processor: 'Dimensity 8400 Ultra',
        battery: '5000 mAh',
        imageId: 'sample',
      ),
    ];
  }

  static String getCloudinaryImageUrl(String imageId) {
    return 'https://res.cloudinary.com/$cloudName/image/upload/f_auto,q_auto/$imageId';
  }
}
