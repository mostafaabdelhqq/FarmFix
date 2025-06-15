import 'dart:convert';

/// type : "Point"
/// coordinates : [30.246,30.254]

Geometry geometryFromJson(String str) => Geometry.fromJson(json.decode(str));
String geometryToJson(Geometry data) => json.encode(data.toJson());
class Geometry {
  Geometry({
      this.type, 
      this.coordinates,});

  Geometry.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? type;
  List<num>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

}