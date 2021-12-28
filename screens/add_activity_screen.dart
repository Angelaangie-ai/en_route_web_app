import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:enroute/components/activity_data.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math'show cos,sqrt,asin;

class AddActivityScreen extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  static final kFinalPosition = LatLng(-33.8567844, 151.213108);

  @override
  _AddActivityScreenState createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  bool busVal = false;
  bool carVal = false;
  bool footVal = false;
  bool bycVal = false;
  bool taxVal = false;
  bool planeVal = false;
  bool noVal = false;
  bool yesVal = false;

  TimeOfDay _startTime = new TimeOfDay.now();
  TimeOfDay _endTime = new TimeOfDay.now();

  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _startTime);
    if (picked != null && picked != _startTime) {
      print("Time selected: ${_startTime.toString()}");
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _endTime);
    if (picked != null && picked != _endTime) {
      print("Time selected: ${_endTime.toString()}");
      setState(() {
        _endTime = picked;
      });
    }
  }

  PickResult selectedPlace;
  PickResult finalPlace;
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;

  final Geolocator _geolocator = Geolocator();
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    String newPriceTitle;
    String newActivityTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Add a New Activity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                    fontFamily: "Pacifico",
                  ),
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (newText) {
                      newActivityTitle = newText;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Preferred methods:",
                  style: TextStyle(color: Colors.green, fontSize: 10.0),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Bus",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Checkbox(
                      value: busVal,
                      onChanged: (bool value) {
                        setState(() {
                          busVal = value;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Car",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),
                    Checkbox(
                        value: carVal,
                        onChanged: (bool value) {
                          setState(() {
                            carVal = value;
                          });
                        }),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Bike",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),
                    Checkbox(
                        value: bycVal,
                        onChanged: (bool value) {
                          setState(() {
                            bycVal = value;
                          });
                        }),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Foot",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),
                    Checkbox(
                        value: footVal,
                        onChanged: (bool value) {
                          setState(() {
                            footVal = value;
                          });
                        }),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Plane",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),
                    Checkbox(
                        value: planeVal,
                        onChanged: (bool value) {
                          setState(() {
                            planeVal = value;
                          });
                        }),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Select Time of start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    _selectStartTime(context);
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                FlatButton(
                  child: Text(
                    'Select time of ending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    _selectEndTime(context);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Enter Place of Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                  ),
                  color:Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: missing_return
                        builder: (context) {
                          return PlacePicker(
                              apiKey: "AIzaSyCNLj4uFpJoWrXhl9DVFO5FtR0H9IgrgCU",
                              initialPosition:
                                  AddActivityScreen.kInitialPosition,
                              useCurrentLocation: true,
                              selectInitialPosition: true,
                              usePlaceDetailSearch: true,
                              onPlacePicked: (result) {
                                selectedPlace = result;
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                              forceSearchOnZoomChanged: true,
                              automaticallyImplyAppBarLeading: false,
                              autocompleteLanguage: "ko",
                              region: 'au',
                              // ignore: missing_return
                              selectedPlaceWidgetBuilder: (_, selectedPlace,
                                  state, isSearchBarFocused) {
                                print(
                                    "state: $state, isSearchBarFocused: $isSearchBarFocused");
                                return isSearchBarFocused
                                    ? Container()
                                    : FloatingCard(
                                        bottomPosition: 0.0,
                                        leftPosition: 0.0,
                                        rightPosition: 0.0,
                                        width: 500,
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: state == SearchingState.Searching
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : RaisedButton(
                                          color: Colors.green,
                                                child: Text("Pick Here",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),),
                                          onPressed: () {
                                            // ignore: unnecessary_statements
                                            var lat1 = selectedPlace.geometry.location.lat;
                                            print (lat1);
                                           // ignore: unnecessary_statements
                                            var lon1 = selectedPlace.geometry.location.lng;
                                            print(lon1);
                                            LatLng(lat1,lon1);

                                            Navigator.of(context).pop();
                                                },
                                              ),
                                            );
                                          },
                            // pinBuilder: (context, state) {
                            //   if (state == PinState.Idle) {
                            //     return Icon(Icons.favorite_border);
                            //   } else {
                            //     return Icon(Icons.favorite);
                            //   }
                            // },
                                        );
                        },
                      ),
                    );
                  },
                ),
                selectedPlace == null ? Container() : Text(selectedPlace.formattedAddress ?? ""),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  child: Text("Enter Place of End",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                  color:Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: missing_return
                        builder: (context) {
                          return PlacePicker(
                            apiKey: "AIzaSyCNLj4uFpJoWrXhl9DVFO5FtR0H9IgrgCU",
                            initialPosition:
                            AddActivityScreen.kFinalPosition,
                            useCurrentLocation: true,
                            selectInitialPosition: true,
                            usePlaceDetailSearch: true,
                            onPlacePicked: (result) {
                              finalPlace = result;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            forceSearchOnZoomChanged: true,
                            automaticallyImplyAppBarLeading: false,
                            autocompleteLanguage: "mk",
                            //region: 'au',
                            // ignore: missing_return
                            selectedPlaceWidgetBuilder: (_, selectedPlace,
                                state, isSearchBarFocused) {
                              print(
                                  "state: $state, isSearchBarFocused: $isSearchBarFocused");
                              return isSearchBarFocused
                                  ? Container()
                                  : FloatingCard(
                                bottomPosition: 0.0,
                                leftPosition: 0.0,
                                rightPosition: 0.0,
                                width: 500,
                                borderRadius:
                                BorderRadius.circular(12.0),
                                child: state == SearchingState.Searching
                                    ? Center(
                                    child:
                                    CircularProgressIndicator())
                                    : RaisedButton(
                                  child: Text("Pick Here"),
                                  onPressed: () {
                                    var lat2 = finalPlace.geometry.location.lat;
                                    print (lat2);
                                    // ignore: unnecessary_statements
                                    var lon2 = finalPlace.geometry.location.lng;
                                    print(lon2);
                                    LatLng(lat2,lon2);

                                    print(finalPlace);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              );
                            },
                            // pinBuilder: (context, state) {
                            //   if (state == PinState.Idle) {
                            //     return Icon(Icons.favorite_border);
                            //   } else {
                            //     return Icon(Icons.favorite);
                            //   }
                            // },
                          );
                        },
                      ),
                    );
                  },
                ),

                finalPlace == null ? Container() : Text(finalPlace.formattedAddress ?? ""),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Maximum price:",
                  style: TextStyle(color: Colors.green, fontSize: 10.0),
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (newText) {
                      newPriceTitle = newText;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Is this activity flexible?",
                  style: TextStyle(color: Colors.green, fontSize: 10.0),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),
                    Checkbox(
                        value: yesVal,
                        onChanged: (bool value) {
                          setState(() {
                            yesVal = value;
                          });
                        }),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "No",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                      ),
                    ),
                    Checkbox(
                        value: noVal,
                        onChanged: (bool value) {
                          setState(() {
                            noVal = value;
                          });
                        }),
                  ],
                ),
              ],
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
              color: Colors.green,
              onPressed: () {
                Provider.of<ActivityData>(context).addActivity(
                    _endTime.toString(),
                    _startTime.toString(),
                    newPriceTitle,
                    newActivityTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
