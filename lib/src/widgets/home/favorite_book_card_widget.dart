import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class FavoriteBookCardWidget extends StatelessWidget {
  const FavoriteBookCardWidget({
    required this.imgUrl,
    required this.bookTitle,
    required this.authorName,
    required this.onTap,
    super.key,
  });

  final String imgUrl;
  final String bookTitle;
  final String authorName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 136.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.fill,
                  height: 198.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                bookTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  color: AppColors.darkGrey,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                authorName,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  color: AppColors.darkGrey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
}
