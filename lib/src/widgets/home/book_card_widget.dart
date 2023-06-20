import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://m.media-amazon.com/images/I/41gr3r3FSWL._SY346_.jpg',
                width: 48.0,
                height: 70.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'O duque e eu (Os Bridgertons Chupetas Serie No Netflix e Afins & Etc Nao Compre Esse Livro)',
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
                    'Julia Quinn',
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
      );
}
