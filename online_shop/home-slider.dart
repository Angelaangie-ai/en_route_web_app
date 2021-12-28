import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'responsive.dart';
import 'package:enroute/components/light_colors.dart';
class HomeSlider extends StatelessWidget{

  double sliderHeight = 500;
  double sliderHeaderFontSize=60;
  List<String> listImage = List();
  List<String> listBannerTitle = List();
  HomeSlider(BuildContext context){
    bannerList();
    bannerTitle();
    setUp(context);
  }

  setUp(context){
    if (ResponsiveLayout.isLargeScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height/2;
      sliderHeaderFontSize=60;
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height/2;
      sliderHeaderFontSize=30;
    } else {
      sliderHeight = MediaQuery.of(context).size.height/2;
      sliderHeaderFontSize=20;
    }
  }

  void bannerTitle() {
    listBannerTitle.add("EnRoute Online Shop");
  }

  void bannerList() {
    listImage.add("banner/Banner.png");
  }
  @override
  Widget build(BuildContext context) {
    return sliderSection(context);
  }

  sliderSection(context) {
    return Stack(
      children: <Widget>[
        Container(
          height: sliderHeight,
          child: PageView.builder(
            itemBuilder: (context, position) {
              return createSlider(position);
            },
            itemCount: listImage.length,
          ),
        ),
      ],
    );
  }

  createSlider(position) {
    var alignment;
    var crossAxisAlignment;
    var textAlign;
    if (position == 0) {
      alignment = Alignment.center;
      textAlign = TextAlign.center;
      crossAxisAlignment = CrossAxisAlignment.center;
    } else if (position == 1) {
      alignment = Alignment.topLeft;
      textAlign = TextAlign.start;
      crossAxisAlignment = CrossAxisAlignment.start;
    } else {
      alignment = Alignment.topRight;
      textAlign = TextAlign.end;
      crossAxisAlignment = CrossAxisAlignment.end;
    }
    return Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image(
                image: AssetImage(listImage[position]),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: alignment,
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: crossAxisAlignment,
                children: <Widget>[
                  Text(
                    listBannerTitle[position],
                    textAlign: textAlign,
                    style: TextStyle(
                      fontFamily: "Bryndan",
                      color: LightColors.kMyFavGreen,
                      fontSize: 45,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 4,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
          ],
        ));
  }

}