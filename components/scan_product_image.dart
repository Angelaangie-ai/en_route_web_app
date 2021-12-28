import 'package:flutter/material.dart';
import 'constants_scan.dart';
import 'scan_product.dart';
import 'light_colors.dart';


class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Choose a more sustainable brand:",
            style: TextStyle(color: LightColors.kMyFavGreen, fontFamily: "Bryndan", fontSize: 18),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: LightColors.kMyFavGreen, fontWeight: FontWeight.bold,fontFamily: "Bryndan"),
          ),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price:\n",style:
                    TextStyle(fontFamily: "Bryndan", color: LightColors.kMyFavGreen, fontSize: 18),
                    ),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: LightColors.kMyFavGreen, fontWeight: FontWeight.bold,fontFamily: "Bryndan"),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  scale: 0.55,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
