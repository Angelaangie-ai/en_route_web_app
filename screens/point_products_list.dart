import 'package:enroute/components/point_product.dart';
import 'point_single_product.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  // Products' images
  static const String classicLatte = 'assets/images/classic_latte.png';
  static const String iced = 'assets/images/iced.png';
  static const String americano = 'assets/images/americano.png';
  static const String lemonTea = 'assets/images/lemon_tea.png';
  static const String espresso = 'assets/images/espresso.png';
  static const String cappuccino = 'assets/images/cappuccino.png';

  final List<Product> productList = [
    Product(
      id: 1,
      name: 'Classic Latte',
      price: '7 points',
      imagePath: classicLatte,
    ),
    Product(
      id: 2,
      name: 'Iced Caramel\nMocca',
      price: '13 points',
      imagePath: iced,
    ),
    Product(
      id: 3,
      name: 'Classic Americano',
      price: '5 points',
      imagePath: americano,
    ),
    Product(
      id: 4,
      name: 'Hot Lemon Tea',
      price: '5 points',
      imagePath: lemonTea,
    ),
    Product(
      id: 5,
      name: 'Espresso',
      price: '3 points',
      imagePath: espresso,
    ),
    Product(
      id: 6,
      name: 'Cappuccino',
      price: '9 points',
      imagePath: cappuccino,
    ),
  ];

  Widget _productRow(Product first, Product second) {
    return Row(
      children: [
        SingleProduct(product: first),
        SizedBox(width: 15),
        SingleProduct(product: second)
      ],
    );
  }

  SizedBox _rowSpacer() {
    return SizedBox(width: double.infinity, height: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _productRow(
          productList[0],
          productList[1],
        ),
        _rowSpacer(),
        _productRow(
          productList[2],
          productList[3],
        ),
        _rowSpacer(),
        _productRow(
          productList[4],
          productList[5],
        ),
      ],
    );
  }
}
