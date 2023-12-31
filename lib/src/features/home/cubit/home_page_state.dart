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
    required this.userPicture,
    this.authors,
  });

  final List<BookModel> books;
  final List<AuthorModel>? authors;
  final String userPicture;

  @override
  List<Object?> get props => [books, authors, userPicture];
}
