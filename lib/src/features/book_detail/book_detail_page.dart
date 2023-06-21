import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';
import '../../widgets/home/bottom_app_bar_widget.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({
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
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: const BottomAppBarWidget(),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.6,
                maxChildSize: 1.0,
                minChildSize: 0.6,
                builder: (context, scrollController) => Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              widget.bookTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                color: AppColors.darkGrey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                widget.authorName,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.roboto(
                                  color: AppColors.darkGrey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.favorite_border,
                              color: AppColors.darkGrey,
                              size: 25.0,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            widget.description,
                            style: GoogleFonts.roboto(
                              color: AppColors.darkGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
