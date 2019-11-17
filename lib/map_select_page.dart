import 'package:flutter/material.dart';
import 'package:climate_change_central/main.dart';
import 'package:climate_change_central/pollution_map.dart';
import 'package:climate_change_central/dataEntry_page.dart';
import 'package:climate_change_central/stats_page.dart';
import 'package:climate_change_central/ocean_level_page.dart';
import 'package:climate_change_central/deforestation_page.dart';
import 'package:climate_change_central/renewables_map.dart';

class mapSelect extends StatefulWidget {
  @override
    _mapSelectState createState() => new _mapSelectState();
}

class _mapSelectState extends State<mapSelect> {

  Future navigateToPollution(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PollutionMap()));
  }

  Future navigateToDeforestation(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => deforestation()));  //temperature instead of mapSelect
  }

  Future navigateToRenewable(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RenewablesMap()));  //renewable instead of mapSelect
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
        backgroundColor: Colors.blue,
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
                Colors.greenAccent[100], Colors.white
              ]
          )
        ),
        child: (
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.blue,
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
                      color: Colors.blueAccent,
                      child: Text('Water Level Map', style: TextStyle(
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
                      color: Colors.blueAccent,
                      child: Text('Deforestation Maps', style: TextStyle(
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
                      color: Colors.blueAccent,
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
                      color: Colors.blueAccent,
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Stats', style: TextStyle(
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
