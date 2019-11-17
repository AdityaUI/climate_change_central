import 'package:climate_change_central/pollution_map.dart';
import 'package:climate_change_central/renewables_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class Citations extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RenewablesMap(),
    );
  }
}

class CitationsPage extends StatefulWidget {
  CitationsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CiationsPageState createState() => _CiationsPageState();
}

class _CiationsPageState extends State<CitationsPage> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Data Used'),
      ),
      body: Padding
        (
        padding: EdgeInsets.all(4.0),
        child:
      ListView(
        children: [
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text:
                  '''
                
Hannah Ritchie and Max Roser (2019) - "Renewable Energy". Published online at OurWorldInData.org. Retrieved from: ''',
                  style: new TextStyle(color: Colors.black, fontSize: 12),
                ),
                new TextSpan(
                  text: '\'https://ourworldindata.org/renewable-energy\'',
                  style: new TextStyle(color: Colors.blue, fontSize: 12),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print("TAP");
                      launch(
                          'https://ourworldindata.org/renewable-energy');
                    },
                ),
                new TextSpan(
                  text: ' [Online Resource]',
                  style: new TextStyle(color: Colors.black, fontSize: 12),
                )
              ],
            ),
          ),
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text:
                  '''
                  
HYDRO CONSUMPTION - TWH
Variable description	Hydroelectricity: Consumption Notes: Annual changes and shares of total are calculated using terawatt-hours figures.Growth rates are adjusted for leap years.
Variable time span	1965 – 2016
Data published by	BP
Link ''',
                  style: new TextStyle(color: Colors.black, fontSize: 12),
                ),
                new TextSpan(
                  text: 'http://www.bp.com/statisticalreview',
                  style: new TextStyle(color: Colors.blue, fontSize: 12),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print("TAP");
                      launch(
                          'http://www.bp.com/statisticalreview');
                    },
                ),
              ],
            ),
          ),
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text:
                  '''
                  
WIND CONSUMPTION - TWH
Variable description	Renewables: Consumption - Wind Notes: Annual changes and shares of total are calculated using terawatt-hours figures.Growth rates are adjusted for leap years.
Variable time span	1965 – 2016
Data published by	BP
Link ''',
                  style: new TextStyle(color: Colors.black, fontSize: 12),
                ),
                new TextSpan(
                  text: 'http://www.bp.com/statisticalreview',
                  style: new TextStyle(color: Colors.blue, fontSize: 12),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print("TAP");
                      launch(
                          'http://www.bp.com/statisticalreview');
                    },
                ),
              ],
            ),
          ),
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text:
                  '''
                  
SOLAR CONSUMPTION - TWH
Variable description	Renewables: Consumption - Solar Notes: Annual changes and shares of total are calculated using terawatt-hours figures.Growth rates are adjusted for leap years.
Variable time span	1965 – 2016
Data published by	BP
Link ''',
                  style: new TextStyle(color: Colors.black, fontSize: 12),
                ),
                new TextSpan(
                  text: 'http://www.bp.com/statisticalreview',
                  style: new TextStyle(color: Colors.blue, fontSize: 12),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print("TAP");
                      launch(
                          'http://www.bp.com/statisticalreview');
                    },
                ),
              ],
            ),
          ),
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text:
                  '''
                  
GEO BIOMASS OTHER - TWH
Variable description	Renewables: Consumption - Geothermal, Biomass and Other Notes: Annual changes and shares of total are calculated using terawatt-hours figures.Growth rates are adjusted for leap years.
Variable time span	1965 – 2016
Data published by	BP
Link ''',
                  style: new TextStyle(color: Colors.black, fontSize: 12),
                ),
                new TextSpan(
                  text: 'http://www.bp.com/statisticalreview',
                  style: new TextStyle(color: Colors.blue, fontSize: 12),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print("TAP");
                      launch(
                          'http://www.bp.com/statisticalreview');
                    },
                ),
              ],
            ),
          ),
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text:
                  '''
                
BP Statistical Review of World Energy
Data: BP publishes data on Oil, Gas Coal, Nuclear Energy, Hydroelectricity, Renewables, Primary Energy Consumption, Electricity Generation, Carbon Doixide Emissions
Geographical coverage: Global – by country and region
Time span: Annual data since 1951
Available at: Online at ''',
                  style: new TextStyle(color: Colors.black, fontSize: 12),
                ),
                new TextSpan(
                  text: 'www.BP.com',
                  style: new TextStyle(color: Colors.blue, fontSize: 12),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print("TAP");
                      launch(
                          'http://web.archive.org/web/20140605044810/http://www.bp.com:80/en/global/corporate/about-bp/energy-economics/statistical-review-of-world-energy-2013.html');
                    },
                ),
              ],
            ),
          ),
        ],
      ),),
    );
  }
}
