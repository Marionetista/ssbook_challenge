import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    required this.title,
    required this.hasSeeAllButton,
    super.key,
  });

  final String title;
  final bool hasSeeAllButton;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 32.0,
          bottom: 21.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                color: AppColors.darkGrey,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            hasSeeAllButton
                ? InkWell(
                    onTap: () {},
                    child: Text(
                      'ver todos',
                      style: GoogleFonts.roboto(
                        color: AppColors.purple,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
}
