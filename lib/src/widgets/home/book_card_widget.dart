import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/book_detail/book_detail_page.dart';
import '../../shared/colors/app_colors.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({
    required this.imgUrl,
    required this.bookTitle,
    required this.authorName,
    required this.description,
    super.key,
  });

  final String imgUrl;
  final String bookTitle;
  final String authorName;
  final String description;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BookDetailPage(
                imgUrl: imgUrl,
                bookTitle: bookTitle,
                authorName: authorName,
                description: description,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imgUrl,
                fit: BoxFit.fill,
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
                    bookTitle,
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
                    authorName,
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
