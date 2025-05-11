import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransitionBetweenTwoScreen extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const TransitionBetweenTwoScreen({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTabButton("Total Cost", 0),
          SizedBox(width: 24.w),
          buildTabButton("Per Square Meter", 1),
        ],
      ),
    );
  }

  Widget buildTabButton(String text, int index) {
    final isSelected = selectedIndex == index;
    return Column(
      children: [
        TextButton(
          onPressed: () => onTabTapped(index),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.green[700] : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Container(
          height: 3,
          width: 80,
          color: isSelected ? Colors.green[700] : Colors.transparent,
        ),
      ],
    );
  }
}
