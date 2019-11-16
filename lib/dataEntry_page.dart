import 'dart:ffi';

import 'package:flutter/material.dart';

class dataEntry extends StatefulWidget {

  @override
    _dataEntryState createState() => new _dataEntryState();

}


class _dataEntryState extends State<dataEntry> {

  double houseSize;
  String state;
  int time;

  final sizeHouseControl = new TextEditingController();
  final stateControl = new TextEditingController();
  final timeControl = new TextEditingController();

  void setVariables () {
    houseSize = double.parse(sizeHouseControl.text);
    state = stateControl.text;
    time = int.parse(timeControl.text);

  }

  _dataEntryState(this.houseSize, this.sate, this.time);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Entry'),
        backgroundColor: Colors.orangeAccent,
      ),
      body:
      new ListView(
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 360,
            child: ListView(
              children: <Widget>[
                Text(
                    'What is the size of your house?'
                ),
                TextField(
                  controller: sizeHouseControl,
                )
              ],
            ),
          ),
          SizedBox(
            height: 200,
            width: 360,
            child: ListView(
              children: <Widget>[
                Text(
                    'What is the state you live in?'
                ),
                TextField(
                  controller: stateControl,
                )
              ],
            ),
          ),
          SizedBox(
            height: 200,
            width: 360,
            child: ListView(
              children: <Widget>[
                Text(
                    'What is the time?'
                ),
                TextField(
                  controller: timeControl,
                )
              ],
            ),
          ),
        ],
      )
    );
  }

}
