import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:step_slider/step_slider.dart';
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
  bool loading = false;
  MaterialColor intToColor(int i) {
    if (i < 20)
      return Colors.green;
    else if (i < 30)
      return Colors.yellow;
    else
      return Colors.red;
  }

  printAPI(String date, String slat, String elat, String slong, String elong) {
    setState(() {
      fetchAPIResult(date, slat, elat, slong, elong).then((list) {
        loading = true;
        print("PRINTING");
        ret = new List<Polygon>();
        for (int i = 0; i < list.length; i += 2) {
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
        loading = false;
      });
    });
  }

  setVars(double year) {
    setState(() {
      print("set vars");
      date = year.floor().toString() + "0102";
      slat = "23.3";
      elat = "50.0";
      slong = "-126.0";
      elong = "-52.7";
      printAPI(date, slat, elat, slong, elong);
    });
  }

  double year = 1970;

  Widget build(BuildContext context) {
    print("build " + loading.toString());
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Google Maps'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: loading
                  ? Column(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: LatLng(37.0, -80.0), zoom: 4.0),
                          polygons: Set<Polygon>.of(ret),
                        ),
                        CircularProgressIndicator(strokeWidth: 5, backgroundColor: Colors.blue,),
                      ],
                    )
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(37.0, -80.0), zoom: 4.0),
                      polygons: Set<Polygon>.of(ret),
                    ),
              flex: 10,
            ),
            Expanded(
              child: StepSlider(
                min: 1970,
                max: 2016,
                steps: {
                  1970,
                  1972,
                  1974,
                  1976,
                  1978,
                  1980,
                  1982,
                  1984,
                  1986,
                  1990,
                  1992,
                  1994,
                  1996,
                  1998,
                  2000,
                  2002,
                  2004,
                  2006,
                  2008,
                  2010,
                  2012,
                  2014,
                  2016
                },
                initialStep: 1970,
                animCurve: Curves.bounceInOut,
                animDuration: Duration(seconds: 1),
                hardSnap: false,
                onStepChanged: (year) => setVars(year),
              ),
            ),
          ],
        ));
  }
}
