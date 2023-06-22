import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
import '../book_detail/book_detail_page.dart';
import '../book_detail/cubit/book_detail_cubit.dart';
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
          final client = GraphQLProvider.of(context).value;

          final isLoading = state is HomePageLoading;

          final userPicture = state is HomePageLoaded ? state.userPicture : '';

          final books = state is HomePageLoaded ? state.books : <BookModel>[];

          final authors =
              state is HomePageLoaded ? state.authors : <AuthorModel>[];

          final favoriteAuthors = state is HomePageLoaded
              ? authors
                  ?.where((author) => author.isFavorite == true)
                  .toSet()
                  .toList()
              : <AuthorModel>[];

          final favoriteBooks = state is HomePageLoaded
              ? books.where((book) => book.isFavorite == true).toList()
              : <BookModel>[];

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
                                itemCount: favoriteBooks.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    FavoriteBookCardWidget(
                                  onTap: () async =>
                                      await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<BookDetailCubit>(
                                        create: (context) =>
                                            BookDetailCubit(client)
                                              ..getBookDetailData(
                                                id: int.parse(
                                                  favoriteBooks[index].id,
                                                ),
                                              ),
                                        child: BookDetailPage(
                                          id: int.parse(
                                            favoriteBooks[index].id,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  imgUrl: favoriteBooks[index].cover,
                                  bookTitle: favoriteBooks[index].name,
                                  authorName: favoriteBooks[index].author.name,
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
                                      itemCount: favoriteAuthors!.length,
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
                                        onTap: () async =>
                                            await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider<BookDetailCubit>(
                                              create: (context) =>
                                                  BookDetailCubit(client)
                                                    ..getBookDetailData(
                                                      id: int.parse(
                                                        books[index].id,
                                                      ),
                                                    ),
                                              child: BookDetailPage(
                                                id: int.parse(books[index].id),
                                              ),
                                            ),
                                          ),
                                        ),
                                        imgUrl: books[index].cover,
                                        bookTitle: books[index].name,
                                        authorName: books[index].author.name,
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
