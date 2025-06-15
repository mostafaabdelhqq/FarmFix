import 'dart:convert';

/// top_depth : 0
/// bottom_depth : 5
/// unit_depth : "cm"

Range rangeFromJson(String str) => Range.fromJson(json.decode(str));
String rangeToJson(Range data) => json.encode(data.toJson());
class Range {
  Range({
      this.topDepth, 
      this.bottomDepth, 
      this.unitDepth,});

  Range.fromJson(dynamic json) {
    topDepth = json['top_depth'];
    bottomDepth = json['bottom_depth'];
    unitDepth = json['unit_depth'];
  }
  num? topDepth;
  num? bottomDepth;
  String? unitDepth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['top_depth'] = topDepth;
    map['bottom_depth'] = bottomDepth;
    map['unit_depth'] = unitDepth;
    return map;
  }

}