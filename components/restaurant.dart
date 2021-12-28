import 'package:flutter/material.dart';
import 'restaurant_star.dart';
import 'light_colors.dart';

class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ecorest.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RoundButton(icon: Icons.arrow_back_ios, onTap: (){Navigator.pop(context);},),
                      Spacer(),
                      RoundButton(icon: Icons.favorite_border),
                      SizedBox(width: 5.0),
                      RoundButton(icon: Icons.ac_unit),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.pin_drop,
                          color: Colors.grey[400],
                        ),
                        Text(
                          "3KM From You",
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Healthy Food and Drinks",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "5.0",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StarDisplay(
                          value: 5,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 21),
                      padding: EdgeInsets.all(15),
                      color: Color(0xfff7f8fc),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: ClipRRect(
                              child: Image.asset('assets/imgs/lobster.jpg'),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: ClipRRect(
                              child: Image.asset('assets/imgs/meat.jpg'),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: ClipRRect(
                              child: Image.asset('assets/imgs/lobster.jpg'),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [LightColors.kLighterGreen, LightColors.kMyFavGreen],
                            ),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: LightColors.kLighterGreen)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Text(
                              "Call this restaurant",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final onTap;
  const RoundButton({Key key, this.icon, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      padding: EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onTap,
      ),
      height: 50,
      width: 50,
    );
  }
}
