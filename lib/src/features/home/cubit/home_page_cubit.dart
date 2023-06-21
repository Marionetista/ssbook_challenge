import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../shared/models/author_model.dart';
import '../../../shared/models/book_model.dart';
import '../graphql/home_queries.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.graphQLClient) : super(HomePageLoading());

  final GraphQLClient graphQLClient;

  Future<void> getBooks({
    bool hasError = false,
  }) async {
    try {
      emit(HomePageLoading());

      final result = await graphQLClient
          .query(QueryOptions(document: gql(HomeQueries.homeData)))
          .timeout(const Duration(seconds: 10));

      final favoriteBooks = result.data!['favoriteBooks'] as List<dynamic>;
      final allBooks = result.data!['allBooks'] as List<dynamic>;
      final allAuthors = result.data!['favoriteAuthors'] as List<dynamic>;

      final books = allBooks
          .map((item) => BookModel.fromJson(item as Map<String, dynamic>))
          .toList();

      final favorites = favoriteBooks
          .map((item) => BookModel.fromJson(item as Map<String, dynamic>))
          .toList();

      final favoriteAuthors = allAuthors
          .map((item) => AuthorModel.fromJson(item as Map<String, dynamic>))
          .toList();

      if (hasError) {
        emit(HomePageError());
      } else {
        emit(
          HomePageLoaded(
            books: books,
            favoriteBooks: favorites,
            favoriteAuthors: favoriteAuthors,
          ),
        );
      }
    } catch (error) {
      emit(HomePageError());
    }
  }
}
