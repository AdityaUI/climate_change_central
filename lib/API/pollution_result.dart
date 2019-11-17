
import 'dart:math';

class PollutionResult {
  final int aqi;
  final double latitude;
  final double longitude;

  PollutionResult({this.aqi, this.latitude, this.longitude});

  static int randval(int a){
    if(a!=null){
      return a;
    }
    return null;
  }

  factory PollutionResult.fromJson(Map<String, dynamic> json) {
    return PollutionResult(
      aqi: randval(json['aqi']),
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return aqi.toString()+" "+latitude.toString()+" "+longitude.toString();
  }

}
