import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<double> fetchAPIResult(String num) async {
  print("LIUAEGPIUWEHFOIUWEBHFLIUWEHGFPOIUWRHGEO(h");

  //{44201,14129,42101,42401,42602,44201,81102,85129,88101}

  var uri =  new Uri.https("aqs.epa.gov", "data/api/dailyData/byBox/",{
    "email":"test@aqs.api",
    "key":"test",
    "param":"44201",
    "bdate":"19951230",
    "edate":"19951231",
    "minlat":"23.3",
    "maxlat":"50",
    "minlon":"-126.0",
    "maxlon":"-52.7"
  });

  var response = await http.get(
    uri,
  );
  final responseJson = json.decode(response.body);
  print(responseJson.toString());
  print("aljrwnglaiberwgpiaubrwegliua");

  return responseJson['result'];

}