import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'API/api_client.dart';

void main() {
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
  GoogleMapController controller;
  List<Polygon> ret = new List<Polygon>();
  String date, slat, elat, slong, elong;

  MaterialColor intToColor(int i) {
    if (i < 20)
      return Colors.green;
    else if (i < 30)
      return Colors.yellow;
    else
      return Colors.red;
  }

  printAPI(
      String date, String slat, String elat, String slong, String elong) {
    setState(() {
      fetchAPIResult(date, slat, elat, slong, elong).then((list) {
        print("PRINTING");
        ret = new List<Polygon>();
        for (int i = 0; i < list.length; i++) {
          if (list[i].aqi == null) continue;
          ret.add(new Polygon(
              polygonId: PolygonId(i.toString()),
              points: [
                new LatLng(list[i].latitude - 0.7, list[i].longitude - 0.7),
                new LatLng(list[i].latitude - 0.7, list[i].longitude + 0.7),
                new LatLng(list[i].latitude + 0.7, list[i].longitude + 0.7),
                new LatLng(list[i].latitude + 0.7, list[i].longitude - 0.7),
              ],
              strokeWidth: 5,
              strokeColor: intToColor(list[i].aqi),
              fillColor: intToColor(list[i].aqi).withOpacity(0.1)));
        }
        print("done " + ret.length.toString());
        build(context);
      });
    });
  }

  setVars() {
    setState(() {
      print("set vars");
      date = "20150102";
      slat = "23.3";
      elat = "50.0";
      slong = "-126.0";
      elong = "-52.7";
      printAPI(date, slat, elat, slong, elong);
    });
  }

  Widget build(BuildContext context) {
    print("build");
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Google Maps'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height - 50,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(37.0, -80.0), zoom: 4.0),
                      polygons: Set<Polygon>.of(ret),
                    ),
                  ],
                ))
          ],
        ));
  }
}
