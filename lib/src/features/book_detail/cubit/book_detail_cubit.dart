import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../shared/models/book_model.dart';
import '../graphql/book_detail_query.dart';
import 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  BookDetailCubit(this.graphQLClient) : super(Loading());

  final GraphQLClient graphQLClient;

  Future<void> getBookDetailData({
    required int id,
    bool hasError = false,
  }) async {
    try {
      emit(Loading());

      final result = await graphQLClient
          .query(
            QueryOptions(document: gql(DetailQueries.getDetailPageQuery(id))),
          )
          .timeout(const Duration(seconds: 10));

      final book = BookModel.fromJson(
        result.data!['book'] as Map<String, dynamic>,
      );

      if (hasError) {
        emit(BookDetailError());
      } else {
        emit(BookDetailPageLoaded(book: book));
      }
    } catch (error) {
      emit(BookDetailError());
    }
  }
}
