import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    required this.isSelected,
    required this.label,
    super.key,
  });

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Chip(
          backgroundColor: isSelected ? AppColors.purple : Colors.white,
          label: Text(
            label,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.lightGrey,
            ),
          ),
          shape: StadiumBorder(
            side: BorderSide(
              color: isSelected ? AppColors.purple : AppColors.borderGrey,
            ),
          ),
        ),
      );
}
