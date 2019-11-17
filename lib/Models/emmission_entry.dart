

import 'dart:math';

import 'package:flutter/cupertino.dart';

class EmmissionEntry {
  int id;
  double value;
  int timestamp;

  EmmissionEntry({this.id, this.value, this.timestamp});


  Map<String, dynamic> toMap() =>{
    "id": id,
    "value": value,
    "timestamp":timestamp
  };

  factory EmmissionEntry.fromMap(Map<String, dynamic> json) => new EmmissionEntry(
      id: int.parse(json["id"]),
      value:double.parse(json["value"]),
      timestamp: int.parse(json["timestamp"])
  );


  @override
  String toString() {
    // TODO: implement toString
    return id.toString()+" "+value.toString()+" "+timestamp.toString();
  }

}
