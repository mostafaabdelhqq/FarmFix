String getSoilPropertyFullName(String code) {
  const soilProperties = {
    'bdod': 'Bulk Density',
    'cec': 'Cation Exchange Capacity',
    'cfvo': 'Coarse Fragments Volume',
    'clay': 'Clay Content',
    'nitrogen': 'Total Nitrogen',
    'ocd': 'Organic Carbon Density',
    'ocdsl': 'Organic Carbon Density of Subsoil Layer',
    'ocs': 'Organic Carbon Stocks',
    'phh2o': 'Soil pH in H₂O',
    'phkcl': 'Soil pH in KCl',
    'sand': 'Sand Content',
    'silt': 'Silt Content',
    'soc': 'Soil Organic Carbon Content',
    'caco3': 'Calcium Carbonate Content',
    'wv0010': 'Volumetric Water Content at 0.01 MPa (Saturation)',
    'wv0033': 'Volumetric Water Content at 0.033 MPa (Field Capacity)',
    'wv1500': 'Volumetric Water Content at 1.5 MPa (Wilting Point)',
  };

  return soilProperties[code.toLowerCase()] ?? code;
}
