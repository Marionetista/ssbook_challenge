import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../shared/models/author_model.dart';
import '../../../shared/models/book_model.dart';

@immutable
abstract class HomePageState extends Equatable {}

class HomePageLoading extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageError extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageLoaded extends HomePageState {
  HomePageLoaded({
    required this.books,
    required this.favoriteBooks,
    required this.favoriteAuthors,
    required this.userPicture,
  });

  final List<BookModel> books;
  final List<BookModel> favoriteBooks;
  final List<AuthorModel> favoriteAuthors;
  final String userPicture;

  @override
  List<Object?> get props => [
        books,
        favoriteBooks,
        favoriteAuthors,
        userPicture,
      ];
}
