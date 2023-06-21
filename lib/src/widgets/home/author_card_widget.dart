import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class AuthorCardWidget extends StatelessWidget {
  const AuthorCardWidget({
    required this.imgUrl,
    required this.name,
    required this.bookCount,
    super.key,
  });

  final String imgUrl;
  final String name;
  final int bookCount;

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
              name,
              style: GoogleFonts.roboto(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              bookCount == 1 ? '$bookCount livro' : '$bookCount livros',
              style: GoogleFonts.roboto(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            leading: Image.network(
              imgUrl,
              width: 63.0,
              height: 67.0,
            ),
          ),
        ),
      );
}
