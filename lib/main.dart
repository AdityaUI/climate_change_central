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


  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Google Maps'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
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
                  ),
                ],
                ),
              ),
            )
          ],
        )
    );
  }
}
