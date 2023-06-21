import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../shared/models/author_model.dart';
import '../../../shared/models/book_model.dart';
import '../graphql/home_query.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.graphQLClient) : super(HomePageLoading());

  final GraphQLClient graphQLClient;

  Future<void> getHomePageData({
    bool hasError = false,
  }) async {
    try {
      emit(HomePageLoading());

      final result = await graphQLClient
          .query(QueryOptions(document: gql(HomeQueries.homePageData)))
          .timeout(const Duration(seconds: 10));

      final userPicture = result.data!['userPicture'] as String;

      final book = result.data!['allBooks'] as List<dynamic>;

      final author = (result.data!['allBooks'] as List<dynamic>)
          .map((book) => book['author'])
          .toList();

      final allBooks = book
          .map((item) => BookModel.fromJson(item as Map<String, dynamic>))
          .toList();

      final allAuthors = author
          .map((item) => AuthorModel.fromJson(item as Map<String, dynamic>))
          .toList();

      if (hasError) {
        emit(HomePageError());
      } else {
        emit(
          HomePageLoaded(
            books: allBooks,
            authors: allAuthors,
            userPicture: userPicture,
          ),
        );
      }
    } catch (error) {
      emit(HomePageError());
    }
  }
}
