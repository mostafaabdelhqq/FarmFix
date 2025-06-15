import 'dart:convert';

/// mean : 139

Values valuesFromJson(String str) => Values.fromJson(json.decode(str));
String valuesToJson(Values data) => json.encode(data.toJson());
class Values {
  Values({
      this.mean,});

  Values.fromJson(dynamic json) {
    mean = json['mean'];
  }
  num? mean;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mean'] = mean;
    return map;
  }

}