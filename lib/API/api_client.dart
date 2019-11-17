import 'dart:async';
import 'dart:convert';
import 'package:climate_change_central/API/pollution_result.dart';
import 'package:http/http.dart' as http;


Future<List<PollutionResult>> fetchAPIResult(String date, String slat, String elat, String slong, String elong) async {
  print("LIUAEGPIUWEHFOIUWEBHFLIUWEHGFPOIUWRHGEO(h");

  //{44201,14129,42101,42401,42602,44201,81102,85129,88101}

  var uri =  new Uri.https("aqs.epa.gov", "data/api/dailyData/byBox/",{
    "email":"prasannsinghal.dev@gmail.com",
    "key":"bolecat77",
    "param":"44201",
    "bdate":date,
    "edate":date,
    "minlat":slat,
    "maxlat":elat,
    "minlon":slong,
    "maxlon":elong
  });

  var response = await http.get(
    uri,
  );

  print("RESPONSE ARRIVED");

  final responseJson = json.decode(response.body);
  List<PollutionResult> prlist = new List<PollutionResult>();
  for(Map<String, dynamic>map in responseJson['Data']){
    prlist.add(PollutionResult.fromJson(map));
  }
  print("LIST OF WORDS");
  print(prlist.toString());
  return prlist;
  //null == no data
}