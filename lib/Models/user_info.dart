

class UserInfo {
  int id;
  String rn;
  String ln;
  int sqrft;
  double lat;
  double lng;


  UserInfo({this.id, this.rn, this.ln, this.sqrft, this.lat, this.lng});


  Map<String, dynamic> toMap() =>{
    "id": id,
    "rn": rn,
    "ln": ln,
    "sqrft": sqrft,
    "lat": lat,
    "lng":lng
  };

  factory UserInfo.fromMap(Map<String, dynamic> json) => new UserInfo(
      id: int.parse(json["id"]),
      rn:json["rn"],
      ln: json["ln"],
      sqrft: int.parse(json["sqrft"]),
      lat: double.parse(json["lat"]),
      lng:double.parse(json["lng"]) ,
  );


  @override
  String toString() {
    return 'UserInfo{id: $id, rn: $rn, ln: $ln, sqrft: $sqrft, lat: $lat, lng: $lng}';
  }


}