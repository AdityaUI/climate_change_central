import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/figure_joint_type.dart';
import 'package:map_view/polygon.dart';

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
  List<Polygon> polygons = <Polygon> [
    new Polygon(
      "Texas",
      <Location>[
        new Location(35.22, -101.83),
        new Location(32.77, -96.79),
        new Location(29.76, -95.36),
        new Location(29.42, -98.49),
      ],
      jointType: FigureJointType.round,
      strokeColor: Colors.blue,
      strokeWidth: 10.0,
      fillColor: Colors.blue.withOpacity(0.1)
    )
  ];

  displayMap() {

    mapView.show(new MapOptions(
      mapViewType: MapViewType.normal,
      initialCameraPosition:
          new CameraPosition(new Location(29.7604, 95.3698), 4.0),
      showUserLocation: false,
      title: 'MyMap',

    ));
    mapView.onMapTapped.listen((tapped) {
      mapView.setPolygons(polygons);
      mapView.zoomToFit(padding: 100);
    });
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
