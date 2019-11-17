import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

void main() {
  MapView.setApiKey("AIzaSyAIVtrfariDjyZCTPyAA_toMZL3mfxDouE");
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapView mapView = new MapView();
  displayMap() {
    mapView.show(new MapOptions(
      mapViewType: MapViewType.normal,
      initialCameraPosition:
          new CameraPosition(new Location(29.7604, 95.3698), 4.0),
      showUserLocation: false,
      title: 'MyMap',
    ));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Google Maps'),
        ),
        body: new Center(
          child: new Container(
            child:
                new RaisedButton(child: Text('Press'), onPressed: displayMap),
          ),
        ));
  }
}
