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

  final String? imgUrl;
  final String name;
  final int? bookCount;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 248.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColors.borderGrey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imgUrl!,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 20.0),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        color: AppColors.darkGrey,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      bookCount == 1 ? '$bookCount livro' : '$bookCount livros',
                      maxLines: 2,
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
              )
            ],
          ),
        ),
      );
}
