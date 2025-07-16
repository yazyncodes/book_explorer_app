// lib/data/models/book.dart

class Book {
  final String id;
  final String title;
  final String author;
  final String summary;
  final String imageUrl;
  final String category;
  final bool isBookmarked;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.summary,
    required this.imageUrl,
    required this.category,
    this.isBookmarked = false,
  });

  Book copyWith({bool? isBookmarked}) {
    return Book(
      id: id,
      title: title,
      author: author,
      summary: summary,
      imageUrl: imageUrl,
      category: category,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
