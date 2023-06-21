import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/colors/app_colors.dart';
import '../../widgets/book_detail/header_widget.dart';
import '../../widgets/home/bottom_app_bar_widget.dart';
import 'cubit/book_detail_cubit.dart';
import 'cubit/book_detail_state.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({
    required this.id,
    super.key,
  });

  final int id;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<BookDetailCubit, BookDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          final isLoading = state is Loading;

          final book = state is BookDetailPageLoaded ? state.book : null;

          return Scaffold(
            bottomNavigationBar: const BottomAppBarWidget(),
            body: SafeArea(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.purple,
                      ),
                    )
                  : Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            book!.cover,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const HeaderWidget(),
                        DraggableScrollableSheet(
                          initialChildSize: 0.6,
                          maxChildSize: 1.0,
                          minChildSize: 0.6,
                          builder: (context, scrollController) => Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                              ),
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
                                        book.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                          color: AppColors.darkGrey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          book.author.name,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.roboto(
                                            color: AppColors.darkGrey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      trailing: Icon(
                                        book.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: book.isFavorite
                                            ? AppColors.purple
                                            : AppColors.darkGrey,
                                        size: 25.0,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Text(
                                      book.description ?? '',
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
        },
      );
}
