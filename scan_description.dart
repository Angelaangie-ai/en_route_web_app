import 'package:flutter/material.dart';
import 'constants_scan.dart';
import 'scan_product.dart';


class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        product.description,
        style: TextStyle(fontSize: 18, fontFamily: "Bryndan"),
      ),
    );
  }
}
