import 'package:enroute/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:enroute/components/restaurant.dart';
import 'package:enroute/components/restaurant_star.dart';
import 'package:enroute/components/light_colors.dart';


void main() => runApp(MyApp());
List<String> buttonsTitle = ["All", "Vegan", "Veggie", "Healthy", "Eco"];
List<String> restaurantList = [
  "Healthy Food and Drinks",
  "Vegan Restaurant",
  "Fruit Juice Bar",
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Bryndan',
      ),
      home: Home(),
      routes: {
        'restaurant': (ctx) => RestaurantPage(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.kMyFavGreen,
        title: Text("Choose your eco-friendly dish",style: TextStyle(
          fontFamily: "Bryndan",
          color: LightColors.kLighterGreen,
        ),),
         leading: BackButton(
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => HomePage()),
             );
           } ,
         ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a dish and restaurant",
                    hintStyle: TextStyle(fontFamily: "Bryndan"),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, id) {
                      return LargeContainer();
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey[100]),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                CategoriesList(),
                SizedBox(height: 15.0),
                Container(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, id) {
                      return SmallContainer(text: restaurantList[id]);
                    },
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LargeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'restaurant'),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(0, 3),
              color: Colors.grey[300],
            ),
          ],
        ),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: Image.asset("assets/images/avocadosan1.jpg"),
              borderRadius: BorderRadius.circular(15.0),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              "Avocado-based vegan sandwich",
              style: TextStyle(
                fontFamily: "Bryndan",
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.pin_drop,
                  color: Colors.grey[350],
                ),
                Text(
                  "3km from you",
                  style: TextStyle(
                    fontFamily: "Bryndan",
                    color: Colors.grey[400],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 3,
                  child: FittedBox(
                    child: StarDisplay(
                      value: 4,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  final String text;
  const SmallContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'restaurant'),
        child: Container(
          height: 400,
          width: 240,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 3),
                color: Colors.grey[300],
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: Image.asset("assets/images/orange.jpg"),
                borderRadius: BorderRadius.circular(15.0),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 15, fontFamily: "Bryndan"),
              ),
              SizedBox(
                height: 9.0,
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
                    width: 5,
                  ),
                  Text(
                    "5.0",
                    style: TextStyle(
                      fontFamily: "Bryndan",
                      color: Colors.grey[700],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: Colors.grey[400],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final bool active;
  final String title;
  final onTap;
  const MyCustomButton({Key key, this.active, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 115,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: !active ? Border.all(color: Colors.grey[100]) : null,
            borderRadius: BorderRadius.circular(21.0),
            gradient: active
                ? LinearGradient(colors: [LightColors.kMyFavGreen, LightColors.kLighterGreen])
                : null,
            color: active ? null : Colors.white,
            boxShadow: [
              active
                  ? BoxShadow(
                color: LightColors.kLighterGreen,
                offset: Offset(0, 3),
                blurRadius: 5.0,
              )
                  : BoxShadow()
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}


class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: buttonsTitle.length,
        itemBuilder: (BuildContext context, int id) {
          return MyCustomButton(
            title: buttonsTitle[id],
            active: id == _active ? true : false,
            onTap: () {
              setState(() {
                _active = id;
              });
            },
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
