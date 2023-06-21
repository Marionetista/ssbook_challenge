import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/book_detail/book_detail_page.dart';
import '../../shared/colors/app_colors.dart';

class FavoriteBookCardWidget extends StatefulWidget {
  const FavoriteBookCardWidget({
    required this.imgUrl,
    required this.bookTitle,
    required this.authorName,
    super.key,
  });

  final String imgUrl;
  final String bookTitle;
  final String authorName;

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
                  widget.imgUrl,
                  fit: BoxFit.fill,
                  height: 198.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                widget.bookTitle,
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
                widget.authorName,
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
