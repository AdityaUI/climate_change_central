import 'package:climate_change_central/API/pollution_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'API/api_client.dart';

class PollutionMap extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PollutionMapPage(),
    );
  }
}

class PollutionMapPage extends StatefulWidget {
  PollutionMapPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PollutionMapState createState() => _PollutionMapState();
}

class _PollutionMapState extends State<PollutionMapPage> {
  GoogleMapController controller;
  GoogleMap store = GoogleMap(
    initialCameraPosition:
    CameraPosition(target: LatLng(39.0, -97.0), zoom: 3.25),
    mapType: MapType.hybrid,
  );
  List<Polygon> ret = new List<Polygon>();
  double year = 1970;
  MaterialColor intToColor(int i) {
    if (i < 10) return Colors.blue;
    if (i < 20)
      return Colors.green;
    else if (i < 30)
      return Colors.yellow;
    else if (i < 40)
      return Colors.orange;
    else
      return Colors.red;
  }

  Widget setRet(List<PollutionResult> list) {
    print("PRINTING");
    ret = new List<Polygon>();
    for (int i = 0; i < list.length; i += 3) {
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
    return GoogleMap(
      initialCameraPosition:
      CameraPosition(target: LatLng(39.0, -97.0), zoom: 3.25),
      polygons: Set<Polygon>.of(ret),
      mapType: MapType.hybrid,
    );
  }

  increment() {
    setState(() {
      if(year <= 2014) {
        year += 4;
      }
    });
  }

  decrement() {
    setState(() {
      if(year >= 1974) {
        year -= 4;
      }
    });
  }

  Widget build(BuildContext context) {
    print("build");
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Pollution Map'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: fetchAPIResult(year.floor().toString() + "0102", "23.3",
                    "50.0", "-126.0", "-52.7"),
                builder: (BuildContext context,
                    AsyncSnapshot<List<PollutionResult>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Press button to start.');
                    case ConnectionState.active:
                      return Text("Active...");
                    case ConnectionState.waiting:
                      return Stack(
                        children: <Widget>[
                          store,
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: CircularProgressIndicator(),),
                        ],
                      );
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return store = setRet(snapshot.data);
                  }
                  return Text("what"); // unreachable
                },
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
                      child: Text('Before')),
                  Text('Year : ${year.floor()}'),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: increment,
                      child: Text('Later'))
                ],
              ),
            ),
          ],
        ));
  }
}
