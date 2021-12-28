import 'package:flutter/material.dart';
import 'light_colors.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Belt Bag",
      price: 56,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: LightColors.kLighterGreen),
  Product(
      id: 2,
      title: "Hang Top",
      price: 44,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: LightColors.kLighterGreen),
  Product(
      id: 3,
      title: "Old Fashion",
      price: 42,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: LightColors.kLighterGreen),
  Product(
    id: 4,
    title: "Office Eco-Code",
    price: 67,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: LightColors.kLighterGreen,
  ),
];

String dummyText =
    "It uses a medium proportion of eco-friendly materials including recycled materials. "
    "It has set an absolute target to reduce greenhouse gas emissions generated from its own operations.";
