import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  void increment() {
    setState(() {
      if(year <= 2012) {
        year += 4;
      }
    });

  }

  void decrement() {
    setState(() {
      if(year >= 1974) {
        year -= 4;
      }
    });
  }

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
            flex: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: decrement,
                      child: Text('Before')
                  ),
                  Text(
                    'Year : $year'
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: increment,
                      child: Text('Later')
                  )
                ],
            ),),
          ],
        )
    );
  }
}
