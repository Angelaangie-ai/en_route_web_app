import 'package:flutter/material.dart';
import 'constants_scan.dart';
import 'scan_product.dart';
import 'light_colors.dart';
import 'scan_add_to_cart.dart';
import 'scan_color_and_size.dart';
import 'scan_description.dart';
import 'scan_counter.dart';
import 'scan_product_image.dart';
import 'package:flutter/cupertino.dart';



class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.10,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: 20),
                      Description(product: product),
                      SizedBox(height: 24),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product),
                      SizedBox(
                        height: 20,
                        child: FlatButton(
                          onLongPress: () {
                            showDialog(context: context,
                              builder: (_) => CupertinoAlertDialog(
                                title:Text("Here you would be able to scan to see the shops where the item is available.",style: TextStyle(fontFamily: "Bryndan"),),
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: product.color,
                          onPressed: () {
                          },
                          child: Text(
                            "See the shop locator",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: LightColors.kMyFavGreen,
                              fontFamily: "Bryndan",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
