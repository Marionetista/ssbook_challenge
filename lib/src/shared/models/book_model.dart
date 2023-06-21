import 'package:equatable/equatable.dart';

import 'author_model.dart';

class BookModel extends Equatable {
  factory BookModel.fromJson(Map<String, Object?> json) => BookModel(
        id: json['id'] as String,
        name: json['name'] as String,
        author: AuthorModel.fromJson(json['author'] as Map<String, Object?>),
        cover: json['cover'] as String,
        isFavorite: json['isFavorite'] as bool,
      );

  const BookModel({
    required this.id,
    required this.name,
    required this.author,
    required this.cover,
    required this.isFavorite,
  });

  final String id;
  final String name;
  final AuthorModel author;
  final String cover;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        id,
        name,
        author,
        cover,
        isFavorite,
      ];
}
