import 'dart:convert';

import 'Depths.dart';
import 'UnitMeasure.dart';

/// name : "bdod"
/// unit_measure : {"d_factor":100,"mapped_units":"cg/cm³","target_units":"kg/dm³","uncertainty_unit":""}
/// depths : [{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":139}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":141}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":147}}]

SoilLayers layersFromJson(String str) => SoilLayers.fromJson(json.decode(str));
String layersToJson(SoilLayers data) => json.encode(data.toJson());
class SoilLayers {
  SoilLayers({
      this.name, 
      this.unitMeasure, 
      this.depths,});

  SoilLayers.fromJson(dynamic json) {
    name = json['name'];
    unitMeasure = json['unit_measure'] != null ? UnitMeasure.fromJson(json['unit_measure']) : null;
    if (json['depths'] != null) {
      depths = [];
      json['depths'].forEach((v) {
        depths?.add(Depths.fromJson(v));
      });
    }
  }
  String? name;
  UnitMeasure? unitMeasure;
  List<Depths>? depths;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    if (unitMeasure != null) {
      map['unit_measure'] = unitMeasure?.toJson();
    }
    if (depths != null) {
      map['depths'] = depths?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}