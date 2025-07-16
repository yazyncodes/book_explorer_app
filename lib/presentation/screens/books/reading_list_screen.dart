import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/book.dart';
import '../../../logic/cubits/book_cubit.dart';

class ReadingListScreen extends StatelessWidget {
  const ReadingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text('My Reading List'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: BlocBuilder<BookCubit, List<Book>>(
        builder: (context, books) {
          final savedBooks = books.where((b) => b.isBookmarked).toList();

          if (savedBooks.isEmpty) {
            return const Center(
              child: Text('No saved books yet.'),
            );
          }

          return ListView.builder(
            itemCount: savedBooks.length,
            itemBuilder: (context, index) {
              final book = savedBooks[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 72,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Text("Book\nCover", textAlign: TextAlign.center),
                      ),
                    ),
                    title: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(book.author),
                    trailing: IconButton(
                      icon: Icon(
                        book.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: book.isBookmarked ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        context.read<BookCubit>().toggleBookmark(book);
                      },
                    ),
                    onTap: () {
                      context.push('/book_detail', extra: book);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
