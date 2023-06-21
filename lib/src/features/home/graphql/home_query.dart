class HomeQueries {
  static const String homePageData = '''
query homePage{
  userPicture
  allBooks{
    id
    name
    cover
    isFavorite
    author {
      id
      name
      picture
      booksCount
      isFavorite
    }
  }
}
  ''';
}
