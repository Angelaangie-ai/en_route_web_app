import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'style.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:core';
import 'current_location.dart';
import 'crud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'attachment-icon.dart';
import 'landing.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';
import 'package:place_picker/place_picker.dart';
import 'package:geocoding/geocoding.dart' as l2;




bool ring = false;
DateTime notifiedTime;
DateTime startTime;

class AddTask extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  static final kFinalPosition = LatLng(-33.8567844, 151.213108);
  static String tag = "add-task";
  final bool update;
  final String updateDocId;
  AddTask({Key key, this.update, this.updateDocId, }) : super(key: key);
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
LocationResult startLocation;
LocationResult endLocation;

  var customLocation;
  void showPlacePicker() async {
     startLocation = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyCNLj4uFpJoWrXhl9DVFO5FtR0H9IgrgCU",
              displayLocation: customLocation,
            )));

    // Handle the result in your way
     setState(() {});
    print (startLocation.latLng);
  }
  void showPlacePicker1() async {
     endLocation = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyCNLj4uFpJoWrXhl9DVFO5FtR0H9IgrgCU",
              displayLocation: customLocation,
            )));

    // Handle the result in your way
     setState(() {});
     print(endLocation.latLng);
  }
String calculateDistance(LatLng latLng1, LatLng latLng2){
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((latLng2.latitude - latLng2.latitude) * p)/2 +
      c(latLng1.latitude * p) * c(latLng2.latitude * p) *
          (1 - c((latLng2.longitude - latLng1.longitude) * p))/2;
  final res = 12742 * asin(sqrt(a));
  return "$res km";
}
String calculateEmissions(LatLng latLng1, LatLng latLng2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((latLng2.latitude - latLng2.latitude) * p)/2 +
      c(latLng1.latitude * p) * c(latLng2.latitude * p) *
          (1 - c((latLng2.longitude - latLng1.longitude) * p))/2;
  final re = 12742 * asin(sqrt(a));
  final res = (5*2392)/re;
  final result = res/1000;
  final resul = result.round();
  return "Info: This activity produces $resul g CO2 emissions";
}

  bool busVal = false;
  bool carVal = false;
  bool footVal = false;
  bool bycVal = false;
  bool taxVal = false;
  bool planeVal = false;
  bool noVal = false;
  bool yesVal = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  String taskTitle, taskDetail, category;
  String bus;

  var tasks;

  crudMedthods crudObj = new crudMedthods();

  String docId;
  final double _initFabHeight = 120.0;
  double _fabHeight;

  @override
  void initState() {
    getInfo();
    getLocation();
    initializeNotifications();
    docId = widget.updateDocId;
    _fabHeight = _initFabHeight;

    super.initState();
  }

  String fbId;
  var loginType, twId;

  getInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginType = prefs.getString('loginType');
    });
    print("logintype ...................$loginType");
    if(loginType == 'fb'){
      setState(() {
        fbId = prefs.getString('fbId');
      });
      print('fbbuser $fbId');
    }else if(loginType == 'tw'){
      setState(() {
        twId = prefs.getString('twId');
      });
      print('twuser $twId');
    }else {
      final FirebaseUser userProfile = await FirebaseAuth.instance.currentUser;
      if (userProfile != null) {
        uid = userProfile.uid;
      }
      print('user name ....................$uid');
    }
    crudObj.getTaskData(docId, loginType == 'fs' ? uid : loginType == 'fb' ? fbId : twId).then((results) {
      setState(() {
        tasks = results;
      });
    });
  }

  TimeOfDay time = new TimeOfDay.now();
  TimeOfDay _startTime = new TimeOfDay.now();
  TimeOfDay selectedTime = new TimeOfDay.now();
  TimeOfDay _endTime = new TimeOfDay.now();

  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked =
    await showTimePicker(context: context, initialTime: _startTime);
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }
  String formatTimeOfDay(TimeOfDay _startTime) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, _startTime.hour, _startTime.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
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
  String formatTimeOfDay1(TimeOfDay _endTime) {
    final now1 = new DateTime.now();
    final dt1 = DateTime(now1.year, now1.month, now1.day, _endTime.hour, _endTime.minute);
    final format1 = DateFormat.jm();  //"6:00 AM"
    return format1.format(dt1);
  }

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  LatLng LatLng1;

