import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:step_slider/step_slider.dart';

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
  double year = 1970;

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Google Maps'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
            child:GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(31.9686, 99.9018),
                  zoom: 12.0
              ),
              polygons: Set<Polygon>.of(<Polygon>[
                Polygon(
                    polygonId: PolygonId('area'),
                    points: <LatLng>[LatLng(41.3642 - 0.7, -106.2399 - 0.7),
                      LatLng(41.3642 - 0.7, -106.2399 + 0.7),
                      LatLng(41.3642 + 0.7, -106.2399 + 0.7),
                      LatLng(41.3642 + 0.7, -106.2399 - 0.7),],
                    geodesic: true,
                    strokeColor: Colors.blue,
                    fillColor: Colors.lightBlue.withOpacity(0.1),
                    visible: true
                )
              ]),
            ),
            flex: 10,),
            Expanded(
              child: StepSlider(
                min: 1970,
                max: 2016,

                steps: {1970,1971,1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987,
                          1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
                          2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016},
              initialStep: 1971,
              animCurve: Curves.bounceInOut,
              animDuration: Duration(seconds:1),
              hardSnap: false,
              onStepChanged: (year) => print('Year :$year'),
            ),),
          ],
        )
    );
  }
}
