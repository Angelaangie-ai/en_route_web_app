import 'point_product.dart';
import 'point_single_order.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  // Products' images
  static const String classicLatte = 'assets/images/classic_latte.png';
  static const String espresso = 'assets/images/espresso.png';

  final List<Product> ordersList = [
    Product(
      id: 1,
      name: 'Latte',
      price: '7 points',
      size: 'Large',
      flavor: 'Caramel',
      topping: 'Wipped Cream',
      imagePath: classicLatte,
    ),
    Product(
      id: 5,
      name: 'Double Espresso',
      price: '10 points',
      size: 'Small',
      flavor: 'None',
      topping: 'None',
      imagePath: espresso,
    ),
  ];

  Widget _ordersColumn(Product first, Product second) {
    return Column(
      children: [
        SingleOrder(product: first),
        SingleOrder(product: second),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ordersColumn(ordersList[0], ordersList[1]);
  }
}