//  DateTime now = new DateTime.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        selectedTime = picked;
      });
      print("selected time $selectedTime ");
    }
  }


  FlutterLocalNotificationsPlugin localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
  }


  Future singleNotification(
      DateTime datetime, String message, String subtext, int hashcode,
      {String sound}) async {
    var androidChannel = AndroidNotificationDetails(
      'channel-id',
      'channel-name',
      'channel-description',
      importance: Importance.Max,
      priority: Priority.Max,
    );

    var iosChannel = IOSNotificationDetails();
    var platformChannel = NotificationDetails(androidChannel, iosChannel);
    localNotificationsPlugin.schedule(
        hashcode, message, subtext, datetime, platformChannel,
        payload: hashcode.toString());
  }

  var formatter = new DateFormat('yyyy-MM-dd');
  bool calender = false,
      chat = false,
      attach = false,

      starMark = false,
      mic = false;
  String error;

  bool currentWidget = true;
  TimeOfDay _time = new TimeOfDay.now();
  Image image1;

  String dateNow = DateFormat('hh:mm aa - EEE d MMM').format(DateTime.now());
  String starTime = DateFormat('hh:mm aa - EEE d MMM').format(DateTime.now());

  final f = new DateFormat('yyyy-month-dd');
  DateTime _date = new DateTime.now();

  DateTime selectedDate;
  String dueDate;


  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2020),
    );
    if (picked != null && picked != _date) {
      setState(() {
        selectedDate = picked;
        dueDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
      print('Date selected: $dueDate');

    }
  }

  bool selectCategory = false;
  bool _value = false;
  onChanged(bool value) {
    setState(
          () {
        _value = value;
      },
    );
  }

  String uid;

  bool visibilityTag = false;
  bool visibilityObs = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        visibilityTag = visibility;
      }
      if (field == "obs") {
        visibilityObs = visibility;
      }
    });
  }

  static File _photoFile;
  static File _imageFile;

  takeImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      attach = true;
      _photoFile = image;
      count++;
    });
  }

  int count = 1;

  selectImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      attach = true;
      _imageFile = image;
      count++;
    });
  }

  String _filePath;

  void getFilePath() async {
    String filePath = await FilePicker.getFilePath(type: FileType.ANY);
    if (filePath == '') {
      return;
    }
    setState(() {
      this._filePath = filePath;
    });
  }

  void getAudio() async {
    String filePath = await FilePicker.getFilePath(type: FileType.AUDIO);
    if (filePath == '') {
      return;
    }
    setState(() {
      this._filePath = filePath;
    });
  }

  var currentLocation = LocationData;
  var location = new Location();
  var lat, lng;
  var lat1, lng1;
  var lat2, lng2;

  Distance(double lat1, double lng1, double lat2, double lng2) {
    double PI_RAD = 3.1415926535897932 / 180.0;
    double phi1 = lat1 * PI_RAD;
    double phi2 = lat2 * PI_RAD;
    double lam1 = lng1 * PI_RAD;
    double lam2 = lng2 * PI_RAD;

    return 6371.01 * acos(sin(phi1) * sin(phi2) + cos(phi1) * cos(phi2) * cos(lam2 - lam1));
  }


  getLocation() async {
    try {
      location.onLocationChanged().listen((LocationData currentLocation) {
        lat = currentLocation.latitude;
        lng = currentLocation.longitude;
        print('lattttttttttttttttt ${currentLocation.latitude}');
        print('loooongggggggggggggg ${currentLocation.longitude}');
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      }
      currentLocation = null;
    }
  }


  uploadDocs() async {
    if (_imageFile != null && _photoFile != null) {
      final Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('docs${loginType == 'fs' ? uid : loginType == 'fb' ? fbId : twId}/image$count.jpg');
      final UploadTask task = firebaseStorageRef.putFile(_imageFile);
      final Reference firebaseStorageRef2 =
      FirebaseStorage.instance.ref().child('docs${loginType == 'fs' ? uid : loginType == 'fb' ? fbId : twId}/images$count.jpg');
      final UploadTask task2 = firebaseStorageRef2.putFile(_photoFile);
    } else if (_imageFile == null && _photoFile == null) {
      return null;
    } else {
      if (_photoFile != null) {
        final Reference firebaseStorageRef2 =
        FirebaseStorage.instance.ref().child('docs${loginType == 'fs' ? uid : loginType == 'fb' ? fbId : twId}/images$count.jpg');
        final UploadTask task2 = firebaseStorageRef2.putFile(_photoFile);
      } else {
        final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('docs${loginType == 'fs' ? uid : loginType == 'fb' ? fbId : twId}/image$count.jpg');
        final UploadTask task = firebaseStorageRef.putFile(_imageFile);
      }
    }
  }

  @override


  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    Widget _taskForm() {
      if (tasks != null) {
        return SingleChildScrollView(
          child: Container(
            child: StreamBuilder(
                stream: tasks,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: <Widget>[
                              Container(
                                padding: EdgeInsetsDirectional.only(start: 10.0),
                                child: TextFormField(
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Activity Title',
                                    hintStyle: hintStyleDark(),
                                  ),
                                  initialValue: widget.update != null ? snapshot.data['taskTitle'] : "",
                                  keyboardType: TextInputType.text,
                                  style: titleStyleBoldLight(),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your Actvity Title';
                                    }
                                  },
                                  onSaved: (value) {
                                    this.taskTitle = value;
                                  },
                                ),
                              ),
                              Divider(
                                color: Colors.grey.shade500,
                                height: 10.0,
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.only(start: 10.0),
                                child: TextFormField(
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Actvity Category',
                                    hintStyle: hintStyleDark(),
                                  ),
                                  keyboardType: TextInputType.text,
                                  style: titleStyleBoldLight(),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your Actvity Category';
                                    }
                                  },
                                  onSaved: (value) {
                                    this.category = value;
                                  },
                                ),
                              ),
                              Divider(
                                color: Colors.grey.shade500,
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Preferred methods:",
                                      style: TextStyle(color: Color(0xFF06630b), fontSize: 14.0, fontFamily: "Bryndan"),
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Bus",
                                        style: TextStyle(
                                          color: Color(0xFF06630b),
                                          fontSize: 12.0,
                                          fontFamily: "Bryndan"
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
                                          color: Color(0xFF06630b),
                                          fontSize: 12.0,
                                          fontFamily: "Bryndan"
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
                                            color: Color(0xFF06630b),
                                            fontSize: 12.0,
                                            fontFamily: "Bryndan"
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
                                            color: Color(0xFF06630b),
                                            fontSize: 12.0,
                                            fontFamily: "Bryndan"
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
                                            color: Color(0xFF06630b),
                                            fontSize: 12.0,
                                            fontFamily: "Bryndan"
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
                              Divider(
                                color: Colors.grey.shade500,
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        'Choose time to start',
                                        style: TextStyle(
                                          color: Color(0xFF06630b),
                                          fontFamily: "Bryndan",
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      color: Color(0xFFD0FFBC),
                                      onPressed: () {
                                        _selectStartTime(context);
                                        startTime = DateTime(
                                          _startTime.hour,
                                          _startTime.minute
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'Choose time to end',
                                        style: TextStyle(
                                          color: Color(0xFF06630b),
                                          fontSize: 14.0,
                                          fontFamily: "Bryndan"
                                        ),
                                      ),
                                      color: Color(0xFFD0FFBC),
                                      onPressed: () {
                                        _selectEndTime(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text("Pick Start location",
                                      style: TextStyle(
                                          color: Color(0xFF06630b),
                                          fontSize: 14.0,
                                          fontFamily: "Bryndan"
                                      ),),
                                    color: Color(0xFFD0FFBC),
                                    onPressed: () {
                                      showPlacePicker();
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  FlatButton(
                                    child: Text("Pick End location",
                                      style: TextStyle(
                                          color: Color(0xFF06630b),
                                          fontSize: 14.0,
                                          fontFamily: "Bryndan"
                                      ),),
                                    onPressed: () {
                                      showPlacePicker1();
                                    },
                                    color: Color(0xFFD0FFBC),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              (startLocation != null && endLocation != null) ? Text(calculateEmissions(startLocation.latLng,endLocation.latLng),
                              style: TextStyle(
                                color: Color(0xFF06630b),
                                  fontSize: 14.0,
                                  fontFamily: "Bryndan",
                              ),) : SizedBox() ,
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InkWell(
                                        child: Column(
                                          children: <Widget>[
                                            Image.asset("images/date.png"),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text("Add Date", style: smallAddressGreySR(),),
                                            )
                                          ],
                                        ),
//                        color: calender ? Colors.blueAccent : Colors.grey.shade400,
                                        onTap: () {
                                          final FormState form = _formKey.currentState;
                                          if (!form.validate()) {

                                          } else {
                                            form.save();
                                            showModalBottomSheet<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() =>
                                                      calender = !calender);
                                                      _selectDate(context);
                                                    },
                                                    child: Container(
                                                        color: Color(0xFF06630b),
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Text(
                                                          'Add a due date',
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: categoryWhite(),
                                                        )),
                                                  );
                                                });
                                          }
                                        }),
                                    InkWell(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset("images/notify.png"),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text("Notify me", style: smallAddressGreySR(),),
                                          )
                                        ],
                                      ),
//                          color: ring ? Colors.red : Colors.grey.shade400,
                                      onTap: () async {
                                        final FormState form = _formKey.currentState;
                                        if (!form.validate()) {

                                        } else {
                                          showModalBottomSheet<void>(
                                              context: context,
                                              builder: (
                                                  BuildContext context) {
                                                return SetTimeDate();
                                              });

                                        }
                                      },
                                    ),
                                    InkWell(
                                        child: Column(
                                          children: <Widget>[
                                            Image.asset("images/attach.png"),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text("Attach", style: smallAddressGreySR(),),
                                            )
                                          ],
                                        ),
                                        onTap: () {
                                          final FormState form = _formKey.currentState;
                                          if (!form.validate()) {

                                          } else {
                                            showModalBottomSheet<void>(
                                                context: context,
                                                builder: (
                                                    BuildContext context) {
                                                  return Container(
                                                    height: 160.0,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        Row(
                                                          children: <Widget>[
                                                            Container(
                                                                color: Color(0xFF06630b),
                                                                width: screenWidth,
                                                                padding: EdgeInsets
                                                                    .all(20.0),
                                                                child: Text(
                                                                  'Add an attachment',
                                                                  textAlign: TextAlign
                                                                      .center,
                                                                  style: categoryWhite(),
                                                                )),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              top: 10.0,
                                                              bottom: 10.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (
                                                                          BuildContext
                                                                          context) =>
                                                                          CurrentLocation(
                                                                            lat: lat,
                                                                            lng: lng,
                                                                          ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: AttachmentIcon(
                                                                  title: "Location",
                                                                  bg: "images/green.png",
                                                                  icon: Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    size: 22.0,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: takeImage,
                                                                child: AttachmentIcon(
                                                                  title: "Camera",
                                                                  bg: "images/orange.png",
                                                                  icon: Icon(
                                                                    Icons
                                                                        .camera_alt,
                                                                    size: 22.0,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: selectImage,
                                                                child: AttachmentIcon(
                                                                  title: "Gallery",
                                                                  bg: "images/blue.png",
                                                                  icon: Icon(
                                                                    Icons.apps,
                                                                    size: 22.0,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          }
                                        }),
                                    InkWell(
                                        child: Column(
                                          children: <Widget>[
                                            Image.asset("images/date.png"),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text("Flexible", style: smallAddressGreySR(),),
                                            )
                                          ],
                                        ),
//                          color: starMark ? secondary : Colors.grey.shade400,
                                        onTap: () {
                                          final FormState form = _formKey.currentState;
                                          if (!form.validate()) {

                                          } else {
                                            showModalBottomSheet<void>(
                                                context: context,
                                                builder: (
                                                    BuildContext context) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      setState(() =>
                                                      starMark = true);
                                                      _scaffoldkey.currentState
                                                          .showSnackBar(
                                                          SnackBar(
                                                            backgroundColor: Colors
                                                                .blueGrey,
                                                            content: Text(
                                                                'Saved as a flexible activity'),
                                                            action: SnackBarAction(
                                                              label: 'ok',
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                              },
                                                            ),
                                                            duration: Duration(
                                                                seconds: 1),
                                                          ));
                                                    },
                                                    child: Container(
                                                        color: Color(0xFF06630b),
                                                        padding: EdgeInsets.all(
                                                            20.0),
                                                        child: Text(
                                                          'Save as a flexible activity',
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: categoryWhite(),
                                                        )),
                                                  );
                                                });
                                          }
                                        }),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: dueDate != null ? Row(
                                  children: <Widget>[
                                    Text("Due Date: ", style: redBoldText(),),
                                    Text(dueDate, style: productTitle(),)
                                  ],
                                ) : Container(),
                              ),

                              Container(
                                padding: EdgeInsetsDirectional.only(start: 10.0),
                                child: TextFormField(
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Write more information about your activity',
                                    hintStyle: hintStyleDark(),
                                  ),
                                  keyboardType: TextInputType.text,
                                  maxLines: 5,
                                  style: subTitleBlack(),
                                  validator: (String value) {
                                  },
                                  onSaved: (value) {
                                    this.taskDetail = value;
                                  },
                                ),
                              ),
                              _imageFile == null
                                  ? Container()
                                  : Container(
                                margin: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.file(
                                      _imageFile,
                                      height: 100.0,
                                      width: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: darkGrey,
                                        size: 16.0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _imageFile = null;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              _photoFile == null
                                  ? Container()
                                  : Container(
                                margin: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.file(
                                      _photoFile,
                                      height: 100.0,
                                      width: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: darkGrey,
                                        size: 16.0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _photoFile = null;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        );
      } else {
        return Container(
          child: CircularProgressIndicator(),
        );
      }
    }


    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(
          "Add New Activity",
          style: titleStyleBoldLight(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close, color: Colors.black87, size: 22.0),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      backgroundColor: Colors.white,
      body: _taskForm(),
      bottomNavigationBar: new Container(
        color: Color(0xFF06630b),
        child: new InkWell(
          onTap: () async {
            final FormState form = _formKey.currentState;
            if (!form.validate()) {

            } else {
              form.save();
              if (widget.update == true) {
                print('11111111 update task');
                try {
                  crudObj.updateData(widget.updateDocId, loginType == 'fs' ? uid : loginType == 'fb' ? fbId : twId, {
                    'taskTitle': this.taskTitle,
                    'taskDetail': this.taskDetail,
                    'priorityTask': starMark,
                    'notify': ring,
                    'dateTime': this.dateNow,
                    'dueDate': this.dueDate,
                    'category': this.category,
                    'completed': false,
                    'attach': this.attach,
                    '_startTime': this.formatTimeOfDay(_startTime),
                    '_endTime': this.formatTimeOfDay1(_endTime),
                    'lat1':this.lat1,
                    'CO2emissions': this.calculateEmissions(startLocation.latLng,endLocation.latLng),

                  });
                  uploadDocs();
                  _scaffoldkey.currentState.showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blueGrey,
                        content: Text('Activity updated successfully!'),
                        duration: Duration(seconds: 1),
                      ));

                  new Future.delayed(const Duration(seconds: 1), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Landing(),
                      ),
                    );
                  });
                } catch (e) {
                  print(e);
                }
              } else {
                try {
                  print('11111111 add task $taskTitle $ring');
                  crudObj.addData(loginType == 'fs' ? uid : fbId,{
                    'taskTitle': this.taskTitle,
                    'taskDetail': this.taskDetail,
                    'priorityTask': starMark,
                    'notify': ring,
                    'dateTime': this.dateNow,
                    'dueDate': this.dueDate,
                    'category': this.category,
                    'completed': false,
                    'attach': this.attach,
                    '_startTime': this.formatTimeOfDay(_startTime),
                    '_endTime': this.formatTimeOfDay1(_endTime),
                    'CO2emissions': this.calculateEmissions(startLocation.latLng,endLocation.latLng),
                  });
                  uploadDocs();
                  _scaffoldkey.currentState.showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blueGrey,
                        content: Text('Activity added successfully!'),
                        duration: Duration(seconds: 1),
                      ));

                  new Future.delayed(const Duration(seconds: 1), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Landing(),
                      ),
                    );
                  });

                } catch (e) {
                  print(e);
                }
              }
              ring == true ? await singleNotification(
                notifiedTime,
                "Todo - $taskTitle",
                "Something is not right here!",
                98123871,
              ) : Container();
            }
          },
          child: new Padding(
            padding: new EdgeInsets.all(15.0),
            child: new Text(
              "Add Activity",
              style: categoryWhite(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

}

class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}


class SetTimeDate extends StatefulWidget {
  @override
  _SetTimeDateState createState() => _SetTimeDateState();
}

class _SetTimeDateState extends State<SetTimeDate> {

  TimeOfDay time = new TimeOfDay.now();
  TimeOfDay selectedTime = new TimeOfDay.now();

  DateTime now = new DateTime.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        selectedTime = picked;
      });
      print("selected time $selectedTime ");
    }
  }

  TimeOfDay _time = new TimeOfDay.now();

  String dateNow = DateFormat('EEE d MMM').format(DateTime.now());

  final f = new DateFormat('yyyy-month-dd');
  DateTime _date = new DateTime.now();

  DateTime selectedDate;
  String dueDate;

  String formatDate(DateTime date) => new DateFormat('EEE d MMM').format(selectedDate);

  String notifyTime(DateTime date) => new DateFormat('hh:mm aa on EEE d MMM ').format(notifiedTime);
  String starTime = DateFormat('hh:mm aa').format(DateTime.now());


  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _date) {
      setState(() {
        selectedDate = picked;
//        dueDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        dueDate = formatDate(selectedDate);
      });
      print('Date selected: $dueDate');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      child: ListView(
        children: <Widget>[
          Container(
            width:
            MediaQuery.of(context).size.width,
            color: Color(0xFF06630b),
            padding: EdgeInsets.all(5.0),
            child: MaterialButton(
                onPressed: () async {
                  selectedDate == null ?
                  notifiedTime = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      selectedTime.hour,
                      selectedTime.minute) :
                  notifiedTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute);

                  print('alarm time $now');
                  setState(() {
                    ring = true;
                  });
                  Navigator.pop(context, true);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                          child: new Text("You've updated your task", style: TextStyle(
                            fontFamily: "Bryndan"
                          ),),
                        ),
                        content: Text("Task notification has been set ${notifyTime(notifiedTime)}", style: TextStyle(
                          fontFamily: "Bryndan",
                        ),),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("Ok", style: TextStyle(
                              color: Color(0xFF06630b),
                            ),),
                            onPressed: () {
                              Navigator.pop(context, true );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                minWidth: MediaQuery.of(context)
                    .size
                    .width,
                child: Text(
                  'Add alarm',
                  textAlign: TextAlign.center,
                  style: categoryWhite(),
                )),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectDate(context);
              });
            },
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: <Widget>[
                  dueDate == null
                      ? Text(
                    '$dateNow',
                    textAlign:
                    TextAlign.center,
                    style:
                    titleStyleBoldLight(),
                  )
                      : Text(
                    '$dueDate',
                    textAlign:
                    TextAlign.center,
                    style:
                    titleStyleBoldLight(),
                  ),
                  Text(
                    'Set',
                    textAlign: TextAlign.center,
                    style: address(),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectTime(context);
              });
            },
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${selectedTime.format(context)}',
                    textAlign: TextAlign.center,
                    style: titleStyleBoldLight(),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


