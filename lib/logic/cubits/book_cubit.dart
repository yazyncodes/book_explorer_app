import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/models/book.dart';
import '/data/dummy_books.dart';

class BookCubit extends Cubit<List<Book>> {
  BookCubit() : super(dummyBooks);

  void toggleBookmark(Book book) {
    final updatedBooks = state.map((b) {
      return b.id == book.id ? b.copyWith(isBookmarked: !b.isBookmarked) : b;
    }).toList();

    emit(updatedBooks);
  }
}
