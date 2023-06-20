import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class AuthorCardWidget extends StatelessWidget {
  const AuthorCardWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 248.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColors.borderGrey),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.only(),
            title: Text(
              'Connie Brockway',
              style: GoogleFonts.roboto(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              '6 Livros',
              style: GoogleFonts.roboto(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            leading: Image.network(
              'https://i.harperapps.com/authors/15851/x500.JPG',
              width: 63.0,
              height: 67.0,
            ),
          ),
        ),
      );
}
