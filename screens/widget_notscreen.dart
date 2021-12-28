import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key key, this.title, this.startTime, this.endTime, this.onClick}) : super(key: key);

  final String title;
  final String startTime;
  final String endTime;
  final Function onClick;


  @override

  _AddTaskStorePage createState() => new _AddTaskStorePage();
}

class _AddTaskStorePage extends State<AddTaskPage> {
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
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _checkValue() {
    if (_controller1.text.length > 3) {
      widget.onClick(_controller.text);
      widget.onClick(_controller1.text);
      widget.onClick(_controller2.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _buttonTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 23.0);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Activity name',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
                    labelText: 'New Activity',
                  ),
                  autofocus: true,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: Colors.black),
                ),
                TextField(
                  controller: _controller1,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Add a starting time',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
                    labelText: 'Time to start',
                  ),
                  autofocus: true,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: Colors.black),
                ),
                TextField(
                  controller: _controller2,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Add an ending time',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
                    labelText: 'Time to end',
                  ),
                  autofocus: true,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: Colors.black),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Preferred methods:",
                      style: TextStyle(color: Colors.green, fontSize: 20.0),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
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
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                onPressed: _checkValue,
                color: Theme.of(context).primaryColor,
                elevation: 3.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                child: Text('Create Activity', style: _buttonTextStyle),
              )
          ),

        ]),
      ),
    );
  }
}