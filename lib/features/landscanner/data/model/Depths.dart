import 'Range.dart';
import 'Values.dart';
import 'dart:convert';

/// range : {"top_depth":0,"bottom_depth":5,"unit_depth":"cm"}
/// label : "0-5cm"
/// values : {"mean":139}

Depths depthsFromJson(String str) => Depths.fromJson(json.decode(str));
String depthsToJson(Depths data) => json.encode(data.toJson());
class Depths {
  Depths({
      this.range, 
      this.label, 
      this.values,});

  Depths.fromJson(dynamic json) {
    range = json['range'] != null ? Range.fromJson(json['range']) : null;
    label = json['label'];
    values = json['values'] != null ? Values.fromJson(json['values']) : null;
  }
  Range? range;
  String? label;
  Values? values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (range != null) {
      map['range'] = range?.toJson();
    }
    map['label'] = label;
    if (values != null) {
      map['values'] = values?.toJson();
    }
    return map;
  }

}