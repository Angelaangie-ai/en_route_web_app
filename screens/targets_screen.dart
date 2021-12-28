import 'package:flutter/material.dart';

class TargetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Center(child: Text('Targets',
        style: TextStyle(
        fontFamily: "Pacifico",
      ),
    ),
    ),
    ),
      body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: Table(
                border: TableBorder(
                  top: BorderSide(width: 5.0, color: Color(0xFF24D876),),
                  bottom: BorderSide(width: 5.0, color: Color(0xFF24D876)),
                  right: BorderSide(width: 5.0, color: Color(0xFF24D876)),
                  left: BorderSide(width: 5.0, color: Color(0xFF24D876)),
                  horizontalInside: BorderSide(width: 2.0, color: Colors.green),
                  verticalInside: BorderSide(width: 2.0, color: Colors.green)
                ),
                columnWidths:
                {0: FractionColumnWidth(.1),
                  1: FractionColumnWidth(.4),
                  2: FractionColumnWidth(.2),
                  4: FractionColumnWidth(.1)},
                children: [
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Activity",textScaleFactor: 1.7, )),
                    Center(child: Text("€ Euros", textScaleFactor: 1.6,)),
                    Center(child: Text("kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Cold Water Laundry", )),
                    Center(child: Text("42 €",)),
                    Center(child: Text("226 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Cold Washing", )),
                    Center(child: Text("42 €",)),
                    Center(child: Text("216 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Electric Vehicle", )),
                    Center(child: Text("1437 €",)),
                    Center(child: Text("6350 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Rechargable Battery", )),
                    Center(child: Text("532 €",)),
                    Center(child: Text("208 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Plant Trees", )),
                    Center(child: Text("50 €",)),
                    Center(child: Text("317 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Reusable Bags", )),
                    Center(child: Text("17 €",)),
                    Center(child: Text("22 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Eat Organic", )),
                    Center(child: Text("-126 €",)),
                    Center(child: Text("89 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Speedy Showers", )),
                    Center(child: Text("17 €",)),
                    Center(child: Text("89 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Recycle", )),
                    Center(child: Text("17 €",)),
                    Center(child: Text("1135 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Bicycle", )),
                    Center(child: Text("143 €",)),
                    Center(child: Text("90 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Renewable Energy", )),
                    Center(child: Text("-84 €",)),
                    Center(child: Text("3000 kg CO2 e",)),
                  ]),
                  TableRow( children: [
                    Text(" "),
                    Center(child: Text("Lights off", )),
                    Center(child: Text("126 €",)),
                    Center(child: Text("907 kg CO2 e",)),
                  ]),
                ],
              ),
            ),
          ])),
    );
  }
}

