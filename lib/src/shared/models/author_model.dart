import 'package:equatable/equatable.dart';

class AuthorModel extends Equatable {
  factory AuthorModel.fromJson(Map<String, Object?> json) => AuthorModel(
        id: json['id'] as String,
        name: json['name'] as String,
        picture: json['picture'] as String,
        booksCount: json['booksCount'] as int,
        isFavorite: json['isFavorite'] as bool,
      );

  const AuthorModel({
    required this.id,
    required this.name,
    required this.picture,
    required this.booksCount,
    required this.isFavorite,
  });

  final String id;
  final String name;
  final String picture;
  final int booksCount;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        id,
        name,
        picture,
        booksCount,
        isFavorite,
      ];
}
