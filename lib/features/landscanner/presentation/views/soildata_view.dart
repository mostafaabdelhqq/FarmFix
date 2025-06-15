import 'package:farmfix/features/landscanner/presentation/views/widgets/soildata_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

import '../../../../constants.dart';
import '../../data/model/SoilLayers.dart';
import '../../logic/cubit/soilgrids_cubit.dart';

class SoilDataView extends StatelessWidget {
  const SoilDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final LatLng selectedPoint = GoRouterState.of(context).extra as LatLng;
    return Scaffold(

    appBar: AppBar(
      title: const Text('Soil Data'),
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
          Row(),
          const Row(children: [Text('Date :',style: TextStyle(fontSize: 20),)],),
          BlocBuilder<SoilGridsCubit, SoilGridsState>(
              builder: (context, state) {
                if (state is SoilGridsLoading) {
                  return Center(child: CircularProgressIndicator(
                    color: const Color(0xff009951).withOpacity(.5),));
                }
                else if (state is SoilGridsError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Something went wrong !!'),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            context.read<SoilGridsCubit>().fetchSoilGridsFromLatLng(selectedPoint);
                                                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            foregroundColor: kSecondaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (state is SoilGridsLoaded) {
                  
                  final List<SoilLayers> layers = state.soilDataModel.properties?.layers?? [];

                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 45.0,
                        crossAxisSpacing: 8.0,
                      ),
                      padding: const EdgeInsets.all(12.0),
                      itemCount: layers.length,
                      itemBuilder: (context, index) {
                        return SoilDataCard(soilLayer: layers[index]);
                      },
                    ),
                  );
                }
                return SizedBox();
              }

          )
        ]),
        );
  }

}
