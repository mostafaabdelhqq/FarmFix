import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../location_service.dart';
import '../../logic/cubit/soilgrids_cubit.dart';
import '../model/appMapModel.dart';

class LandScannerView extends StatefulWidget {
  const LandScannerView({super.key});

  @override
  State<LandScannerView> createState() => _LandScannerViewState();
}

class _LandScannerViewState extends State<LandScannerView> {
  final AppMap appMap = AppMap();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  LatLng? userLocation;
  LatLng? selectedPoint;

  final Location location = Location();

  @override
  void initState() {
    super.initState();
    initUserLocation();
  }

  Future<void> initUserLocation() async {
    final loc = await LocationService().getLocation();
    userLocation = LatLng(loc.latitude!, loc.longitude!);
    appMap.mapController.move(userLocation!, 14.0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: const Text('Land Scanner'),
        titleTextStyle: GoogleFonts.righteous(
          fontSize: 22.sp,
          fontWeight: FontWeight.w200,
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF009951),
                Color(0xFF006636),
                Color(0xFF004D29),
                Color(0xFF00331B),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 🔍 شريط البحث
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: searchController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Search Place ...',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Container(
                          height: 32,
                          width: 56,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            color: kSecondaryColor,
                            alignment: Alignment.center,
                            splashColor: Colors.transparent,
                            icon: const Icon(Icons.search),
                            onPressed: () => appMap.searchLocation(
                              searchController.text,
                                  () => setState(() {}),
                              context,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🧭 إدخال يدوي للإحداثيات
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: latController,
                    decoration: const InputDecoration(
                      hintText: 'Latitude',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: lonController,
                    decoration: InputDecoration(
                      hintText: 'Longitude',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            width: 84,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                final lat = double.tryParse(latController.text);
                final lon = double.tryParse(lonController.text);
                if (lat != null && lon != null) {
                  selectedPoint = LatLng(lat, lon);
                  appMap.mapController.move(selectedPoint!, 14);
                  print('SCAN CLICKED - point = $selectedPoint');
                  context.read<SoilGridsCubit>().fetchSoilGridsFromLatLng(selectedPoint!);

                  GoRouter.of(context).push(AppRoutes.kSoilDataView,extra: selectedPoint,);

                  setState(() {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('الرجاء إدخال إحداثيات صحيحة')),
                  );
                }
              },
              child: const Text(
                "Scan",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ),
          const SizedBox(height: 8),
          Expanded(
            child: FlutterMap(
              mapController: appMap.mapController,
              options: MapOptions(
                initialCenter: const LatLng(30.0333, 31.2333),
                initialZoom: 10.0,
                onTap: (tapPos, point) {
                  selectedPoint = point;
                  latController.text = point.latitude.toStringAsFixed(6);
                  lonController.text = point.longitude.toStringAsFixed(6);
                  setState(() {});
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.farmfix',
                ),
                MarkerLayer(
                  markers: [
                    if (userLocation != null)
                      Marker(
                        point: userLocation!,
                        width: 60,
                        height: 60,
                        child: const Icon(Icons.my_location, size: 30, color: Colors.blue),
                      ),
                    if (selectedPoint != null)
                      Marker(
                        point: selectedPoint!,
                        width: 60,
                        height: 60,
                        child: const Icon(Icons.place, size: 40, color: Colors.green),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

