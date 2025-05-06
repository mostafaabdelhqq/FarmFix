
import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/uil.dart';

class BottomNavBar extends StatefulWidget {

   const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> {


  final routes = [
    AppRoutes.kHomeView,
    AppRoutes.kChatbot,
    AppRoutes.kLandScanner,
    AppRoutes.kSettingsView];

  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).path;

    if (location!.startsWith(AppRoutes.kHomeView)) {

      return 0;
    }
    if (location.startsWith(AppRoutes.kChatbot)) {

      return 1;
    }
    if (location.startsWith(AppRoutes.kLandScanner)) {

      return 2;
    }
    if (location.startsWith(AppRoutes.kSettingsView)) {

      return 3;
    }

    return 0; // default
  }



  @override
  Widget build(BuildContext context) {
    int currentIndex =getCurrentIndex(context);
    void onItemTapped(int index) {
      setState(() {
        if(currentIndex == index) {
          return;
        }else {

          GoRouter.of(context).push(routes[index]);

        }
      });


    }
    return BottomAppBar(
      // padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      shape: const CircularNotchedRectangle(),
      color: Colors.black87,



      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index){
          final icons = [
            Uil.home_alt,
            Mdi.chat_processing_outline,
            Mdi.google_earth,
            MaterialSymbols.settings_outline_rounded,
        ];
          final isSelected = currentIndex==index;

          if(isSelected ) {
           return InkWell(

          onTap: () => onItemTapped(index),
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.all(6),
          child: Iconify(icons[index], size: 32, color: kSecondaryColor,)

          ),
          );}

               return InkWell(
          onTap: () => onItemTapped(index),
          child: Container(
              padding: EdgeInsets.all(6),
              child: Iconify(icons[index], size: 32, color:  kSecondaryColor,)
          ),
          );})

      ),
    );



  }
}
