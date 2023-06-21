class DetailQueries {
  static String getDetailPageQuery(int bookId) => '''
      query detailPage {
        book(id: $bookId) {
          id
          name
          cover
          description
          isFavorite
          author {
            id
            name
          }
        }
      }
    ''';
}
