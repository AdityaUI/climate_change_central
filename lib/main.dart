import 'package:flutter/material.dart';
import 'package:map_view/figure_joint_type.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/polygon.dart';
import 'API/api_client.dart';

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

  MaterialColor intToColor(int i)
  {
    if (i < 20)
      return Colors.green;
    else if (i < 30)
      return Colors.yellow;
    else
      return Colors.red;
  }


  printAPI(
      String date, String slat, String elat, String slong, String elong) {
    fetchAPIResult(date, slat, elat, slong, elong).then((list) {
      print("PRINTING");
      List<Polygon> ret = new List<Polygon>();
      for (int i = 0; i < list.length; i++) {
        if (list[i].aqi == null) continue;
        ret.add(new Polygon(
            i.toString(),
            <Location>[
              new Location(list[i].latitude - 0.7, list[i].longitude - 0.7),
              new Location(list[i].latitude - 0.7, list[i].longitude + 0.7),
              new Location(list[i].latitude + 0.7, list[i].longitude + 0.7),
              new Location(list[i].latitude + 0.7, list[i].longitude - 0.7),
            ],
            jointType: FigureJointType.round,
            strokeColor: intToColor(list[i].aqi),
            strokeWidth: 5.0,
            fillColor: intToColor(list[i].aqi).withOpacity(0.1)));
      }
      mapView.show(new MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition:
        new CameraPosition(new Location(37.0, -80.0), 4.0),
        showUserLocation: false,
        title: 'MyMap',
      ));
      ret.add(new Polygon(
          (-1).toString(),
          <Location>[
            new Location(23.3, -126.0),
            new Location(23.3, -52.7),
            new Location(50.0, -52.7),
            new Location(50.0, -126.0),
          ],
          jointType: FigureJointType.round,
          strokeColor: intToColor(0),
          strokeWidth: 5.0,
          fillColor: intToColor(0).withOpacity(0.1)));
      mapView.setPolygons(ret);
    }
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Google Maps'),
        ),
        body: new Center(
          child: new Container(
            child:
                new RaisedButton(child: Text('Press'), onPressed: printAPI("20040102", "23.3", "50.0", "-126.0", "-52.7")),
          ),
        ));
  }
}
