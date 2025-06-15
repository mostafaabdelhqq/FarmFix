import 'dart:convert';

/// d_factor : 100
/// mapped_units : "cg/cm³"
/// target_units : "kg/dm³"
/// uncertainty_unit : ""

UnitMeasure unitMeasureFromJson(String str) => UnitMeasure.fromJson(json.decode(str));
String unitMeasureToJson(UnitMeasure data) => json.encode(data.toJson());
class UnitMeasure {
  UnitMeasure({
      this.dFactor, 
      this.mappedUnits, 
      this.targetUnits, 
      this.uncertaintyUnit,});

  UnitMeasure.fromJson(dynamic json) {
    dFactor = json['d_factor'];
    mappedUnits = json['mapped_units'];
    targetUnits = json['target_units'];
    uncertaintyUnit = json['uncertainty_unit'];
  }
  num? dFactor;
  String? mappedUnits;
  String? targetUnits;
  String? uncertaintyUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['d_factor'] = dFactor;
    map['mapped_units'] = mappedUnits;
    map['target_units'] = targetUnits;
    map['uncertainty_unit'] = uncertaintyUnit;
    return map;
  }

}