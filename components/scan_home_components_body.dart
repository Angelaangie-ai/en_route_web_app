import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants_scan.dart';
import 'scan_product.dart';
import 'package:enroute/screens/scan_details_screen.dart';
import 'light_colors.dart';

import 'scan_categories.dart';
import 'scan_item_Card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "This product is sustainable on a medium scale",
              style: TextStyle(
                fontFamily: "Bryndan",
                fontSize: 25,
                color: LightColors.kMyFavGreen,
              ),
            ),
          ),
        ),
        SizedBox(height: 9,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset('assets/images/application picture.jpg',
              fit: BoxFit.fitWidth,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Text(
            "Buy similar products that are cheaper and more sustainable:",
            style: TextStyle(
              fontFamily: "Bryndan",
              fontSize: 18,
              color: LightColors.kMyFavGreen,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50,0,50,0),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      )),
                )),
          ),
        ),
      ],
    );
  }
}
