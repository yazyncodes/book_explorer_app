import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/models/book.dart';
import '/logic/cubits/book_cubit.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final isSaved = context.select<BookCubit, bool>(
      (cubit) => cubit.state.firstWhere((b) => b.id == book.id).isBookmarked,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Book Details'),
        centerTitle: true,
        leading: const BackButton(),
        actions: const [
          Icon(Icons.share, color: Colors.black87),
          SizedBox(width: 12),
          Icon(Icons.more_vert, color: Colors.black87),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            
            // Book Cover
            Center(
              child: Container(
                width: 160,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Book Cover")),
              ),
            ),
            const SizedBox(height: 24),

            // Title and Author
            Center(
              child: Column(
                children: [
                  Text(book.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("by ${book.author}",
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Rating (Static Example)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star_half, color: Colors.amber, size: 20),
                  Icon(Icons.star_border, color: Colors.amber, size: 20),
                  SizedBox(width: 8),
                  Text('4.2 (1,288 ratings)',
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Start Reading + Bookmark
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Dummy action
                    },
                    child: const Text("Start Reading"),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    context.read<BookCubit>().toggleBookmark(book);
                  },
                )
              ],
            ),
            const SizedBox(height: 24),

            // Summary
            const Text('Summary',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              book.summary,
              style: const TextStyle(color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
