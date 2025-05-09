import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_routes.dart';
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
                  // Color(0xFF004022),
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
            child: Container(
              decoration: const BoxDecoration(

              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                GoRouter.of(context).go(AppRoutes.kHomeView);
              },
            ),
          ],
        ),
        body: Column(children: [
          // 🔍 شريط البحث
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38,width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      controller: searchController ,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Search Place ...',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,),
                        suffixIcon: Container(
                          height:32,
                          width: 56,

                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),),
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
                      ),),
                  )
                  // TextField(
                  //   controller: searchController,
                  //   decoration: const InputDecoration(
                  //     hintText: 'Search Place ...',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
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
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: lonController,
                    decoration: InputDecoration(
                      hintText: 'Longitude',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black54,width: 2),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 8),

              ],

            ),
          ),
          const SizedBox(height: 8,),
          Container(
              height: 40,
              width: 84,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12),

              ),
              child: InkWell(

                onTap: () => appMap.setFromCoordinates(
                latController.text,
                lonController.text,
                    () => setState(() {}),
                context,),

                child: const Text("Scan",style: TextStyle(color: kSecondaryColor,fontSize: 18,fontWeight: FontWeight.bold),),
              )
          //     ElevatedButton(
          //       onPressed: () => appMap.setFromCoordinates(
          //         latController.text,
          //         lonController.text,
          //             () => setState(() {}),
          //         context,
          //       ),
          //       child: const Text("Ok"),
          // ),
          ),
          SizedBox(height: 8,),
          // 🌍 الخريطة
          Expanded(
            child: FlutterMap(
              mapController: appMap.mapController,
              options: MapOptions(
                initialCenter: const LatLng(30.0333, 31.2333),
                initialZoom: 10.0,
                onTap: (tapPos, point) =>
                    appMap.setPoint(point, () => setState(() {})),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.farmfix',
                ),
                appMap.getMarkerLayer(),
              ],
            ),
          )
        ]));
  }
}
