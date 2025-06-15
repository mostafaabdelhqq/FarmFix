import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class AppMap {
  final MapController mapController = MapController();
  LatLng? userLocation;
  LatLng? selectedPoint;

  void setPoint(LatLng point, VoidCallback onUpdate) {
    selectedPoint = point;
    onUpdate();
  }

  MarkerLayer getMarkerLayer() {
    if (selectedPoint == null) return const MarkerLayer(markers: []);

    return MarkerLayer(
      markers: [
        if (userLocation != null)
          Marker(
            point: userLocation!,
            width: 60,
            height: 60,
            child: const Icon(Icons.my_location, color: Colors.blue, size: 30),
          ),
        if (selectedPoint != null)
          Marker(
            point: selectedPoint!,
            width: 60,
            height: 60,
            child: const Icon(Icons.place, color: Colors.green, size: 40),
          ),
      ],
    );
  }

  Future<void> searchLocation(String query, VoidCallback onUpdate, BuildContext context) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');
    final response = await http.get(url, headers: {
      'User-Agent': 'flutter_map_app'
    });

    final data = json.decode(response.body);
    if (data != null && data.length > 0) {
      final lat = double.parse(data[0]['lat']);
      final lon = double.parse(data[0]['lon']);
      selectedPoint = LatLng(lat, lon);
      mapController.move(selectedPoint!, 14.0);
      onUpdate();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الموقع غير موجود')),
      );
    }
  }

  void setFromCoordinates(String latText, String lonText, VoidCallback onUpdate, BuildContext context) {
    try {
      final lat = double.parse(latText);
      final lon = double.parse(lonText);
      final newPoint = LatLng(lat, lon);
      selectedPoint = newPoint;
      mapController.move(newPoint, 14.0);
      onUpdate();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('إحداثيات غير صحيحة')),
      );
    }
  }

}
