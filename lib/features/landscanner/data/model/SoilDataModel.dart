import 'dart:convert';

import 'Geometry.dart';
import 'Properties.dart';

/// type : "Feature"
/// geometry : {"type":"Point","coordinates":[30.246,30.254]}
/// properties : {"layers":[{"name":"bdod","unit_measure":{"d_factor":100,"mapped_units":"cg/cm³","target_units":"kg/dm³","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":139}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":141}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":147}}]},{"name":"cec","unit_measure":{"d_factor":10,"mapped_units":"mmol(c)/kg","target_units":"cmol(c)/kg","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":147}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":140}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":140}}]},{"name":"cfvo","unit_measure":{"d_factor":10,"mapped_units":"cm³/dm³","target_units":"cm³/100cm³","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":236}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":237}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":250}}]},{"name":"clay","unit_measure":{"d_factor":10,"mapped_units":"g/kg","target_units":"%","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":279}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":287}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":282}}]},{"name":"nitrogen","unit_measure":{"d_factor":100,"mapped_units":"cg/kg","target_units":"g/kg","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":103}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":63}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":46}}]},{"name":"ocd","unit_measure":{"d_factor":10,"mapped_units":"dg/dm³","target_units":"hg/m³","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":136}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":113}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":98}}]},{"name":"phh2o","unit_measure":{"d_factor":10,"mapped_units":"pH*10","target_units":"-","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":80}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":80}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":80}}]},{"name":"sand","unit_measure":{"d_factor":10,"mapped_units":"g/kg","target_units":"%","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":385}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":384}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":384}}]},{"name":"silt","unit_measure":{"d_factor":10,"mapped_units":"g/kg","target_units":"%","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":336}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":329}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":334}}]},{"name":"soc","unit_measure":{"d_factor":10,"mapped_units":"dg/kg","target_units":"g/kg","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":55}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":48}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":37}}]},{"name":"wv0010","unit_measure":{"d_factor":10,"mapped_units":"(10-2 cm³/cm³)*10","target_units":"10-2 cm³/cm³","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":322}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":323}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":327}}]},{"name":"wv0033","unit_measure":{"d_factor":10,"mapped_units":"(10-2 cm³/cm³)*10","target_units":"10-2 cm³/cm³","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":273}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":275}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":285}}]},{"name":"wv1500","unit_measure":{"d_factor":10,"mapped_units":"(10-2 cm³/cm³)*10","target_units":"10-2 cm³/cm³","uncertainty_unit":""},"depths":[{"range":{"top_depth":0,"bottom_depth":5,"unit_depth":"cm"},"label":"0-5cm","values":{"mean":122}},{"range":{"top_depth":5,"bottom_depth":15,"unit_depth":"cm"},"label":"5-15cm","values":{"mean":124}},{"range":{"top_depth":15,"bottom_depth":30,"unit_depth":"cm"},"label":"15-30cm","values":{"mean":122}}]}]}
/// query_time_s : 4.023958206176758

SoilDataModel soilDataModelFromJson(String str) => SoilDataModel.fromJson(json.decode(str));
String soilDataModelToJson(SoilDataModel data) => json.encode(data.toJson());
class SoilDataModel {
  SoilDataModel({
      this.type, 
      this.geometry, 
      this.properties, 
      this.queryTimeS,});

  SoilDataModel.fromJson(dynamic json) {
    type = json['type'];
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    properties = json['properties'] != null ? Properties.fromJson(json['properties']) : null;
    queryTimeS = json['query_time_s'];
  }
  String? type;
  Geometry? geometry;
  Properties? properties;
  num? queryTimeS;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    if (properties != null) {
      map['properties'] = properties?.toJson();
    }
    map['query_time_s'] = queryTimeS;
    return map;
  }

}