import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../shared/models/book_model.dart';

@immutable
abstract class BookDetailState extends Equatable {}

class Loading extends BookDetailState {
  @override
  List<Object?> get props => [];
}

class BookDetailError extends BookDetailState {
  @override
  List<Object?> get props => [];
}

class BookDetailPageLoaded extends BookDetailState {
  BookDetailPageLoaded({required this.book});

  final BookModel book;

  @override
  List<Object?> get props => [book];
}
