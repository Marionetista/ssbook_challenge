import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/book_detail/book_detail_page.dart';
import '../../shared/colors/app_colors.dart';

class FavoriteBookCardWidget extends StatefulWidget {
  const FavoriteBookCardWidget({super.key});

  @override
  State<FavoriteBookCardWidget> createState() => _FavoriteBookCardWidgetState();
}

class _FavoriteBookCardWidgetState extends State<FavoriteBookCardWidget> {
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BookDetailPage(),
            ),
          );
        },
        child: SizedBox(
          width: 136.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://m.media-amazon.com/images/I/41gr3r3FSWL._SY346_.jpg',
                  width: 136.0,
                  height: 198.0,
                ),
              ),
              const SizedBox(height: 10.0),
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
              const SizedBox(height: 2.0),
              Text(
                'Julia Quinn',
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
