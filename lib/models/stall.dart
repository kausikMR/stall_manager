import 'package:flutter/material.dart';

import 'product.dart';

@immutable
class Stall {
  const Stall({required this.name, required this.id, required this.ownerId, this.products = const []});

  final String name;
  final String id;
  final String ownerId;
  final List<Product> products;

  factory Stall.fromMap(Map<String, dynamic> data){
    return Stall(
      name: data['name'],
      id: data['id'],
      ownerId: data['ownerId'],
      products: data['products'] != null ? List<Product>.from(data['products'].map((e) => Product.fromJson(e))) : [],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'id': id,
      'ownerId': ownerId,
      'products': products.map((e) => e.toJson()).toList(),
    };
  }

}

