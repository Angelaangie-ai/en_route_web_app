import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popup_box/popup_box.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Targets',
          style: TextStyle(
            fontFamily: "Bryndan",
          ),
        ),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height - 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xFFCBF97E), Colors.green],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)
                    ), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Container(
                              child: Text('Be a shopping hero', style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          //subText
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Get a track on these targets',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20.0,
                                  ),),
                              Text(
                                  'to shop more eco-friendly',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20.0,
                                  ),),
                              ],
                            ),

                          ),
                          //Circle Avatar

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('                     Actvity', style: TextStyle(
                                  fontFamily: "Bryndan",
                                  color: Color(0XFF117C12),
                                ),),
                              ),
                              DataColumn(
                                label: Text('€  kgCO2', style: TextStyle(
                                  fontFamily: "Bryndan",
                                  color: Color(0XFF117C12),
                                  fontSize: 1.0,
                                ),),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                        child: myRowDataIcon(
                                            FontAwesomeIcons.shoppingBag, "Reusable Bags"),
                                        onTap: () async {
                                          await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text ("Reusable Bags can reduce waste and eliminate the energy to make packaging. They also help you to save money in the countries where retailers charge for extra bag.",style: TextStyle(
                                                color: Color(0XFF117C12),
                                                fontSize: 15.0,
                                                fontFamily: 'Pacifico'
                                              ),),
                                              button: MaterialButton(
                                              shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                          ),
                                          color: Colors.green,
                                          child: Text(
                                          'I am going to buy one!',
                                          style: TextStyle(fontSize: 15,fontFamily: 'Pacifico'),
                                          ),
                                                 onPressed: () {
                                                   Navigator.of(context).pop();
                                                 },
                                          ),
                                          );
                                        }
                                      ),
                                    ),
                                    DataCell(
                                      Text('17     22',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                              FontAwesomeIcons.batteryFull, "Re-Battery",),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text (" Rechargeable batteries save resources, energy, money and waste.",
                                                style: TextStyle(
                                                fontFamily: "Pacifico",
                                                color: Color(0XFF117C12),
                                                fontSize: 20.0,
                                              ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'Yaay',
                                                  style: TextStyle(fontSize: 15,
                                                  fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('532    208',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                            FontAwesomeIcons.recycle, "Recycle Goods",),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text ("Recycling metal, paper and plastic eliminates the need to mine raw materials, as well as the energy used to process rock, wood and petroleum into finished products. "
                                                  ,
                                                style: TextStyle(
                                                  fontFamily: "Pacifico",
                                                  color: Color(0XFF117C12),
                                                  fontSize: 15.0,
                                                ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'Bye, I have to recycle!',
                                                  style: TextStyle(fontSize: 15,
                                                  fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('17    1135',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                            ],
                          ),

                          //Button

                        ],),
                    ],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38),Color(0xFFCBF97E)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)
                    ), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Container(
                              child: Text('Be a hero at home', style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          //subText
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Get a track on these targets',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20.0,
                                  ),),
                                Text(
                                  'to live more eco-friendly',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20.0,
                                  ),),
                              ],
                            ),

                          ),
                          //Circle Avatar

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('                     Actvity', style: TextStyle(
                                  fontFamily: "Pacifico",
                                  color: Color(0XFF117C12),
                                ),),
                              ),
                              DataColumn(
                                label: Text('€  kgCO2', style: TextStyle(
                                  fontFamily: "Pacifico",
                                  color: Color(0XFF117C12),
                                  fontSize: 13.0,
                                ),),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                              FontAwesomeIcons.shower, "Speed Shower"),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text ("Shorter showers help you to save water, energy and the sanity of anyone waiting to get in the bathroom.",style: TextStyle(
                                                  color: Color(0XFF117C12),
                                                  fontSize: 15.0,
                                                  fontFamily: 'Pacifico'
                                              ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'Sing in bedroom from now!',
                                                  style: TextStyle(fontSize: 15,fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('17       89',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                            FontAwesomeIcons.lightbulb, "Lights off",),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text (" The simplest way to be a hero is just to flip the lights when you are not using them.",
                                                style: TextStyle(
                                                  fontFamily: "Pacifico",
                                                  color: Color(0XFF117C12),
                                                  fontSize: 15.0,
                                                ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'Parents were right!',
                                                  style: TextStyle(fontSize: 15, fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('126    907',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                            FontAwesomeIcons.handsWash, "Cold Washing",),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text ("It takes a lot of energy to heat up the water used. Most dish "
                                                  "and hand soaps work well in cold water. "
                                                ,
                                                style: TextStyle(
                                                  fontFamily: "Pacifico",
                                                  color: Color(0XFF117C12),
                                                  fontSize: 15.0,
                                                ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'My hands will thank me!',
                                                  style: TextStyle(fontSize: 15,fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('42     216',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                            ],
                          ),

                          //Button

                        ],),
                    ],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Colors.green,Color(0xffebac38)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)
                    ), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Container(
                              child: Text('Invest like a hero', style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          //subText
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Get a track on these targets to make',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20.0,
                                  ),),
                                Text(
                                  'more eco-friendly investments',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20.0,
                                  ),),
                              ],
                            ),

                          ),
                          //Circle Avatar

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('                     Actvity', style: TextStyle(
                                  fontFamily: "Pacifico",
                                  color: Color(0XFF117C12),
                                ),),
                              ),
                              DataColumn(
                                label: Text('€  kgCO2', style: TextStyle(
                                  fontFamily: "Pacifico",
                                  color: Color(0XFF117C12),
                                  fontSize: 13.0,
                                ),),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                              FontAwesomeIcons.car, "Electric Car"),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text ("Fully electric vehicles have 100% torque so they accelerate faster "
                                                  "than conventional.They are much safer and easier to drive. ",style: TextStyle(
                                                  color: Color(0XFF117C12),
                                                  fontSize: 15.0,
                                                  fontFamily: 'Pacifico'
                                              ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'No more noise!',
                                                  style: TextStyle(fontSize: 15,fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('1437 6350',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                            FontAwesomeIcons.solarPanel, "Solar Energy",),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text ("Installing solar photovoltaic (PV) panels is a great way to eliminate your electricity bill while "
                                                  "producing your own clean energy.",
                                                style: TextStyle(
                                                  fontFamily: "Pacifico",
                                                  color: Color(0XFF117C12),
                                                  fontSize: 15.0,
                                                ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'Use the power of the sun!',
                                                  style: TextStyle(fontSize: 15, fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('860    6350',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      GestureDetector(
                                          child: myRowDataIcon(
                                            FontAwesomeIcons.bicycle, "Bicycle",),
                                          onTap: () async {
                                            await PopupBox.showPopupBox(context: context,
                                              willDisplayWidget: Text ("Great way to save lots of energy, gas money, parking fees, and "
                                                  "and even time in rush-hours. "
                                                ,
                                                style: TextStyle(
                                                  fontFamily: "Pacifico",
                                                  color: Color(0XFF117C12),
                                                  fontSize: 15.0,
                                                ),),
                                              button: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                color: Colors.green,
                                                child: Text(
                                                  'Plus, it keeps me in shape!',
                                                  style: TextStyle(fontSize: 15,fontFamily: 'Pacifico'),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    DataCell(
                                      Text('143      90',
                                        style: TextStyle(
                                          color:Color(0XFF117C12),
                                        ),),
                                    ),

                                  ]
                              ),
                            ],
                          ),

                          //Button

                        ],),
                    ],),
                ),
              ),
              //Second ListView
              //Third ListView
            ],
          ),
        ),
      ),
    );
  }
}

ListTile myRowDataIcon(IconData iconVal, String rowVal) {
  return ListTile(
    leading: Icon(iconVal,
        color: new Color(0xffffffff)),
    title: Text(rowVal, style: TextStyle(
      color: Colors.white,
    ),),
  );
}