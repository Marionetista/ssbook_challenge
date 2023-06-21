import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/colors/app_colors.dart';
import '../../shared/models/author_model.dart';
import '../../shared/models/book_model.dart';
import '../../widgets/home/app_bar_widget.dart';
import '../../widgets/home/author_card_widget.dart';
import '../../widgets/home/book_card_widget.dart';
import '../../widgets/home/bottom_app_bar_widget.dart';
import '../../widgets/home/cathegory_widget.dart';
import '../../widgets/home/favorite_book_card_widget.dart';
import '../../widgets/home/section_title_widget.dart';
import 'cubit/home_page_cubit.dart';
import 'cubit/home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final isLoading = state is HomePageLoading;

          final favoritesBooks =
              state is HomePageLoaded ? state.favoriteBooks : <BookModel>[];

          final books = state is HomePageLoaded ? state.books : <BookModel>[];

          final favoriteAuthors =
              state is HomePageLoaded ? state.favoriteAuthors : <AuthorModel>[];

          final userPicture = state is HomePageLoaded ? state.userPicture : '';

          return Scaffold(
            backgroundColor: AppColors.purpleGrey,
            appBar: AppBarWidget(userIcon: userPicture),
            body: SafeArea(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.purple,
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          const SectionTitleWidget(
                            title: 'Livros favoritos',
                            hasSeeAllButton: true,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 32.0),
                            child: SizedBox(
                              height: 270,
                              child: ListView.separated(
                                itemCount: favoritesBooks.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    FavoriteBookCardWidget(
                                  imgUrl: favoritesBooks[index].cover,
                                  bookTitle: favoritesBooks[index].name,
                                  authorName: favoritesBooks[index].author.name,
                                  description:
                                      favoritesBooks[index].description,
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(42.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SectionTitleWidget(
                                  title: 'Autores favoritos',
                                  hasSeeAllButton: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: SizedBox(
                                    height: 69.0,
                                    child: ListView.separated(
                                      itemCount: favoriteAuthors.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          AuthorCardWidget(
                                        imgUrl: favoriteAuthors[index].picture,
                                        name: favoriteAuthors[index].name,
                                        bookCount:
                                            favoriteAuthors[index].booksCount,
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(width: 20),
                                    ),
                                  ),
                                ),
                                const SectionTitleWidget(
                                  title: 'Biblioteca',
                                  hasSeeAllButton: false,
                                ),
                                const CategoryWidget(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 20.0,
                                  ),
                                  child: LayoutBuilder(
                                    builder: (
                                      BuildContext context,
                                      BoxConstraints constraints,
                                    ) =>
                                        ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: books.length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 20),
                                      itemBuilder: (context, index) =>
                                          BookCardWidget(
                                        imgUrl: books[index].cover,
                                        bookTitle: books[index].name,
                                        authorName: books[index].author.name,
                                        description: books[index].description,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            bottomNavigationBar: const BottomAppBarWidget(),
          );
        },
      );
}
