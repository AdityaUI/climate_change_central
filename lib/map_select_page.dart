import 'package:flutter/material.dart';
import 'package:climate_change_central/main.dart';
import 'package:climate_change_central/dataEntry_page.dart';
import 'package:climate_change_central/stats_page.dart';
import 'package:climate_change_central/ocean_level_page.dart';
import 'package:climate_change_central/deforestation_page.dart';

class mapSelect extends StatefulWidget {
  @override
    _mapSelectState createState() => new _mapSelectState();
}

class _mapSelectState extends State<mapSelect> {

  Future navigateToPollution(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Future navigateToDeforestation(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => deforestation()));  //temperature instead of mapSelect
  }

  Future navigateToRenewable(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => mapSelect()));  //renewable instead of mapSelect
  }

  Future navigateToStats(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LineChartSample2()));  //renewable instead of mapSelect
  }

  Future navigateToDataEntry(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => dataEntry()));
  }

  Future navigateToWaterLevel(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => oceanLevel()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          '  Map Options'
        ),
      ),
      body:
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.greenAccent[100] ,Colors.greenAccent,Colors.blueAccent[100],Colors.lightBlueAccent
              ]
          )
        ),
        child: (
            ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[Text ('   ')],
                ),
                Row(
                  children: <Widget>[Text ('   ')],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.black87,
                      child: Text('→   Air Pollution Maps   ←', style: TextStyle(
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
                      color: Colors.black87,
                      child: Text('→    Water Level Map   ←', style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        navigateToWaterLevel(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.black87,
                      child: Text('→    Deforestation Maps   ←', style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        navigateToDeforestation(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.black87,
                      child: Text('→     Renewability Map     ←', style: TextStyle(
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
                      color: Colors.black87,
                      child: Text('→     Data Entry     ←', style: TextStyle(
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
                Row(
                  children: <Widget>[Text ('   ')],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.black87,
                      child: Text('→     Stats     ←', style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        navigateToStats(context);
                      }),
                ),
              ],
            )
        ),
      )
    );
  }

}
