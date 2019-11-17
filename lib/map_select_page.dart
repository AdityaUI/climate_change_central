import 'package:flutter/material.dart';
import 'package:custom_radio_button/custom_radio_button.dart';
import 'package:custom_radio_button/radio_model.dart';
import 'package:climate_change_central/main.dart';
import 'package:climate_change_central/dataEntry_page.dart';

class mapSelect extends StatefulWidget {
  @override
    _mapSelectState createState() => new _mapSelectState();
}

class _mapSelectState extends State<mapSelect> {

  Future navigateToPollution(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Future navigateToTemperature(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => mapSelect()));  //temperature instead of mapSelect
  }

  Future navigateToRenewable(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => mapSelect()));  //renewable instead of mapSelect
  }

  Future navigateToDataEntry(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => dataEntry()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Map Options'
        ),
      ),
      body:
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.red[100], Colors.red[200]
              ]
          )
        ),
        child: (
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.deepOrangeAccent,
                      child: Text('Air Pollution Maps', style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        navigateToPollution(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.deepOrangeAccent,
                      child: Text('Temperature Maps', style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        navigateToTemperature(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.deepOrangeAccent,
                      child: Text('Renewable Maps', style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        navigateToRenewable(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.deepOrangeAccent,
                      child: Text('Data Entry', style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        navigateToDataEntry(context);
                      }),
                ),
              ],
            )
        ),
      )
    );
  }

}
