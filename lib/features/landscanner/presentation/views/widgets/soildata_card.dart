import'package:flutter/material.dart';

import '../../../data/model/SoilLayers.dart';

class SoilDataCard extends StatelessWidget {
  final SoilLayers soilLayer;

  const SoilDataCard({super.key, required this.soilLayer});

  @override
  Widget build(BuildContext context) {
    final firstDepth = soilLayer.depths?.isNotEmpty == true
        ? soilLayer.depths![0]
        : null;

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(color:const Color(0xff009951).withOpacity(.5),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(firstDepth?.label??''),
        Container(
          width: 100,
          height: 40,
          decoration:BoxDecoration(color:const Color(0xff00BA63).withOpacity(.5),),
          child: Text(firstDepth?.label??'',style: const TextStyle(color: Colors.white),),),
        const Divider(color: Colors.white,),
        Text('${firstDepth?.values?.mean}')
      ],),

    );
  }
}
