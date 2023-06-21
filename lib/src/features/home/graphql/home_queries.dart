class HomeQueries {
  static const String homeData = '''
query paginaPrincipal {
  userPicture
  favoriteBooks {
    id
    name
    cover
    isFavorite
    description
    author {
      id
      name
      picture
      booksCount
      isFavorite
    }
  }
  allBooks {
    id
    name
    cover
    description
    isFavorite
    author {
      id
      name
      picture
      booksCount
      isFavorite
    }
  }
  favoriteAuthors {
    id
    name
    picture
    booksCount
    isFavorite
  }
}
  ''';
}
