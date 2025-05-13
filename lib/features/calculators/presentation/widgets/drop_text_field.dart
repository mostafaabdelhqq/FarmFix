import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropTextField extends StatefulWidget {
  const DropTextField({
    super.key,
    required this.displayController,
    required this.valueController,
    this.width = 400,
    required this.items,
  });

  final TextEditingController displayController;
  final TextEditingController valueController;
  final int width;
  final Map<String, double> items;

  @override
  State<DropTextField> createState() => _DropTextFieldState();
}

class _DropTextFieldState extends State<DropTextField> {
  String? selectedItem;
  bool isDropdownOpened = false; // ✅ لحالة الفتح

  @override
  void initState() {
    super.initState();
    if (widget.displayController.text.isNotEmpty) {
      selectedItem = widget.displayController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width.w,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Crop Type',
          hintStyle: GoogleFonts.roboto(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xffBBBBBB),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
        ),
        value: selectedItem,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a crop';
          }
          return null;
        },
        items: widget.items.entries
            .map((entry) => DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(
                    entry.key,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value;
            widget.displayController.text = value!;
            widget.valueController.text = widget.items[value].toString();
          });
        },
        onMenuStateChange: (isOpen) {
          setState(() {
            isDropdownOpened = isOpen;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: Colors.white,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
          ),
          offset: const Offset(0, -6),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            isDropdownOpened ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: isDropdownOpened ? kPrimaryColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
