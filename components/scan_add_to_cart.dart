import 'package:flutter/material.dart';
import 'package:enroute/components/light_colors.dart';
import 'scan_product.dart';
import 'constants_scan.dart';
import 'package:flutter/cupertino.dart';


class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: LightColors.kMyFavGreen,
              ),
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon (Icons.monetization_on, color: LightColors.kMyFavGreen,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: Text("Claim your point", style: TextStyle(
                            fontFamily: "Bryndan"
                        ),),
                        content: Text("After performing the combination, this is how you would be able to claim your point.",style:
                        TextStyle(fontFamily:"Bryndan")
                          ,),
                        actions: <Widget>[

                          CupertinoDialogAction(
                            child: Text("Receive my point", style: TextStyle(fontFamily: "Bryndan"),),
                            onPressed: () {
                              showDialog(context: context,
                                builder: (_) => CupertinoAlertDialog(
                                  title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                                  content: Text("Your point is active in the EnRoute Online Shop.",style: TextStyle(
                                    fontFamily: "Bryndan",
                                  ),),
                                ),
                              );
                            },

                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: product.color,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: Text("Add to cart", style: TextStyle(
                        fontFamily: "Bryndan"
                    ),),
                    content: Text("Here you would be able to add the product to cart and continue to check-out.",style:
                    TextStyle(fontFamily:"Bryndan")
                      ,),
                    actions: <Widget>[

                      CupertinoDialogAction(
                        child: Text("Continue to check-out", style: TextStyle(fontFamily: "Bryndan"),),
                        onPressed: () {
                          showDialog(context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                              content: Text("You will be redirected to check-out.",style: TextStyle(
                                fontFamily: "Bryndan",
                              ),),
                            ),
                          );
                        },

                      ),
                      CupertinoDialogAction(
                        child: Text("Stay here", style: TextStyle(fontFamily: "Bryndan"),),
                        onPressed: () {
                          showDialog(context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title:Text("Thank you",style: TextStyle(fontFamily: "Bryndan"),),
                              content: Text("You can look for more eco-friendly products.",style: TextStyle(
                                fontFamily: "Bryndan",
                              ),),
                            ),
                          );
                        },

                      ),
                    ],
                  ),
                );
              },
              child: Text(
                "Add to cart".toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: LightColors.kMyFavGreen,
                  fontFamily: "Bryndan",
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
