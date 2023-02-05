import 'package:flutter/material.dart';

@immutable
class Product {
  const Product({required this.name, required this.id, required this.price, required this.stallId});

  final String name;
  final String id;
  final double price;
  final String stallId;

  factory Product.fromJson(Map<String, dynamic> data){
    return Product(
      name: data['name'],
      id: data['id'],
      price: data['price'],
      stallId: data['stallId'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'id': id,
      'price': price,
      'stallId': stallId,
    };
  }
}