import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;
  final String token;
  final String image;
  final List<dynamic> products;

  UserModel({
    required this.id,
    required this.phone,
    required this.name,
    required this.token,
    required this.image,
    required this.products,
  });
}
