import 'dart:ffi';

import 'package:flutter/material.dart';

class dataEntry extends StatefulWidget {
  double houseSize;
  String state;
  int time;

  @override
    _dataEntryState createState() => new _dataEntryState(houseSize, state, time);

}


class _dataEntryState extends State<dataEntry> {

  double houseSize;
  String state;
  int time;
  double gas;
  double electricity;

  final sizeHouseControl = new TextEditingController();
  final stateControl = new TextEditingController();
  final ACtimeControl = new TextEditingController();
  final gasburnerControl = new TextEditingController();
  final electricityControl = new TextEditingController();


  void setVariables () {
    houseSize = double.parse(sizeHouseControl.text);
    state = stateControl.text;
    time = int.parse(ACtimeControl.text);
    gas = double.parse(gasburnerControl.text);
    electricity = double.parse(electricityControl.text);
  }

  _dataEntryState(this.houseSize, this.state, this.time);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Entry'),
        backgroundColor: Colors.orangeAccent,
      ),
      body:
      new Container(
        alignment: AlignmentDirectional(0.0, 0.0),
        height: 1000,
        child: ListView(
          children: <Widget>[

            SizedBox(
              height: 150,
              width: 360,
            ),
            SizedBox(
              height: 80,
              width: 360,
              child: Column(

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
              height: 80,
              width: 360,
              child: Column(
                children: <Widget>[
                  Text(
                      'What is your gas burner usage?'
                  ),
                  TextField(
                    controller: gasburnerControl,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
              width: 360,
              child: Column(
                children: <Widget>[
                  Text(
                      'What is your electricity usage?'
                  ),
                  TextField(
                    controller: electricityControl,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
              width: 360,
              child: Column(
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
              height: 80,
              width: 360,
              child: Column(
                children: <Widget>[
                  Text(
                      'What long do you use the A.C?'
                  ),
                  TextField(
                    controller: ACtimeControl,
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text('Submit'),
              color: Colors.orangeAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              onPressed: () => {
                /*TODO*/
                //implement submit
              },
            )
          ],
        ),
      )
    );
  }

}
