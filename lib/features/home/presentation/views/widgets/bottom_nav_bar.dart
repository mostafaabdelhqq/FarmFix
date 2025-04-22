import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/cryptocurrency.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: const BoxDecoration(),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: kSecondryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kChatbot);
                },
                child: const Iconify(Cryptocurrency.chat,
                    size: 33, color: Colors.grey),
              ),
              activeIcon: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kChatbot);
                },
                child: const Iconify(Cryptocurrency.chat,
                    size: 36, color: Colors.black),
              ),
              label: 'Chat',
            ),
             BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: (){GoRouter.of(context).push(AppRoutes.kCamera);},
                  child: const Iconify(Ion.scan_circle, size: 33, color: Colors.grey)),
              activeIcon:
                  GestureDetector(
                      onTap: (){GoRouter.of(context).push(AppRoutes.kCamera);},
                      child: const Iconify(Ion.scan_circle, size: 36, color: Colors.black)),
              label: 'Scan',
            ),
            const BottomNavigationBarItem(
              icon: Iconify(Mdi.google_earth, size: 33, color: Colors.grey),
              activeIcon:
                  Iconify(Mdi.google_earth, size: 36, color: Colors.black),
              label: 'Search',
            ),

          ],
        ),
      ),
    );
  }
}
